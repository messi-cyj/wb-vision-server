package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.BizAttendance;
import com.ruoyi.system.domain.vo.BizAttendanceVo;

/**
 * 考勤Service接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface IBizAttendanceService 
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
    public List<BizAttendanceVo> selectBizAttendanceList(BizAttendance bizAttendance);

    /**
     * 新增考勤
     * 
     * @param bizAttendance 考勤
     * @return 结果
     */
    public int insertBizAttendance(BizAttendance bizAttendance);

    public void createAttendance(Long teachingRecordId, String studentId, String classroomName, String deskNo);

    /**
     * 修改考勤
     * 
     * @param bizAttendance 考勤
     * @return 结果
     */
    public int updateBizAttendance(BizAttendance bizAttendance);

    /**
     * 批量删除考勤
     * 
     * @param ids 需要删除的考勤主键集合
     * @return 结果
     */
    public int deleteBizAttendanceByIds(Long[] ids);

    /**
     * 删除考勤信息
     * 
     * @param id 考勤主键
     * @return 结果
     */
    public int deleteBizAttendanceById(Long id);
}
