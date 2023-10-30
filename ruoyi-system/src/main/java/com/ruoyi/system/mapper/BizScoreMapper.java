package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BizScore;

/**
 * 成绩Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface BizScoreMapper 
{
    /**
     * 查询成绩
     * 
     * @param id 成绩主键
     * @return 成绩
     */
    public BizScore selectBizScoreById(Long id);

    /**
     * 查询成绩列表
     * 
     * @param bizScore 成绩
     * @return 成绩集合
     */
    public List<BizScore> selectBizScoreList(BizScore bizScore);

    /**
     * 新增成绩
     * 
     * @param bizScore 成绩
     * @return 结果
     */
    public int insertBizScore(BizScore bizScore);

    /**
     * 修改成绩
     * 
     * @param bizScore 成绩
     * @return 结果
     */
    public int updateBizScore(BizScore bizScore);

    /**
     * 删除成绩
     * 
     * @param id 成绩主键
     * @return 结果
     */
    public int deleteBizScoreById(Long id);

    /**
     * 批量删除成绩
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizScoreByIds(Long[] ids);
}
