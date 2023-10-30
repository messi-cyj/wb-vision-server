package com.ruoyi.framework.api.service;

import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.framework.web.service.TokenService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import java.util.List;
import java.util.Map;

@Slf4j
@Component
public class WebSocketAuthService extends ServerEndpointConfig.Configurator {

//    @Autowired
//    private TokenService tokenService;

    @Override
    public boolean checkOrigin(String originHeaderValue) {
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = servletRequestAttributes.getRequest();
        TokenService tokenService = SpringUtils.getBean(TokenService.class);
        String token = request.getParameter("token");
        LoginUser user = tokenService.getLoginUser(token);
        if (user == null) {
            return false;
        }
        return super.checkOrigin(originHeaderValue);
    }

    @Override
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
        super.modifyHandshake(sec, request, response);
        List<String> tokens = request.getParameterMap().get("token");
        if (tokens.size() > 0) {
            String token = tokens.get(0);
            TokenService tokenService = SpringUtils.getBean(TokenService.class);
            LoginUser user = tokenService.getLoginUser(token);
            sec.getUserProperties().put("token", token);
            sec.getUserProperties().put("user", user);
        }
    }


}
