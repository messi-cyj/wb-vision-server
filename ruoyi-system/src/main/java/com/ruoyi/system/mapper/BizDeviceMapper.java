package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BizDevice;
import org.apache.ibatis.annotations.Param;

/**
 * 设备Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-13
 */
public interface BizDeviceMapper 
{
    /**
     * 查询设备
     * 
     * @param id 设备主键
     * @return 设备
     */
    public BizDevice selectBizDeviceById(Long id);

    public List<BizDevice> selectBizDeviceByIdList(@Param("idList") List<Long> idList);

    /**
     * 查询设备列表
     * 
     * @param bizDevice 设备
     * @return 设备集合
     */
    public List<BizDevice> selectBizDeviceList(BizDevice bizDevice);

    /**
     * 新增设备
     * 
     * @param bizDevice 设备
     * @return 结果
     */
    public int insertBizDevice(BizDevice bizDevice);

    /**
     * 修改设备
     * 
     * @param bizDevice 设备
     * @return 结果
     */
    public int updateBizDevice(BizDevice bizDevice);

    /**
     * 删除设备
     * 
     * @param id 设备主键
     * @return 结果
     */
    public int deleteBizDeviceById(Long id);

    /**
     * 批量删除设备
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizDeviceByIds(Long[] ids);
}
