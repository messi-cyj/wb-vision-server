package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.BizClassroom;

/**
 * 教室Service接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface IBizClassroomService 
{
    /**
     * 查询教室
     * 
     * @param id 教室主键
     * @return 教室
     */
    public BizClassroom selectBizClassroomById(Long id);

    public BizClassroom selectBizClassroomByNo(String no);

    /**
     * 查询教室列表
     * 
     * @param bizClassroom 教室
     * @return 教室集合
     */
    public List<BizClassroom> selectBizClassroomList(BizClassroom bizClassroom);

    /**
     * 新增教室
     * 
     * @param bizClassroom 教室
     * @return 结果
     */
    public int insertBizClassroom(BizClassroom bizClassroom);

    /**
     * 修改教室
     * 
     * @param bizClassroom 教室
     * @return 结果
     */
    public int updateBizClassroom(BizClassroom bizClassroom);

    /**
     * 批量删除教室
     * 
     * @param ids 需要删除的教室主键集合
     * @return 结果
     */
    public int deleteBizClassroomByIds(Long[] ids);

    /**
     * 删除教室信息
     * 
     * @param id 教室主键
     * @return 结果
     */
    public int deleteBizClassroomById(Long id);
}
