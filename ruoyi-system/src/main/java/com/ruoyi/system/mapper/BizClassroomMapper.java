package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BizClassroom;

/**
 * 教室Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface BizClassroomMapper 
{
    /**
     * 查询教室
     * 
     * @param id 教室主键
     * @return 教室
     */
    public BizClassroom selectBizClassroomById(Long id);

    public BizClassroom selectBizClassroomByNo(String code);

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
     * 删除教室
     * 
     * @param id 教室主键
     * @return 结果
     */
    public int deleteBizClassroomById(Long id);

    /**
     * 批量删除教室
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizClassroomByIds(Long[] ids);
}
