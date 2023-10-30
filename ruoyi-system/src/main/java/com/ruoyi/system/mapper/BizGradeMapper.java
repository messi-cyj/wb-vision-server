package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BizGrade;

/**
 * 年级Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-13
 */
public interface BizGradeMapper 
{
    /**
     * 查询年级
     * 
     * @param id 年级主键
     * @return 年级
     */
    public BizGrade selectBizGradeById(Long id);

    /**
     * 查询年级列表
     * 
     * @param bizGrade 年级
     * @return 年级集合
     */
    public List<BizGrade> selectBizGradeList(BizGrade bizGrade);

    /**
     * 新增年级
     * 
     * @param bizGrade 年级
     * @return 结果
     */
    public int insertBizGrade(BizGrade bizGrade);

    /**
     * 修改年级
     * 
     * @param bizGrade 年级
     * @return 结果
     */
    public int updateBizGrade(BizGrade bizGrade);

    /**
     * 删除年级
     * 
     * @param id 年级主键
     * @return 结果
     */
    public int deleteBizGradeById(Long id);

    /**
     * 批量删除年级
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizGradeByIds(Long[] ids);
}
