package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户对象 biz_member
 * 
 * @author ruoyi
 * @date 2022-04-26
 */
public class BizMember extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private String userId;

    /** 名称 */
    @Excel(name = "名称")
    private String name;

    /** 密码 */
    @Excel(name = "密码")
    private String password;

    /** 手机号 */
    @Excel(name = "手机号")
    private String mobile;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String identificationNumber;

    /** 出生日期 */
    @Excel(name = "出生日期")
    private String birthday;

    /** 状态 */
    @Excel(name = "状态")
    private Integer status;

    /** 头像地址 */
    @Excel(name = "头像地址")
    private String avatar;

    /** 学校ID */
    @Excel(name = "学校ID")
    private Long schoolId;

    /** 学院ID */
    @Excel(name = "学院ID")
    private Long academyId;

    /** 专业ID */
    @Excel(name = "专业ID")
    private Long majorId;

    /** 年级ID */
    @Excel(name = "年级ID")
    private Long gradeId;

    /** 班级ID */
    @Excel(name = "班级ID")
    private Long classId;

    /** 人脸图片ID */
    @Excel(name = "人脸图片ID")
    private Long faceResourceId;

    /** 用户类型 1=教师,2=学生 */
    @Excel(name = "用户类型 1=教师,2=学生")
    private Integer userType;

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
    public void setUserId(String userId) 
    {
        this.userId = userId;
    }

    public String getUserId() 
    {
        return userId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }
    public void setMobile(String mobile) 
    {
        this.mobile = mobile;
    }

    public String getMobile() 
    {
        return mobile;
    }
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setIdentificationNumber(String identificationNumber) 
    {
        this.identificationNumber = identificationNumber;
    }

    public String getIdentificationNumber() 
    {
        return identificationNumber;
    }
    public void setBirthday(String birthday) 
    {
        this.birthday = birthday;
    }

    public String getBirthday() 
    {
        return birthday;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }
    public void setAvatar(String avatar) 
    {
        this.avatar = avatar;
    }

    public String getAvatar() 
    {
        return avatar;
    }
    public void setSchoolId(Long schoolId) 
    {
        this.schoolId = schoolId;
    }

    public Long getSchoolId() 
    {
        return schoolId;
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
    public void setGradeId(Long gradeId) 
    {
        this.gradeId = gradeId;
    }

    public Long getGradeId() 
    {
        return gradeId;
    }
    public void setClassId(Long classId) 
    {
        this.classId = classId;
    }

    public Long getClassId() 
    {
        return classId;
    }
    public void setFaceResourceId(Long faceResourceId) 
    {
        this.faceResourceId = faceResourceId;
    }

    public Long getFaceResourceId() 
    {
        return faceResourceId;
    }
    public void setUserType(Integer userType) 
    {
        this.userType = userType;
    }

    public Integer getUserType() 
    {
        return userType;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("name", getName())
            .append("password", getPassword())
            .append("mobile", getMobile())
            .append("email", getEmail())
            .append("identificationNumber", getIdentificationNumber())
            .append("birthday", getBirthday())
            .append("status", getStatus())
            .append("avatar", getAvatar())
            .append("schoolId", getSchoolId())
            .append("academyId", getAcademyId())
            .append("majorId", getMajorId())
            .append("gradeId", getGradeId())
            .append("classId", getClassId())
            .append("faceResourceId", getFaceResourceId())
            .append("userType", getUserType())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createUserId", getCreateUserId())
            .append("updateUserId", getUpdateUserId())
            .toString();
    }
}
