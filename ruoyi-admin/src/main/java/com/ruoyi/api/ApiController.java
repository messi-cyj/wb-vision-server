package com.ruoyi.api;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.*;
import com.ruoyi.system.service.*;
import org.apache.commons.compress.utils.Lists;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
public class ApiController extends BaseController {

    @Autowired
    private IBizAttendanceService attendanceService;

    @Autowired
    private IBizMemberService memberService;

    @Autowired
    private IBizTeachingRecordService teachingRecordService;

    @Autowired
    private IBizDeskService deskService;

    @Autowired
    private IBizDeviceService deviceService;

    @Autowired
    private IBizDeskDeviceService deskDeviceService;

    @Autowired
    private IBizMajorService majorService;

    @Autowired
    private IBizGradeService gradeService;

    @Autowired
    private IBizClassService classService;

    @Autowired
    private IBizCourseService courseService;

    @Autowired
    private IBizAcademyService academyService;

    @Autowired
    private IBizClassroomService classroomService;

    @GetMapping("/teachingRecord/teacher")
    public AjaxResult getTeachingRecord(@RequestParam("majorId") Long majorId,
                                        @RequestParam("gradeId") Long gradeId,
                                        @RequestParam("classId") Long classId,
                                        @RequestParam("courseId") Long courseId) {
        LoginUser loginUser = getLoginUser();
        if (loginUser == null) {
            return new AjaxResult(401, "不存在该会话");
        }
        BizMember dbUser = memberService.selectBizMemberByUserId(loginUser.getUsername());
        if (dbUser == null) {
            return AjaxResult.error("User not found");
        }
        BizTeachingRecordVo teachingRecordVo = teachingRecordService.getLatestTeachingRecordByCourseId(dbUser.getAcademyId(),
                majorId, gradeId, classId, courseId, dbUser.getUserId());
        return AjaxResult.success(teachingRecordVo);
    }

    @GetMapping("/teachingRecord/student")
    public AjaxResult getStudentTeachingRecord() {
        LoginUser loginUser = getLoginUser();
        if (loginUser == null) {
            return new AjaxResult(401, "不存在该会话");
        }
        BizMember dbUser = memberService.selectBizMemberByUserId(loginUser.getUsername());
        if (dbUser == null) {
            return AjaxResult.error("User not found");
        }
        BizTeachingRecordVo teachingRecord = teachingRecordService.getLatestTeachingRecord(dbUser.getAcademyId(), dbUser.getMajorId(), dbUser.getGradeId(), dbUser.getClassId());
        return AjaxResult.success(teachingRecord);
    }

    // 获取该教学记录下某个课桌的签到情况
    @GetMapping("/teachingRecord/{id}/attendance/list")
    public AjaxResult getAttendanceList(@PathVariable("id") Long id,
                                        @RequestParam("classroomNo") String classroomNo,
                                        @RequestParam(value = "deskNo") String deskNo) {
        BizTeachingRecord teachingRecord = teachingRecordService.selectBizTeachingRecordById(id);
        if (teachingRecord == null) {
            return AjaxResult.error("不存在教学记录");
        }
        BizClassroom classroom = classroomService.selectBizClassroomByNo(classroomNo);
        if (classroom == null) {
            return AjaxResult.error("教室不存在");
        }
        BizDesk desk = deskService.selectBizDeskByNo(classroom.getId(), deskNo);
        if (desk == null) {
            return AjaxResult.error("桌子不存在");
        }
        BizAttendance condition = new BizAttendance();
        condition.setTeachingRecordId(id);
        condition.setClassroomId(classroom.getId());
        condition.setDeskId(desk.getId());
        List<BizAttendanceVo> attendanceList = attendanceService.selectBizAttendanceList(condition);
        return AjaxResult.success(attendanceList);
    }

    @GetMapping("/teachingRecord/{id}")
    public AjaxResult getTeachingRecord(@PathVariable("id") Long id) {
        BizTeachingRecordVo teachingRecord = teachingRecordService.selectBizTeachingRecordById(id);
        if (teachingRecord == null) {
            return AjaxResult.success();
        }

        return AjaxResult.success(teachingRecord);
    }

    @PostMapping("/teachingRecord/{id}/start")
    public AjaxResult startTeachingRecord(@PathVariable("id") Long id) {
        BizTeachingRecord teachingRecord = teachingRecordService.selectBizTeachingRecordById(id);
        if (teachingRecord == null) {
            return AjaxResult.error("不存在教学记录");
        }
        if (teachingRecord.getStatus() == UserConstants.TEACHING_STATUS_RUNNING) {
            return AjaxResult.success(id);
        }
        teachingRecord.setStartTime(new Date());
        teachingRecord.setStatus(UserConstants.TEACHING_STATUS_RUNNING);
        teachingRecordService.updateBizTeachingRecord(teachingRecord);
        return AjaxResult.success(id);
    }

    @PostMapping("/teachingRecord/{id}/stop")
    public AjaxResult stopTeachingRecord(@PathVariable("id") Long id) {
        BizTeachingRecord teachingRecord = teachingRecordService.selectBizTeachingRecordById(id);
        if (teachingRecord == null) {
            return AjaxResult.error("不存在教学记录");
        }
        teachingRecord.setEndTime(new Date());
        teachingRecord.setStatus(UserConstants.TEACHING_STATUS_FINISH);
        teachingRecordService.updateBizTeachingRecord(teachingRecord);
        return AjaxResult.success(id);
    }

