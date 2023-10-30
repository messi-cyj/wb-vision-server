package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.BizMajor;
import com.ruoyi.system.domain.vo.BizMajorVo;

/**
 * 专业Service接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface IBizMajorService 
{
    /**
     * 查询专业
     * 
     * @param id 专业主键
     * @return 专业
     */
    public BizMajor selectBizMajorById(Long id);

    /**
     * 查询专业列表
     * 
     * @param bizMajor 专业
     * @return 专业集合
     */
    public List<BizMajorVo> selectBizMajorList(BizMajor bizMajor);

    /**
     * 新增专业
     * 
     * @param bizMajor 专业
     * @return 结果
     */
    public int insertBizMajor(BizMajor bizMajor);

    /**
     * 修改专业
     * 
     * @param bizMajor 专业
     * @return 结果
     */
    public int updateBizMajor(BizMajor bizMajor);

    /**
     * 批量删除专业
     * 
     * @param ids 需要删除的专业主键集合
     * @return 结果
     */
    public int deleteBizMajorByIds(Long[] ids);

    /**
     * 删除专业信息
     * 
     * @param id 专业主键
     * @return 结果
     */
    public int deleteBizMajorById(Long id);
}
