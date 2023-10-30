package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizScoreMapper;
import com.ruoyi.system.domain.BizScore;
import com.ruoyi.system.service.IBizScoreService;

/**
 * 成绩Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@Service
public class BizScoreServiceImpl implements IBizScoreService 
{
    @Autowired
    private BizScoreMapper bizScoreMapper;

    /**
     * 查询成绩
     * 
     * @param id 成绩主键
     * @return 成绩
     */
    @Override
    public BizScore selectBizScoreById(Long id)
    {
        return bizScoreMapper.selectBizScoreById(id);
    }

    /**
     * 查询成绩列表
     * 
     * @param bizScore 成绩
     * @return 成绩
     */
    @Override
    public List<BizScore> selectBizScoreList(BizScore bizScore)
    {
        return bizScoreMapper.selectBizScoreList(bizScore);
    }

    /**
     * 新增成绩
     * 
     * @param bizScore 成绩
     * @return 结果
     */
    @Override
    public int insertBizScore(BizScore bizScore)
    {
        bizScore.setCreateTime(DateUtils.getNowDate());
        return bizScoreMapper.insertBizScore(bizScore);
    }

    /**
     * 修改成绩
     * 
     * @param bizScore 成绩
     * @return 结果
     */
    @Override
    public int updateBizScore(BizScore bizScore)
    {
        bizScore.setUpdateTime(DateUtils.getNowDate());
        return bizScoreMapper.updateBizScore(bizScore);
    }

    /**
     * 批量删除成绩
     * 
     * @param ids 需要删除的成绩主键
     * @return 结果
     */
    @Override
    public int deleteBizScoreByIds(Long[] ids)
    {
        return bizScoreMapper.deleteBizScoreByIds(ids);
    }

    /**
     * 删除成绩信息
     * 
     * @param id 成绩主键
     * @return 结果
     */
    @Override
    public int deleteBizScoreById(Long id)
    {
        return bizScoreMapper.deleteBizScoreById(id);
    }
}
