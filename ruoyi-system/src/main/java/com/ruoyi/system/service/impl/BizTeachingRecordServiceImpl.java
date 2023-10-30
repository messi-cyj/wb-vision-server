package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.PageUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.BizTeachingRecordVo;
import com.ruoyi.system.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizTeachingRecordMapper;

/**
 * 教学记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@Service
public class BizTeachingRecordServiceImpl implements IBizTeachingRecordService 
{
    @Autowired
    private BizTeachingRecordMapper bizTeachingRecordMapper;

    @Autowired
    private IBizCourseService courseService;

    @Autowired
    private IBizSchoolService schoolService;

    @Autowired
    private IBizAcademyService academyService;

    @Autowired
    private IBizMajorService majorService;

    @Autowired
    private IBizClassService classService;

    @Autowired
    private IBizGradeService gradeService;

    @Autowired
    private IBizMemberService memberService;

    @Autowired
    private IBizClassroomService classroomService;

    /**
     * 查询教学记录
     * 
     * @param id 教学记录主键
     * @return 教学记录
     */
    @Override
    public BizTeachingRecordVo selectBizTeachingRecordById(Long id)
    {
        BizTeachingRecord it = bizTeachingRecordMapper.selectBizTeachingRecordById(id);
        if (it == null) {
            return null;
        }
        BizTeachingRecordVo result = new BizTeachingRecordVo();
        BeanUtils.copyProperties(it, result);
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
        if (it.getTeacherId() != null) {
            BizMember member = memberService.selectBizMemberByUserId(it.getTeacherId());
            if (member != null) {
                result.setTeacherName(member.getName());
            }
        }
        return result;
    }

    /**
     * 查询教学记录列表
     * 
     * @param bizTeachingRecord 教学记录
     * @return 教学记录
     */
    @Override
    public List<BizTeachingRecordVo> selectBizTeachingRecordList(BizTeachingRecord bizTeachingRecord)
    {
        List<BizTeachingRecord> teachingRecordList = bizTeachingRecordMapper.selectBizTeachingRecordList(bizTeachingRecord);
        List<BizTeachingRecordVo> results = teachingRecordList.parallelStream().map(it -> {
            BizTeachingRecordVo result = new BizTeachingRecordVo();
            BeanUtils.copyProperties(it, result);
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
            if (it.getTeacherId() != null) {
                BizMember member = memberService.selectBizMemberByUserId(it.getTeacherId());
                if (member != null) {
                    result.setTeacherName(member.getName());
                }
            }
            if (it.getClassroomId() != null) {
                BizClassroom classroom = classroomService.selectBizClassroomById(it.getClassroomId());
                if (classroom != null) {
                    result.setClassroomName(classroom.getName());
                }
            }
            return result;
        }).collect(Collectors.toList());
        return PageUtils.newPage(teachingRecordList, results);
    }

    @Override
    public List<BizTeachingRecord> getTeacherActiveRecord(String teacherId) {
        BizTeachingRecord condition = new BizTeachingRecord();
        condition.setTeacherId(teacherId);
        List<BizTeachingRecord> teachingRecordList = bizTeachingRecordMapper.selectBizTeachingRecordList(condition);
        List<BizTeachingRecord> results = new ArrayList<>();
        for (BizTeachingRecord item : teachingRecordList) {
            if (item.getStatus().equals(UserConstants.TEACHING_STATUS_NEW) ||
                    item.getStatus().equals(UserConstants.TEACHING_STATUS_RUNNING)) {
                results.add(item);
            }
        }
        return results;
    }

    @Override
    public BizTeachingRecordVo getLatestTeachingRecord(Long academyId, Long majorId, Long gradeId, Long classId) {
        BizTeachingRecord it = bizTeachingRecordMapper.getLatestTeachingRecord(academyId, majorId, gradeId, classId);
        if (it != null) {
            BizTeachingRecordVo result = new BizTeachingRecordVo();
            BeanUtils.copyProperties(it, result);
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
            if (it.getTeacherId() != null) {
                BizMember member = memberService.selectBizMemberByUserId(it.getTeacherId());
                if (member != null) {
                    result.setTeacherName(member.getName());
                }
            }
            return result;
        }
        return null;
    }

    @Override
    public BizTeachingRecordVo getLatestTeachingRecordByCourseId(Long academyId, Long majorId, Long gradeId, Long classId, Long courseId, String teacherId) {
        BizTeachingRecord it = bizTeachingRecordMapper.getLatestTeachingRecordByCourseId(academyId, majorId, gradeId, classId, courseId, teacherId);
        if (it != null) {
            BizTeachingRecordVo result = new BizTeachingRecordVo();
            BeanUtils.copyProperties(it, result);
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
            if (it.getTeacherId() != null) {
                BizMember member = memberService.selectBizMemberByUserId(it.getTeacherId());
                if (member != null) {
                    result.setTeacherName(member.getName());
                }
            }
            return result;
        }
        return null;
    }

    /**
     * 新增教学记录
     * 
     * @param bizTeachingRecord 教学记录
     * @return 结果
     */
    @Override
    public synchronized int insertBizTeachingRecord(BizTeachingRecord bizTeachingRecord)
    {
        List<BizTeachingRecord> activeTeachingRecordList = getTeacherActiveRecord(bizTeachingRecord.getTeacherId());
        if (activeTeachingRecordList.size() > 0) {
            throw new ServiceException("当前老师已经存在一场教学记录，请等待完成后再操作，如果无效也可以尝试取消");
        }
        bizTeachingRecord.setStatus(UserConstants.TEACHING_STATUS_NEW);
        bizTeachingRecord.setCreateTime(DateUtils.getNowDate());
        return bizTeachingRecordMapper.insertBizTeachingRecord(bizTeachingRecord);
    }

    /**
     * 修改教学记录
     * 
     * @param bizTeachingRecord 教学记录
     * @return 结果
     */
    @Override
    public synchronized int updateBizTeachingRecord(BizTeachingRecord bizTeachingRecord)
    {
        BizTeachingRecord old = bizTeachingRecordMapper.selectBizTeachingRecordById(bizTeachingRecord.getId());
        if (old == null) {
            return 0;
        }
        if (bizTeachingRecord.getStatus().equals(UserConstants.TEACHING_STATUS_CANCEL)) {
            if (!old.getStatus().equals(UserConstants.TEACHING_STATUS_NEW)) {
                throw new ServiceException("当前状态不允许修改状态");
            }
        }
        bizTeachingRecord.setUpdateTime(DateUtils.getNowDate());
        return bizTeachingRecordMapper.updateBizTeachingRecord(bizTeachingRecord);
    }

    /**
     * 批量删除教学记录
     * 
     * @param ids 需要删除的教学记录主键
     * @return 结果
     */
    @Override
    public int deleteBizTeachingRecordByIds(Long[] ids)
    {
        return bizTeachingRecordMapper.deleteBizTeachingRecordByIds(ids);
    }

    /**
     * 删除教学记录信息
     * 
     * @param id 教学记录主键
     * @return 结果
     */
    @Override
    public int deleteBizTeachingRecordById(Long id)
    {
        return bizTeachingRecordMapper.deleteBizTeachingRecordById(id);
    }
}
