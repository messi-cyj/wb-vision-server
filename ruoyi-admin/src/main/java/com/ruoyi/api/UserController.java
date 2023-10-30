package com.ruoyi.api;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.ClientLoginBody;
import com.ruoyi.common.core.domain.model.LoginBody;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.api.service.ApiLoginService;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.BizAttendanceVo;
import com.ruoyi.system.domain.vo.BizMemberVo;
import com.ruoyi.system.domain.vo.BizTeachingRecordVo;
import com.ruoyi.system.service.*;
import org.joda.time.DateTime;
import org.joda.time.Seconds;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/user")
public class UserController extends BaseController {

    @Autowired
    private ApiLoginService loginService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private IBizMemberService memberService;

    @Autowired
    private IBizGradeService gradeService;

    @Autowired
    private IBizClassService classService;

    @Autowired
    private IBizMajorService majorService;

    @Autowired
    private IBizAcademyService academyService;

    @Autowired
    private IBizClassroomService classroomService;

    @Autowired
    private IBizTeachingRecordService teachingRecordService;

    @Autowired
    private IBizAttendanceService attendanceService;

    @Autowired
    private IBizDeskService deskService;

    @PostMapping("/login")
    public AjaxResult login(@RequestBody ClientLoginBody loginBody, HttpServletRequest request) {
        // 生成令牌
        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getClassroomNo(), loginBody.getDeskNo());
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("token", token);
        BizMember member = memberService.selectBizMemberByUserId(loginBody.getUsername());
        resultMap.put("userType", member.getUserType());
        return AjaxResult.success("操作成功", resultMap);
    }

    @PostMapping("/face/login")
    public AjaxResult faceLogin(@RequestBody ClientLoginBody loginBody) {
        // 生成令牌
        String token = loginService.faceLogin(loginBody.getUsername(), loginBody.getClassroomNo(), loginBody.getDeskNo());
        if (StringUtils.isBlank(token)) {
            return AjaxResult.error("用户不存在");
        }
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("token", token);
        BizMember member = memberService.selectBizMemberByUserId(loginBody.getUsername());
        if (member != null) {
            resultMap.put("userType", member.getUserType());
        }
        return AjaxResult.success("操作成功", resultMap);
    }

    @PostMapping("/logout")
    public AjaxResult logout() {
        loginService.logout(getLoginUser().getToken());
        return AjaxResult.success();
    }

    @PostMapping("/modifyPwd")
    public AjaxResult modifyPwd(@RequestBody ClientLoginBody loginBody) {
        memberService.modifyPassword(loginBody.getUsername(), loginBody.getOldPassword(), loginBody.getPassword());
        return AjaxResult.success("操作成功", loginBody.getUsername());
    }

    @GetMapping("/self")
    public AjaxResult getSelf(HttpServletRequest request, @RequestParam(value = "classroomNo", required = false) String classroomNo,
                              @RequestParam(value = "deskNo", required = false) String deskNo)
    {
        LoginUser loginUser = getLoginUser();
        if (loginUser == null) {
            return new AjaxResult(401, "不存在该会话");
        }
        BizMember dbUser = memberService.selectBizMemberByUserId(loginUser.getUsername());
        if (dbUser == null) {
            return AjaxResult.error("User not found");
        }
        BizMemberVo result = new BizMemberVo();
        BeanUtils.copyProperties(dbUser, result);

        if (StringUtils.isNotBlank(classroomNo) && StringUtils.isNotBlank(deskNo)) {
            BizClassroom classroom = classroomService.selectBizClassroomByNo(classroomNo);
            if (classroom != null) {
                BizDesk desk = deskService.selectBizDeskByNo(classroom.getId(), deskNo);
                if (desk != null) {
                    result.setDeskName(desk.getName());
                }
            }
        }

        if (dbUser.getAcademyId() != null) {
            BizAcademy academy = academyService.selectBizAcademyById(dbUser.getAcademyId());
            if (academy != null)
                result.setAcademyName(academy.getName());
        }
        if (dbUser.getClassId() != null) {
            BizClass bizClass = classService.selectBizClassById(dbUser.getClassId());
            if (bizClass != null)
                result.setClassName(bizClass.getName());
        }
        if (dbUser.getGradeId() != null) {
            BizGrade bizGrade = gradeService.selectBizGradeById(dbUser.getGradeId());
            if (bizGrade != null)
                result.setGradeName(bizGrade.getName());
        }
        if (dbUser.getMajorId() != null) {
            BizMajor bizMajor = majorService.selectBizMajorById(dbUser.getMajorId());
            if (bizMajor != null)
                result.setMajorName(bizMajor.getName());
        }
        if (StringUtils.isNotBlank(dbUser.getAvatar())) {
            result.setAvatar("/profile" + dbUser.getAvatar().split("/profile")[1]);
        }

        return AjaxResult.success(result);
    }

    @GetMapping("/attendance/list")
    public AjaxResult getAttendanceList(@RequestParam("teachingRecordId") Long teachingRecordId) {
        BizTeachingRecord teachingRecord = teachingRecordService.selectBizTeachingRecordById(teachingRecordId);
        if (teachingRecord == null) {
            return AjaxResult.error("不存在教学记录");
        }
        BizMember condition = new BizMember();
        condition.setAcademyId(teachingRecord.getAcademyId());
        condition.setMajorId(teachingRecord.getMajorId());
        condition.setGradeId(teachingRecord.getGradeId());
        condition.setClassId(teachingRecord.getClassId());
        condition.setUserType(2);
        List<BizMemberVo> studentList = memberService.selectBizMemberList(condition);

        BizAttendance attendance = new BizAttendance();
        attendance.setTeachingRecordId(teachingRecordId);
        List<BizAttendanceVo> attendanceList = attendanceService.selectBizAttendanceList(attendance);
        Map<String, BizAttendanceVo> attendanceMap = attendanceList.parallelStream().collect(Collectors.toMap(BizAttendance::getStudentId, it -> it));
        List<BizAttendanceVo> results = studentList.parallelStream().map(it -> {
            BizAttendanceVo result = new BizAttendanceVo();
            BizAttendance bizAttendance = attendanceMap.get(it.getUserId());
            if (bizAttendance != null) {
                long startMs = teachingRecord.getStartTime().getTime();
                long attendanceMs = bizAttendance.getCreateTime().getTime();
                if (attendanceMs - startMs > 5 * 60 * 1000) {
                    result.setStatus("delay");
                } else {
                    result.setStatus("normal");
                }
                long diff = (attendanceMs - startMs) / 1000 / 60;
                result.setDelayTime((diff > 0 ? diff : 0) + " min");
                if (bizAttendance.getDeskId() != null) {
                    BizDesk desk = deskService.selectBizDeskById(bizAttendance.getDeskId());
                    if (desk != null) {
                        result.setDeskName(desk.getName());
                    }
                }
            } else {
                result.setStatus("unknown");
            }
            result.setStudentName(it.getName());
            result.setStudentNo(it.getUserId());
            return result;
        }).collect(Collectors.toList());

        return AjaxResult.success(results);
    }

}
