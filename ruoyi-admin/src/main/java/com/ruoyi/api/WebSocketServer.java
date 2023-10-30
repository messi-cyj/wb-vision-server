package com.ruoyi.api;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.framework.api.service.WebSocketAuthService;
import com.ruoyi.system.domain.BizMember;
import com.ruoyi.system.domain.BizTeachingRecord;
import com.ruoyi.system.domain.vo.WebSocketDataVo;
import com.ruoyi.system.domain.vo.WebSocketMessageVo;
import com.ruoyi.system.service.IBizMemberService;
import com.ruoyi.system.service.IBizTeachingRecordService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.Map;
import java.util.concurrent.*;

@Slf4j
@Service
@ServerEndpoint(value = "/api/ws/teaching/{teachingId}", configurator = WebSocketAuthService.class)
public class WebSocketServer {

    private static Map<Long, Map<String, WebSocketServer>> teachingWebSocketMap = new ConcurrentHashMap<>();
    private static Map<Long, WebSocketMessageVo<WebSocketDataVo>> teachingMessageMap = new ConcurrentHashMap<>();

    private Session session;

    private IBizMemberService memberService;
    private IBizTeachingRecordService teachingRecordService;

    private BizMember member;

    private static ExecutorService poolService = Executors.newSingleThreadExecutor();
    private static ScheduledExecutorService scheduledExecutorService = Executors.newSingleThreadScheduledExecutor();

    @PostConstruct
    public void init() {
        memberService = SpringUtils.getBean(IBizMemberService.class);
        teachingRecordService = SpringUtils.getBean(IBizTeachingRecordService.class);

        scheduledExecutorService.scheduleAtFixedRate(() -> {
            log.info("[WebSocketServer] Current websocket server, teaching count: {}", teachingWebSocketMap.size());
            for (Long teachingRecordId : teachingWebSocketMap.keySet()) {
                log.info("[WebSocketServer] Current teaching: {}, connection count: {}", teachingRecordId, teachingWebSocketMap.get(teachingRecordId).size());
            }
        }, 30, 30, TimeUnit.SECONDS);
    }

    @OnOpen
    public synchronized void onOpen(Session session, @PathParam("teachingId") Long teachingId) {
        memberService = SpringUtils.getBean(IBizMemberService.class);
        teachingRecordService = SpringUtils.getBean(IBizTeachingRecordService.class);

        BizTeachingRecord teachingRecord = teachingRecordService.selectBizTeachingRecordById(teachingId);
        if (teachingRecord == null || !teachingRecord.getStatus().equals(UserConstants.TEACHING_STATUS_RUNNING)) {
            log.warn("[WebSocket] Teaching record not found or status not running, ignore connection");
            try {
                session.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            return;
        }
        this.session = session;
        LoginUser user =  (LoginUser) session.getUserProperties().get("user");
        BizMember member = memberService.selectBizMemberByUserId(user.getUsername());
        if (member == null) {
            log.warn("[WebSocket] user not found");
            try {
                session.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            return;
        }
        this.member = member;
        if (teachingWebSocketMap.get(teachingId) == null) {
            Map<String, WebSocketServer> socketServerMap = new ConcurrentHashMap<>();
            teachingWebSocketMap.put(teachingId, socketServerMap);
        }
        teachingWebSocketMap.get(teachingId).put(session.getId(), this);

        if (member.getUserType().equals(UserConstants.UserType_Student)) {
            WebSocketMessageVo<WebSocketDataVo> messageVo = teachingMessageMap.get(teachingId);
            if (messageVo != null) {
                poolService.submit(() -> {
                    try {
                        Thread.sleep(2000);
                        WebSocketMessageVo<WebSocketDataVo> result = teachingMessageMap.get(teachingId);
                        result.setCode(200);
                        session.getAsyncRemote().sendText(JSON.toJSONString(result));
                    } catch (Exception e) {
                        log.error("onOpen send message failed", e);
                    }
                });
            }
        }

        log.info("new connection");
    }

    @OnClose
    public synchronized void onClose(@PathParam("teachingId") Long teachingId, Session session, CloseReason reason) {
        teachingWebSocketMap.get(teachingId).remove(session.getId());
        log.info("close, error: {}", reason.toString());
    }

    @OnMessage
    public synchronized void onMessage(@PathParam("teachingId") Long teachingId, String text, Session session) {
        if (!member.getUserType().equals(UserConstants.UserType_Teacher)) {
            return;
        }
        WebSocketMessageVo result = new WebSocketMessageVo();
        result.setMsg("ok");
        WebSocketMessageVo<WebSocketDataVo> messageVo = null;
        try {
            messageVo = JSON.parseObject(text, new TypeReference<WebSocketMessageVo<WebSocketDataVo>>() {});
        } catch (Exception e) {
            result.setCode(500);
            result.setMsg("Parse data error");
            session.getAsyncRemote().sendText(JSON.toJSONString(result));
            return;
        }
        Map<String, WebSocketServer> socketServerMap = teachingWebSocketMap.get(teachingId);
        teachingMessageMap.put(teachingId, messageVo);

        for (String sId : socketServerMap.keySet()) {
            try {
                if (session.getId().equals(sId)) {
                    continue;
                }
                WebSocketServer target = socketServerMap.get(sId);
                if (target == null) {
                    continue;
                }
                messageVo.setCode(200);
                target.session.getAsyncRemote().sendText(JSON.toJSONString(messageVo));
            } catch (Exception e) {
                log.warn("Failed send message to sid: {}", sId);
            }
        }

        session.getAsyncRemote().sendText(JSON.toJSONString(result));
    }

    @OnError
    public synchronized void onError(@PathParam("teachingId") Long teachingId, Session session, Throwable t) {
        teachingWebSocketMap.get(teachingId).remove(session.getId());
        log.info("error: ", t);
    }

}
