package com.ruoyi.framework.api.service;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.exception.user.UserPasswordNotMatchException;
import com.ruoyi.common.utils.MessageUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.manager.AsyncManager;
import com.ruoyi.framework.manager.factory.AsyncFactory;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.domain.BizAttendance;
import com.ruoyi.system.domain.BizClassroom;
import com.ruoyi.system.domain.BizDesk;
import com.ruoyi.system.domain.BizMember;
import com.ruoyi.system.domain.vo.BizTeachingRecordVo;
import com.ruoyi.system.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Component
public class ApiLoginService {

    @Resource
    private AuthenticationManager authenticationManager;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private IBizAttendanceService attendanceService;

    @Autowired
    private IBizTeachingRecordService teachingRecordService;

    @Autowired
    private IBizMemberService memberService;

    @Autowired
    private IBizDeskService deskService;

    @Autowired
    private IBizClassroomService classroomService;

    @Transactional
    public String login(String username, String password, String classroomNo, String deskNo)
    {
        if (StringUtils.isBlank(classroomNo) || StringUtils.isBlank(deskNo)) {
            throw new ServiceException("教室和桌子均不能为空");
        }
        BizClassroom classroom = classroomService.selectBizClassroomByNo(classroomNo);
        if (classroom == null) {
            throw new ServiceException("教室不存在");
        }
        BizDesk desk = deskService.selectBizDeskByNo(classroom.getId(), deskNo);
        if (desk == null) {
            throw new ServiceException("桌子不存在");
        }

        // 用户验证
        Authentication authentication = null;
        try
        {
            // 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
            authentication = authenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(username, password));
        }
        catch (Exception e)
        {
            if (e instanceof BadCredentialsException)
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
                throw new UserPasswordNotMatchException();
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, e.getMessage()));
                throw new ServiceException(e.getMessage());
            }
        }
        AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success")));
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();

        BizMember member = memberService.selectBizMemberByUserId(loginUser.getUsername());
        if (member != null && member.getUserType().equals(UserConstants.UserType_Student)) {
            BizTeachingRecordVo teachingRecord = teachingRecordService.getLatestTeachingRecord(member.getAcademyId(), member.getMajorId(), member.getGradeId(), member.getClassId());
            if (teachingRecord != null) {
                attendanceService.createAttendance(teachingRecord.getId(), username, classroomNo, deskNo);
            }
        }
        if (member != null && member.getUserType().equals(UserConstants.UserType_Teacher)) {
            // 教室桌
            if (!desk.getType().equals(1)) {
                throw new ServiceException("老师只能在教室桌登录");
            }
        }

        // 生成token
        return tokenService.createToken(loginUser);
    }

    public String faceLogin(String username, String classroomNo, String deskNo)
    {
        BizMember member = memberService.selectBizMemberByUserId(username);
        if (member == null) {
            return "";
        }
        if (member.getUserType().equals(UserConstants.UserType_Student)) {
            BizTeachingRecordVo teachingRecord = teachingRecordService.getLatestTeachingRecord(member.getAcademyId(), member.getMajorId(), member.getGradeId(), member.getClassId());
            if (teachingRecord != null) {
                attendanceService.createAttendance(teachingRecord.getId(), username, classroomNo, deskNo);
            }
        }
        LoginUser loginUser = new LoginUser();
        SysUser user = new SysUser();
        user.setUserId(member.getId());
        user.setUserName(member.getUserId());
        user.setPassword(member.getPassword());
        user.setEmail(member.getEmail());
        loginUser.setUser(user);

        // 生成token
        return tokenService.createToken(loginUser);
    }


    public void logout(String token) {
        tokenService.delLoginUser(token);
    }

}
