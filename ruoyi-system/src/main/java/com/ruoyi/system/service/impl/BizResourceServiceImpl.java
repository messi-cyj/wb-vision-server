package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizResourceMapper;
import com.ruoyi.system.domain.BizResource;
import com.ruoyi.system.service.IBizResourceService;

/**
 * 资源Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@Service
public class BizResourceServiceImpl implements IBizResourceService 
{
    @Autowired
    private BizResourceMapper bizResourceMapper;

    /**
     * 查询资源
     * 
     * @param id 资源主键
     * @return 资源
     */
    @Override
    public BizResource selectBizResourceById(Long id)
    {
        return bizResourceMapper.selectBizResourceById(id);
    }

    /**
     * 查询资源列表
     * 
     * @param bizResource 资源
     * @return 资源
     */
    @Override
    public List<BizResource> selectBizResourceList(BizResource bizResource)
    {
        return bizResourceMapper.selectBizResourceList(bizResource);
    }

    /**
     * 新增资源
     * 
     * @param bizResource 资源
     * @return 结果
     */
    @Override
    public int insertBizResource(BizResource bizResource)
    {
        bizResource.setCreateTime(DateUtils.getNowDate());
        return bizResourceMapper.insertBizResource(bizResource);
    }

    /**
     * 修改资源
     * 
     * @param bizResource 资源
     * @return 结果
     */
    @Override
    public int updateBizResource(BizResource bizResource)
    {
        bizResource.setUpdateTime(DateUtils.getNowDate());
        return bizResourceMapper.updateBizResource(bizResource);
    }

    /**
     * 批量删除资源
     * 
     * @param ids 需要删除的资源主键
     * @return 结果
     */
    @Override
    public int deleteBizResourceByIds(Long[] ids)
    {
        return bizResourceMapper.deleteBizResourceByIds(ids);
    }

    /**
     * 删除资源信息
     * 
     * @param id 资源主键
     * @return 结果
     */
    @Override
    public int deleteBizResourceById(Long id)
    {
        return bizResourceMapper.deleteBizResourceById(id);
    }
}
