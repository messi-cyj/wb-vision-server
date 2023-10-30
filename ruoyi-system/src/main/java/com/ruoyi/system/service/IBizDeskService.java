package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.BizDesk;
import com.ruoyi.system.domain.BizDeskDevice;
import com.ruoyi.system.domain.vo.BizDeskDeviceVo;
import com.ruoyi.system.domain.vo.BizDeskVo;

/**
 * 桌子Service接口
 * 
 * @author ruoyi
 * @date 2022-04-13
 */
public interface IBizDeskService 
{
    /**
     * 查询桌子
     * 
     * @param id 桌子主键
     * @return 桌子
     */
    public BizDesk selectBizDeskById(Long id);

    public BizDesk selectBizDeskByNo(Long classroomId, String no);

    /**
     * 查询桌子列表
     * 
     * @param bizDesk 桌子
     * @return 桌子集合
     */
    public List<BizDeskVo> selectBizDeskList(BizDesk bizDesk);

    /**
     * 新增桌子
     * 
     * @param bizDesk 桌子
     * @return 结果
     */
    public int insertBizDesk(BizDesk bizDesk);

    public void bindDevice(BizDeskDevice deskDevice);

    public void unbindDevice(Long classroomId, Long deskId, Long deviceId);

    public List<BizDeskDeviceVo> getBindDeviceList(Long deskId);

    /**
     * 修改桌子
     * 
     * @param bizDesk 桌子
     * @return 结果
     */
    public int updateBizDesk(BizDesk bizDesk);

    /**
     * 批量删除桌子
     * 
     * @param ids 需要删除的桌子主键集合
     * @return 结果
     */
    public int deleteBizDeskByIds(Long[] ids);

    /**
     * 删除桌子信息
     * 
     * @param id 桌子主键
     * @return 结果
     */
    public int deleteBizDeskById(Long id);
}
