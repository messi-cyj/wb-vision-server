package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizGradeMapper;
import com.ruoyi.system.domain.BizGrade;
import com.ruoyi.system.service.IBizGradeService;

/**
 * 年级Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-13
 */
@Service
public class BizGradeServiceImpl implements IBizGradeService 
{
    @Autowired
    private BizGradeMapper bizGradeMapper;

    /**
     * 查询年级
     * 
     * @param id 年级主键
     * @return 年级
     */
    @Override
    public BizGrade selectBizGradeById(Long id)
    {
        return bizGradeMapper.selectBizGradeById(id);
    }

    /**
     * 查询年级列表
     * 
     * @param bizGrade 年级
     * @return 年级
     */
    @Override
    public List<BizGrade> selectBizGradeList(BizGrade bizGrade)
    {
        return bizGradeMapper.selectBizGradeList(bizGrade);
    }

    /**
     * 新增年级
     * 
     * @param bizGrade 年级
     * @return 结果
     */
    @Override
    public int insertBizGrade(BizGrade bizGrade)
    {
        bizGrade.setCreateTime(DateUtils.getNowDate());
        return bizGradeMapper.insertBizGrade(bizGrade);
    }

    /**
     * 修改年级
     * 
     * @param bizGrade 年级
     * @return 结果
     */
    @Override
    public int updateBizGrade(BizGrade bizGrade)
    {
        bizGrade.setUpdateTime(DateUtils.getNowDate());
        return bizGradeMapper.updateBizGrade(bizGrade);
    }

    /**
     * 批量删除年级
     * 
     * @param ids 需要删除的年级主键
     * @return 结果
     */
    @Override
    public int deleteBizGradeByIds(Long[] ids)
    {
        return bizGradeMapper.deleteBizGradeByIds(ids);
    }

    /**
     * 删除年级信息
     * 
     * @param id 年级主键
     * @return 结果
     */
    @Override
    public int deleteBizGradeById(Long id)
    {
        return bizGradeMapper.deleteBizGradeById(id);
    }
}
