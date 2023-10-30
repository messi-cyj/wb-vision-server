package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BizResource;

/**
 * 资源Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface BizResourceMapper 
{
    /**
     * 查询资源
     * 
     * @param id 资源主键
     * @return 资源
     */
    public BizResource selectBizResourceById(Long id);

    /**
     * 查询资源列表
     * 
     * @param bizResource 资源
     * @return 资源集合
     */
    public List<BizResource> selectBizResourceList(BizResource bizResource);

    /**
     * 新增资源
     * 
     * @param bizResource 资源
     * @return 结果
     */
    public int insertBizResource(BizResource bizResource);

    /**
     * 修改资源
     * 
     * @param bizResource 资源
     * @return 结果
     */
    public int updateBizResource(BizResource bizResource);

    /**
     * 删除资源
     * 
     * @param id 资源主键
     * @return 结果
     */
    public int deleteBizResourceById(Long id);

    /**
     * 批量删除资源
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizResourceByIds(Long[] ids);
}
