package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 桌子对象 biz_desk
 * 
 * @author ruoyi
 * @date 2022-04-13
 */
public class BizDesk extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 桌子名称 */
    @Excel(name = "桌子名称")
    private String name;

    /** 桌子编号 */
    @Excel(name = "桌子编号")
    private String no;

    /** 教室ID */
    @Excel(name = "教室ID")
    private Long classroomId;

    /** 桌子类型(1=老师,2=学生) */
    @Excel(name = "桌子类型(1=老师,2=学生)")
    private Integer type;

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
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setNo(String no) 
    {
        this.no = no;
    }

    public String getNo() 
    {
        return no;
    }
    public void setClassroomId(Long classroomId) 
    {
        this.classroomId = classroomId;
    }

    public Long getClassroomId() 
    {
        return classroomId;
    }
    public void setType(Integer type) 
    {
        this.type = type;
    }

    public Integer getType() 
    {
        return type;
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
            .append("name", getName())
            .append("no", getNo())
            .append("classroomId", getClassroomId())
            .append("type", getType())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createUserId", getCreateUserId())
            .append("updateUserId", getUpdateUserId())
            .toString();
    }
}
