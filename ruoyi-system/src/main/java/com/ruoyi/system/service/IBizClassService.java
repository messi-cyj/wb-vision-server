package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.BizClass;
import com.ruoyi.system.domain.vo.BizClassVo;

/**
 * 班级Service接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface IBizClassService 
{
    /**
     * 查询班级
     * 
     * @param id 班级主键
     * @return 班级
     */
    public BizClass selectBizClassById(Long id);

    /**
     * 查询班级列表
     * 
     * @param bizClass 班级
     * @return 班级集合
     */
    public List<BizClassVo> selectBizClassList(BizClass bizClass);

    /**
     * 新增班级
     * 
     * @param bizClass 班级
     * @return 结果
     */
    public int insertBizClass(BizClass bizClass);

    /**
     * 修改班级
     * 
     * @param bizClass 班级
     * @return 结果
     */
    public int updateBizClass(BizClass bizClass);

    /**
     * 批量删除班级
     * 
     * @param ids 需要删除的班级主键集合
     * @return 结果
     */
    public int deleteBizClassByIds(Long[] ids);

    /**
     * 删除班级信息
     * 
     * @param id 班级主键
     * @return 结果
     */
    public int deleteBizClassById(Long id);
}