    @GetMapping("/classroom/device/list")
    public AjaxResult getDeskDeviceList(@RequestParam("deskNo") String deskNo, @RequestParam("classroomNo") String classroomNo) {
        BizClassroom classroom = classroomService.selectBizClassroomByNo(classroomNo);
        if (classroom == null) {
            throw new ServiceException("教室不存在");
        }
        BizDesk desk = deskService.selectBizDeskByNo(classroom.getId(), deskNo);
        if (desk == null) {
            throw new ServiceException("课桌不存在");
        }
        BizDeskDevice condition = new BizDeskDevice();
        condition.setClassroomId(classroom.getId());
        condition.setDeskId(desk.getId());
        List<BizDeskDevice> deskDeviceList = deskDeviceService.selectBizDeskDeviceList(condition);
        List<Long> deviceIdList = deskDeviceList.parallelStream().map(BizDeskDevice::getDeviceId).collect(Collectors.toList());
        List<BizDevice> deviceList = deviceService.selectBizDeviceByIdList(deviceIdList);
        return AjaxResult.success(deviceList);
    }

    @GetMapping("/desk/list")
    public AjaxResult getDeviceList(@RequestParam("classroomNo") String classroomNo, @RequestParam(value = "teachingRecordId", required = false) Long teachingRecordId) {
        BizClassroom tmpClassroom = classroomService.selectBizClassroomByNo(classroomNo);
        if (tmpClassroom == null) {
            return AjaxResult.error("教室不存在");
        }
        if (teachingRecordId != null) {
            BizTeachingRecord teachingRecord = teachingRecordService.selectBizTeachingRecordById(teachingRecordId);
            if (teachingRecord == null) {
                return AjaxResult.error("教学记录不存在");
            }
        }

        BizDeskDevice condition = new BizDeskDevice();
        condition.setClassroomId(tmpClassroom.getId());
        List<BizDeskDevice> deskDeviceList = deskDeviceService.selectBizDeskDeviceList(condition);

        Map<Long, List<BizDeskDevice>> deskDeviceMap = deskDeviceList.parallelStream().collect(Collectors.groupingBy(BizDeskDevice::getDeskId, Collectors.toList()));

        BizDeskListVo resp = new BizDeskListVo();

        BizDeskVo teacherDesk = null;
        List<BizDeskVo> studentDeskList = Lists.newArrayList();
        for (Long deskId : deskDeviceMap.keySet()) {
            BizDesk desk = deskService.selectBizDeskById(deskId);
            if (desk == null) {
                continue;
            }
            BizDeskVo result = new BizDeskVo();
            BeanUtils.copyProperties(desk, result);
            List<BizDeskDevice> deskDevices = deskDeviceMap.get(deskId);
            List<Long> deviceIdList = deskDevices.parallelStream().map(BizDeskDevice::getDeviceId).collect(Collectors.toList());
            List<BizDevice> deviceList = deviceService.selectBizDeviceByIdList(deviceIdList);
            result.setDeviceList(deviceList);

            if (teachingRecordId != null) {
                BizAttendance attendanceCondition = new BizAttendance();
                attendanceCondition.setTeachingRecordId(teachingRecordId);
                attendanceCondition.setDeskId(deskId);
                List<BizAttendanceVo> attendanceList = attendanceService.selectBizAttendanceList(attendanceCondition);
                List<String> names = Lists.newArrayList();
                for (BizAttendanceVo it : attendanceList) {
                    BizMember member = memberService.selectBizMemberByUserId(it.getStudentId());
                    if (member == null) {
                        continue;
                    }
                    if (member.getUserType() != 2) {
                        continue;
                    }
                    names.add(member.getName());
                }
                result.setAttendanceStudentNameList(names);
            }

            if (desk.getType() == 1) {
                teacherDesk = result;
            } else {
                studentDeskList.add(result);
            }
        }

        resp.setTeacherDesk(teacherDesk);
        resp.setStudentDeskList(studentDeskList);
        return AjaxResult.success(resp);
    }

    @GetMapping("/major/list")
    public AjaxResult getMajorList(@RequestParam("academyId") Long academyId) {
        LoginUser loginUser = getLoginUser();

        BizMember member = memberService.selectBizMemberByUserId(loginUser.getUsername());
        if (member == null) {
            throw new ServiceException("用户不存在");
        }

        BizMajor condition = new BizMajor();
        condition.setAcademyId(member.getAcademyId());
        List<BizMajorVo> majorList = majorService.selectBizMajorList(condition);
        return AjaxResult.success(majorList);
    }

    @GetMapping("/grade/list")
    public AjaxResult getGradeList() {
        LoginUser loginUser = getLoginUser();
//
//        BizMember member = memberService.selectBizMemberByUserId(loginUser.getUsername());
//        if (member == null) {
//            throw new ServiceException("用户不存在");
//        }

        List<BizGrade> gradeList = gradeService.selectBizGradeList(new BizGrade());
        return AjaxResult.success(gradeList);
    }

    @GetMapping("/class/list")
    public AjaxResult getClassList(@RequestParam("majorId") Long majorId) {
        LoginUser loginUser = getLoginUser();

        BizClass condition = new BizClass();
        condition.setMajorId(majorId);
        List<BizClassVo> classList = classService.selectBizClassList(condition);
        return AjaxResult.success(classList);
    }

    @GetMapping("/course/list")
    public AjaxResult getCourseList(@RequestParam("classId") Long classId) {
        LoginUser loginUser = getLoginUser();

        BizCourse condition = new BizCourse();
        condition.setClassId(classId);
        List<BizCourseVo> courseList = courseService.selectBizCourseList(condition);
        return AjaxResult.success(courseList);
    }

}
