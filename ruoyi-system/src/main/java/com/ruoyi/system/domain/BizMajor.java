package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 专业对象 biz_major
 * 
 * @author ruoyi
 * @date 2022-04-13
 */
public class BizMajor extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 专业名称 */
    @Excel(name = "专业名称")
    private String name;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    /** 学院ID */
    @Excel(name = "学院ID")
    private Long academyId;

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
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setAcademyId(Long academyId) 
    {
        this.academyId = academyId;
    }

    public Long getAcademyId() 
    {
        return academyId;
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
            .append("description", getDescription())
            .append("academyId", getAcademyId())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createUserId", getCreateUserId())
            .append("updateUserId", getUpdateUserId())
            .toString();
    }
}
