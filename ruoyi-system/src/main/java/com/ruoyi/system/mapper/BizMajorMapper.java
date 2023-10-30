package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BizMajor;

/**
 * 专业Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface BizMajorMapper 
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
    public List<BizMajor> selectBizMajorList(BizMajor bizMajor);

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
     * 删除专业
     * 
     * @param id 专业主键
     * @return 结果
     */
    public int deleteBizMajorById(Long id);

    /**
     * 批量删除专业
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizMajorByIds(Long[] ids);
}
