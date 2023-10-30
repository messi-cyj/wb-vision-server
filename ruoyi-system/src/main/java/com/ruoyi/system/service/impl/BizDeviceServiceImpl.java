package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.apache.commons.compress.utils.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizDeviceMapper;
import com.ruoyi.system.domain.BizDevice;
import com.ruoyi.system.service.IBizDeviceService;

/**
 * 设备Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-13
 */
@Service
public class BizDeviceServiceImpl implements IBizDeviceService 
{
    @Autowired
    private BizDeviceMapper bizDeviceMapper;

    /**
     * 查询设备
     * 
     * @param id 设备主键
     * @return 设备
     */
    @Override
    public BizDevice selectBizDeviceById(Long id)
    {
        return bizDeviceMapper.selectBizDeviceById(id);
    }

    @Override
    public List<BizDevice> selectBizDeviceByIdList(List<Long> idList) {
        if (idList.size() == 0) {
            return Lists.newArrayList();
        }
        return bizDeviceMapper.selectBizDeviceByIdList(idList);
    }

    /**
     * 查询设备列表
     * 
     * @param bizDevice 设备
     * @return 设备
     */
    @Override
    public List<BizDevice> selectBizDeviceList(BizDevice bizDevice)
    {
        return bizDeviceMapper.selectBizDeviceList(bizDevice);
    }

    /**
     * 新增设备
     * 
     * @param bizDevice 设备
     * @return 结果
     */
    @Override
    public int insertBizDevice(BizDevice bizDevice)
    {
        bizDevice.setCreateTime(DateUtils.getNowDate());
        return bizDeviceMapper.insertBizDevice(bizDevice);
    }

    /**
     * 修改设备
     * 
     * @param bizDevice 设备
     * @return 结果
     */
    @Override
    public int updateBizDevice(BizDevice bizDevice)
    {
        bizDevice.setUpdateTime(DateUtils.getNowDate());
        return bizDeviceMapper.updateBizDevice(bizDevice);
    }

    /**
     * 批量删除设备
     * 
     * @param ids 需要删除的设备主键
     * @return 结果
     */
    @Override
    public int deleteBizDeviceByIds(Long[] ids)
    {
        return bizDeviceMapper.deleteBizDeviceByIds(ids);
    }

    /**
     * 删除设备信息
     * 
     * @param id 设备主键
     * @return 结果
     */
    @Override
    public int deleteBizDeviceById(Long id)
    {
        return bizDeviceMapper.deleteBizDeviceById(id);
    }
}
