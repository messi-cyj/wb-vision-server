package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizClassroomMapper;
import com.ruoyi.system.domain.BizClassroom;
import com.ruoyi.system.service.IBizClassroomService;

/**
 * 教室Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@Service
public class BizClassroomServiceImpl implements IBizClassroomService 
{
    @Autowired
    private BizClassroomMapper bizClassroomMapper;

    /**
     * 查询教室
     * 
     * @param id 教室主键
     * @return 教室
     */
    @Override
    public BizClassroom selectBizClassroomById(Long id)
    {
        return bizClassroomMapper.selectBizClassroomById(id);
    }

    @Override
    public BizClassroom selectBizClassroomByNo(String code) {
        return bizClassroomMapper.selectBizClassroomByNo(code);
    }

    /**
     * 查询教室列表
     * 
     * @param bizClassroom 教室
     * @return 教室
     */
    @Override
    public List<BizClassroom> selectBizClassroomList(BizClassroom bizClassroom)
    {
        return bizClassroomMapper.selectBizClassroomList(bizClassroom);
    }

    /**
     * 新增教室
     * 
     * @param bizClassroom 教室
     * @return 结果
     */
    @Override
    public int insertBizClassroom(BizClassroom bizClassroom)
    {
        bizClassroom.setCreateTime(DateUtils.getNowDate());
        return bizClassroomMapper.insertBizClassroom(bizClassroom);
    }

    /**
     * 修改教室
     * 
     * @param bizClassroom 教室
     * @return 结果
     */
    @Override
    public int updateBizClassroom(BizClassroom bizClassroom)
    {
        bizClassroom.setUpdateTime(DateUtils.getNowDate());
        return bizClassroomMapper.updateBizClassroom(bizClassroom);
    }

    /**
     * 批量删除教室
     * 
     * @param ids 需要删除的教室主键
     * @return 结果
     */
    @Override
    public int deleteBizClassroomByIds(Long[] ids)
    {
        return bizClassroomMapper.deleteBizClassroomByIds(ids);
    }

    /**
     * 删除教室信息
     * 
     * @param id 教室主键
     * @return 结果
     */
    @Override
    public int deleteBizClassroomById(Long id)
    {
        return bizClassroomMapper.deleteBizClassroomById(id);
    }
}
