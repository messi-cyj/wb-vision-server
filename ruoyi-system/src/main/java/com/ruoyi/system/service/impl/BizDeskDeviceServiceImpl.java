package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizDeskDeviceMapper;
import com.ruoyi.system.domain.BizDeskDevice;
import com.ruoyi.system.service.IBizDeskDeviceService;

/**
 * 桌子设备Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-13
 */
@Service
public class BizDeskDeviceServiceImpl implements IBizDeskDeviceService 
{
    @Autowired
    private BizDeskDeviceMapper bizDeskDeviceMapper;

    /**
     * 查询桌子设备
     * 
     * @param id 桌子设备主键
     * @return 桌子设备
     */
    @Override
    public BizDeskDevice selectBizDeskDeviceById(Long id)
    {
        return bizDeskDeviceMapper.selectBizDeskDeviceById(id);
    }

    /**
     * 查询桌子设备列表
     * 
     * @param bizDeskDevice 桌子设备
     * @return 桌子设备
     */
    @Override
    public List<BizDeskDevice> selectBizDeskDeviceList(BizDeskDevice bizDeskDevice)
    {
        return bizDeskDeviceMapper.selectBizDeskDeviceList(bizDeskDevice);
    }

    /**
     * 新增桌子设备
     * 
     * @param bizDeskDevice 桌子设备
     * @return 结果
     */
    @Override
    public int insertBizDeskDevice(BizDeskDevice bizDeskDevice)
    {
        bizDeskDevice.setCreateTime(DateUtils.getNowDate());
        return bizDeskDeviceMapper.insertBizDeskDevice(bizDeskDevice);
    }

    /**
     * 修改桌子设备
     * 
     * @param bizDeskDevice 桌子设备
     * @return 结果
     */
    @Override
    public int updateBizDeskDevice(BizDeskDevice bizDeskDevice)
    {
        bizDeskDevice.setUpdateTime(DateUtils.getNowDate());
        return bizDeskDeviceMapper.updateBizDeskDevice(bizDeskDevice);
    }

    /**
     * 批量删除桌子设备
     * 
     * @param ids 需要删除的桌子设备主键
     * @return 结果
     */
    @Override
    public int deleteBizDeskDeviceByIds(Long[] ids)
    {
        return bizDeskDeviceMapper.deleteBizDeskDeviceByIds(ids);
    }

    /**
     * 删除桌子设备信息
     * 
     * @param id 桌子设备主键
     * @return 结果
     */
    @Override
    public int deleteBizDeskDeviceById(Long id)
    {
        return bizDeskDeviceMapper.deleteBizDeskDeviceById(id);
    }
}
