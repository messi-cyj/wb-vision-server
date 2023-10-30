package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.BizDeskDevice;

/**
 * 桌子设备Service接口
 * 
 * @author ruoyi
 * @date 2022-04-13
 */
public interface IBizDeskDeviceService 
{
    /**
     * 查询桌子设备
     * 
     * @param id 桌子设备主键
     * @return 桌子设备
     */
    public BizDeskDevice selectBizDeskDeviceById(Long id);

    /**
     * 查询桌子设备列表
     * 
     * @param bizDeskDevice 桌子设备
     * @return 桌子设备集合
     */
    public List<BizDeskDevice> selectBizDeskDeviceList(BizDeskDevice bizDeskDevice);

    /**
     * 新增桌子设备
     * 
     * @param bizDeskDevice 桌子设备
     * @return 结果
     */
    public int insertBizDeskDevice(BizDeskDevice bizDeskDevice);

    /**
     * 修改桌子设备
     * 
     * @param bizDeskDevice 桌子设备
     * @return 结果
     */
    public int updateBizDeskDevice(BizDeskDevice bizDeskDevice);

    /**
     * 批量删除桌子设备
     * 
     * @param ids 需要删除的桌子设备主键集合
     * @return 结果
     */
    public int deleteBizDeskDeviceByIds(Long[] ids);

    /**
     * 删除桌子设备信息
     * 
     * @param id 桌子设备主键
     * @return 结果
     */
    public int deleteBizDeskDeviceById(Long id);
}
