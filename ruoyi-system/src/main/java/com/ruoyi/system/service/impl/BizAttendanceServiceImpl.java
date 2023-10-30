package com.ruoyi.system.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.exception.user.UserException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.PageUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.BizAttendanceVo;
import com.ruoyi.system.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizAttendanceMapper;

/**
 * 考勤Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@Slf4j
@Service
public class BizAttendanceServiceImpl implements IBizAttendanceService 
{
    @Autowired
    private BizAttendanceMapper bizAttendanceMapper;

    @Autowired
    private IBizClassroomService classroomService;

    @Autowired
    private IBizMemberService memberService;

    @Autowired
    private IBizDeskService deskService;

    @Autowired
    private IBizCourseService courseService;

    @Autowired
    private IBizTeachingRecordService teachingRecordService;

    @Autowired
    private IBizAcademyService academyService;

    @Autowired
    private IBizMajorService majorService;

    @Autowired
    private IBizClassService classService;

    @Autowired
    private IBizGradeService gradeService;


    /**
     * 查询考勤
     * 
     * @param id 考勤主键
     * @return 考勤
     */
    @Override
    public BizAttendance selectBizAttendanceById(Long id)
    {
        return bizAttendanceMapper.selectBizAttendanceById(id);
    }

    /**
     * 查询考勤列表
     * 
     * @param bizAttendance 考勤
     * @return 考勤
     */
    @Override
    public List<BizAttendanceVo> selectBizAttendanceList(BizAttendance bizAttendance)
    {
        List<BizAttendance> list = bizAttendanceMapper.selectBizAttendanceList(bizAttendance);
        List<BizAttendanceVo> results = list.parallelStream().map(it -> {
            BizAttendanceVo result = new BizAttendanceVo();
            BeanUtils.copyProperties(it, result);
            if (StringUtils.isNotBlank(it.getStudentId())) {
                BizMember bizMember = memberService.selectBizMemberByUserId(it.getStudentId());
                if (bizMember != null) {
                    result.setStudentName(bizMember.getName());
                    result.setStudentNo(bizMember.getUserId());
                }
            }
            if (it.getDeskId() != null) {
                BizDesk bizDesk = deskService.selectBizDeskById(it.getDeskId());
                if (bizDesk != null) {
                    result.setDeskName(bizDesk.getName());
                }
            }
            if (it.getAcademyId() != null) {
                BizAcademy academy = academyService.selectBizAcademyById(it.getAcademyId());
                if (academy != null) {
                    result.setAcademyName(academy.getName());
                }
            }
            if (it.getMajorId() != null) {
                BizMajor major = majorService.selectBizMajorById(it.getMajorId());
                if (major != null) {
                    result.setMajorName(major.getName());
                }
            }
            if (it.getGradeId() != null) {
                BizGrade grade = gradeService.selectBizGradeById(it.getGradeId());
                if (grade != null) {
                    result.setGradeName(grade.getName());
                }
            }
            if (it.getClassId() != null) {
                BizClass clazz = classService.selectBizClassById(it.getClassId());
                if (clazz != null) {
                    result.setClassName(clazz.getName());
                }
            }
            if (it.getCourseId() != null) {
                BizCourse course = courseService.selectBizCourseById(it.getCourseId());
                if (course != null) {
                    result.setCourseName(course.getName());
                }
            }
            if (it.getClassroomId() != null) {
                BizClassroom classroom = classroomService.selectBizClassroomById(it.getClassroomId());
                if (classroom != null) {
                    result.setClassroomName(classroom.getName());
                }
            }
            if (it.getTeachingRecordId() != null) {
                BizTeachingRecord teachingRecord = teachingRecordService.selectBizTeachingRecordById(it.getTeachingRecordId());
                if (teachingRecord != null) {
                    result.setTeachingRecordName(teachingRecord.getName());
                }
            }
            return result;
        }).collect(Collectors.toList());
        return PageUtils.newPage(list, results);
    }

    /**
     * 新增考勤
     * 
     * @param bizAttendance 考勤
     * @return 结果
     */
    @Override
    public int insertBizAttendance(BizAttendance bizAttendance)
    {
        bizAttendance.setCreateTime(DateUtils.getNowDate());
        return bizAttendanceMapper.insertBizAttendance(bizAttendance);
    }

    @Override
    public void createAttendance(Long teachingRecordId, String studentId, String classroomNo, String deskNo) {
        if (teachingRecordId == null) {
            return;
        }
        BizMember member = memberService.selectBizMemberByUserId(studentId);
        if (member == null) {
            throw new ServiceException("用户不存在");
        }
        BizTeachingRecord teachingRecord = teachingRecordService.selectBizTeachingRecordById(teachingRecordId);
        if (teachingRecord == null) {
            throw new ServiceException("教学记录不存在");
        }

        BizClassroom classroom = classroomService.selectBizClassroomByNo(classroomNo);
        if (classroom == null) {
            throw new ServiceException("教室错误");
        }

        BizDesk desk = deskService.selectBizDeskByNo(classroom.getId(), deskNo);
        if (desk == null) {
            throw new ServiceException("桌子错误");
        }

        BizAttendance bizAttendance = new BizAttendance();
        bizAttendance.setTeachingRecordId(teachingRecordId);
        bizAttendance.setAcademyId(member.getAcademyId());
        bizAttendance.setMajorId(member.getMajorId());
        bizAttendance.setClassId(member.getClassId());
        bizAttendance.setCourseId(teachingRecord.getCourseId());
        bizAttendance.setClassroomId(classroom.getId());
        bizAttendance.setDeskId(desk.getId());
        bizAttendance.setStudentId(studentId);

        try {
            this.insertBizAttendance(bizAttendance);
        } catch (DuplicateKeyException e) {
            log.warn("重复签到，忽略, 教学记录：{}, 学生：{}", teachingRecord, studentId);
        }
    }

    /**
     * 修改考勤
     * 
     * @param bizAttendance 考勤
     * @return 结果
     */
    @Override
    public int updateBizAttendance(BizAttendance bizAttendance)
    {
        bizAttendance.setUpdateTime(DateUtils.getNowDate());
        return bizAttendanceMapper.updateBizAttendance(bizAttendance);
    }

    /**
     * 批量删除考勤
     * 
     * @param ids 需要删除的考勤主键
     * @return 结果
     */
    @Override
    public int deleteBizAttendanceByIds(Long[] ids)
    {
        return bizAttendanceMapper.deleteBizAttendanceByIds(ids);
    }

    /**
     * 删除考勤信息
     * 
     * @param id 考勤主键
     * @return 结果
     */
    @Override
    public int deleteBizAttendanceById(Long id)
    {
        return bizAttendanceMapper.deleteBizAttendanceById(id);
    }
}
