package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BizAcademy;

/**
 * 学院Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface BizAcademyMapper 
{
    /**
     * 查询学院
     * 
     * @param id 学院主键
     * @return 学院
     */
    public BizAcademy selectBizAcademyById(Long id);

    /**
     * 查询学院列表
     * 
     * @param bizAcademy 学院
     * @return 学院集合
     */
    public List<BizAcademy> selectBizAcademyList(BizAcademy bizAcademy);

    /**
     * 新增学院
     * 
     * @param bizAcademy 学院
     * @return 结果
     */
    public int insertBizAcademy(BizAcademy bizAcademy);

    /**
     * 修改学院
     * 
     * @param bizAcademy 学院
     * @return 结果
     */
    public int updateBizAcademy(BizAcademy bizAcademy);

    /**
     * 删除学院
     * 
     * @param id 学院主键
     * @return 结果
     */
    public int deleteBizAcademyById(Long id);

    /**
     * 批量删除学院
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizAcademyByIds(Long[] ids);
}
