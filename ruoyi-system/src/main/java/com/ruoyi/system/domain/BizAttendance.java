package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 考勤对象 biz_attendance
 * 
 * @author ruoyi
 * @date 2022-04-13
 */
public class BizAttendance extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 学院ID */
    @Excel(name = "学院ID")
    private Long academyId;

    /** 年级ID */
    @Excel(name = "年级ID")
    private Long gradeId;

    /** 专业ID */
    @Excel(name = "专业ID")
    private Long majorId;

    /** 班级ID */
    @Excel(name = "班级ID")
    private Long classId;

    /** 课程ID */
    @Excel(name = "课程ID")
    private Long courseId;

    /** 教学记录ID */
    @Excel(name = "教学记录ID")
    private Long teachingRecordId;

    /** 教室ID */
    @Excel(name = "教室ID")
    private Long classroomId;

    /** 桌子ID */
    @Excel(name = "桌子ID")
    private Long deskId;

    /** 学生ID */
    @Excel(name = "学生ID")
    private String studentId;

    /** 创建人 */
    @Excel(name = "创建人")
    private String createUserId;

    /** 更新人 */
    @Excel(name = "更新人")
    private String updateUserId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setAcademyId(Long academyId) 
    {
        this.academyId = academyId;
    }

    public Long getAcademyId() 
    {
        return academyId;
    }
    public void setMajorId(Long majorId) 
    {
        this.majorId = majorId;
    }

    public Long getMajorId() 
    {
        return majorId;
    }
    public void setClassId(Long classId) 
    {
        this.classId = classId;
    }

    public Long getClassId() 
    {
        return classId;
    }
    public void setCourseId(Long courseId) 
    {
        this.courseId = courseId;
    }

    public Long getCourseId() 
    {
        return courseId;
    }
    public void setTeachingRecordId(Long teachingRecordId) 
    {
        this.teachingRecordId = teachingRecordId;
    }

    public Long getTeachingRecordId() 
    {
        return teachingRecordId;
    }
    public void setClassroomId(Long classroomId) 
    {
        this.classroomId = classroomId;
    }

    public Long getClassroomId() 
    {
        return classroomId;
    }
    public void setDeskId(Long deskId) 
    {
        this.deskId = deskId;
    }

    public Long getDeskId() 
    {
        return deskId;
    }
    public void setStudentId(String studentId) 
    {
        this.studentId = studentId;
    }

    public String getStudentId() 
    {
        return studentId;
    }
    public void setCreateUserId(String createUserId) 
    {
        this.createUserId = createUserId;
    }

    public String getCreateUserId() 
    {
        return createUserId;
    }
    public void setUpdateUserId(String updateUserId) 
    {
        this.updateUserId = updateUserId;
    }

    public String getUpdateUserId() 
    {
        return updateUserId;
    }

    public Long getGradeId() {
        return gradeId;
    }

    public void setGradeId(Long gradeId) {
        this.gradeId = gradeId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("academyId", getAcademyId())
            .append("majorId", getMajorId())
            .append("classId", getClassId())
            .append("courseId", getCourseId())
            .append("teachingRecordId", getTeachingRecordId())
            .append("classroomId", getClassroomId())
            .append("deskId", getDeskId())
            .append("studentId", getStudentId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createUserId", getCreateUserId())
            .append("updateUserId", getUpdateUserId())
            .toString();
    }
}
