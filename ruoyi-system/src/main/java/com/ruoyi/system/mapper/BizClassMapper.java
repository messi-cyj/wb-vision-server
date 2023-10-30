package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BizClass;

/**
 * 班级Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface BizClassMapper 
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
    public List<BizClass> selectBizClassList(BizClass bizClass);

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
     * 删除班级
     * 
     * @param id 班级主键
     * @return 结果
     */
    public int deleteBizClassById(Long id);

    /**
     * 批量删除班级
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizClassByIds(Long[] ids);
}
