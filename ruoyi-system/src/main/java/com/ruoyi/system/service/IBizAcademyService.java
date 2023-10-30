package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.BizAcademy;
import com.ruoyi.system.domain.vo.BizAcademyVo;

/**
 * 学院Service接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface IBizAcademyService 
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
    public List<BizAcademyVo> selectBizAcademyList(BizAcademy bizAcademy);

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
     * 批量删除学院
     * 
     * @param ids 需要删除的学院主键集合
     * @return 结果
     */
    public int deleteBizAcademyByIds(Long[] ids);

    /**
     * 删除学院信息
     * 
     * @param id 学院主键
     * @return 结果
     */
    public int deleteBizAcademyById(Long id);
}
