package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BizAttendance;

/**
 * 考勤Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface BizAttendanceMapper 
{
    /**
     * 查询考勤
     * 
     * @param id 考勤主键
     * @return 考勤
     */
    public BizAttendance selectBizAttendanceById(Long id);

    /**
     * 查询考勤列表
     * 
     * @param bizAttendance 考勤
     * @return 考勤集合
     */
    public List<BizAttendance> selectBizAttendanceList(BizAttendance bizAttendance);

    /**
     * 新增考勤
     * 
     * @param bizAttendance 考勤
     * @return 结果
     */
    public int insertBizAttendance(BizAttendance bizAttendance);

    /**
     * 修改考勤
     * 
     * @param bizAttendance 考勤
     * @return 结果
     */
    public int updateBizAttendance(BizAttendance bizAttendance);

    /**
     * 删除考勤
     * 
     * @param id 考勤主键
     * @return 结果
     */
    public int deleteBizAttendanceById(Long id);

    /**
     * 批量删除考勤
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizAttendanceByIds(Long[] ids);
}
