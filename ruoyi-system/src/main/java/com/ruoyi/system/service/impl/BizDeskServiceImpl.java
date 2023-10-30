package com.ruoyi.system.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.PageUtils;
import com.ruoyi.system.domain.BizClassroom;
import com.ruoyi.system.domain.BizDeskDevice;
import com.ruoyi.system.domain.BizDevice;
import com.ruoyi.system.domain.vo.BizDeskDeviceVo;
import com.ruoyi.system.domain.vo.BizDeskVo;
import com.ruoyi.system.service.IBizClassroomService;
import com.ruoyi.system.service.IBizDeskDeviceService;
import com.ruoyi.system.service.IBizDeviceService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizDeskMapper;
import com.ruoyi.system.domain.BizDesk;
import com.ruoyi.system.service.IBizDeskService;

/**
 * 桌子Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-13
 */
@Service
public class BizDeskServiceImpl implements IBizDeskService 
{
    @Autowired
    private BizDeskMapper bizDeskMapper;

    @Autowired
    private IBizDeskService deskService;

    @Autowired
    private IBizDeviceService deviceService;

    @Autowired
    private IBizClassroomService classroomService;

    @Autowired
    private IBizDeskDeviceService deskDeviceService;

    /**
     * 查询桌子
     * 
     * @param id 桌子主键
     * @return 桌子
     */
    @Override
    public BizDesk selectBizDeskById(Long id)
    {
        return bizDeskMapper.selectBizDeskById(id);
    }

    @Override
    public BizDesk selectBizDeskByNo(Long classroomId, String no) {
        return bizDeskMapper.selectBizDeskByNo(classroomId, no);
    }

    /**
     * 查询桌子列表
     * 
     * @param bizDesk 桌子
     * @return 桌子
     */
    @Override
    public List<BizDeskVo> selectBizDeskList(BizDesk bizDesk)
    {
        List<BizDesk> list = bizDeskMapper.selectBizDeskList(bizDesk);
        List<BizDeskVo> results = list.parallelStream().map(it -> {
            BizDeskVo result = new BizDeskVo();
            BeanUtils.copyProperties(it, result);
            BizClassroom classroom = classroomService.selectBizClassroomById(it.getClassroomId());
            if (classroom != null) {
                result.setClassroomName(classroom.getName());
                result.setClassroomNo(classroom.getNo());
            }

            BizDeskDevice condition = new BizDeskDevice();
            condition.setClassroomId(it.getClassroomId());
            condition.setDeskId(it.getId());
            List<BizDeskDevice> deskDeviceList = deskDeviceService.selectBizDeskDeviceList(condition);
            List<BizDevice> deviceList = deviceService.selectBizDeviceByIdList(deskDeviceList.parallelStream().map(item -> item.getDeviceId()).collect(Collectors.toList()));
            result.setDeviceList(deviceList);

            return result;
        }).collect(Collectors.toList());
        return PageUtils.newPage(list, results);

    }

    /**
     * 新增桌子
     * 
     * @param bizDesk 桌子
     * @return 结果
     */
    @Override
    public int insertBizDesk(BizDesk bizDesk)
    {
        bizDesk.setCreateTime(DateUtils.getNowDate());
        return bizDeskMapper.insertBizDesk(bizDesk);
    }

    @Override
    public void bindDevice(BizDeskDevice deskDevice) {
        deskDeviceService.insertBizDeskDevice(deskDevice);
    }

    @Override
    public void unbindDevice(Long classroomId, Long deskId, Long deviceId) {
        BizDeskDevice condition = new BizDeskDevice();
        condition.setClassroomId(classroomId);
        condition.setDeskId(deskId);
        condition.setDeviceId(deviceId);
        List<BizDeskDevice> deskDeviceList = deskDeviceService.selectBizDeskDeviceList(condition);
        if (deskDeviceList.size() == 0) {
            return;
        }
        deskDeviceService.deleteBizDeskDeviceById(deskDeviceList.get(0).getId());
    }

    @Override
    public List<BizDeskDeviceVo> getBindDeviceList(Long deskId) {
        BizDesk bizDesk = selectBizDeskById(deskId);
        if (bizDesk == null) {
            throw new ServiceException("桌子不存在");
        }
        BizDeskDevice condition = new BizDeskDevice();
        condition.setClassroomId(bizDesk.getClassroomId());
        condition.setDeskId(deskId);
        List<BizDeskDevice> deskDeviceList = deskDeviceService.selectBizDeskDeviceList(condition);
        return deskDeviceList.parallelStream().map(it -> {
            BizDeskDeviceVo result = new BizDeskDeviceVo();
            BeanUtils.copyProperties(it, result);
            if (it.getDeskId() != null) {
                BizDesk desk = deskService.selectBizDeskById(it.getDeskId());
                if (desk != null) {
                    result.setDesk(desk);
                }
            }
            if (it.getDeviceId() != null) {
                BizDevice device = deviceService.selectBizDeviceById(it.getDeviceId());
                if (device != null) {
                    result.setDevice(device);
                }
            }
            return result;
        }).collect(Collectors.toList());
    }

    /**
     * 修改桌子
     * 
     * @param bizDesk 桌子
     * @return 结果
     */
    @Override
    public int updateBizDesk(BizDesk bizDesk)
    {
        bizDesk.setUpdateTime(DateUtils.getNowDate());
        return bizDeskMapper.updateBizDesk(bizDesk);
    }

    /**
     * 批量删除桌子
     * 
     * @param ids 需要删除的桌子主键
     * @return 结果
     */
    @Override
    public int deleteBizDeskByIds(Long[] ids)
    {
        return bizDeskMapper.deleteBizDeskByIds(ids);
    }

    /**
     * 删除桌子信息
     * 
     * @param id 桌子主键
     * @return 结果
     */
    @Override
    public int deleteBizDeskById(Long id)
    {
        return bizDeskMapper.deleteBizDeskById(id);
    }
}
