package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.BizTeachingRecord;
import com.ruoyi.system.domain.vo.BizTeachingRecordVo;

/**
 * 教学记录Service接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface IBizTeachingRecordService 
{
    /**
     * 查询教学记录
     * 
     * @param id 教学记录主键
     * @return 教学记录
     */
    public BizTeachingRecordVo selectBizTeachingRecordById(Long id);

    /**
     * 查询教学记录列表
     * 
     * @param bizTeachingRecord 教学记录
     * @return 教学记录集合
     */
    public List<BizTeachingRecordVo> selectBizTeachingRecordList(BizTeachingRecord bizTeachingRecord);

    public List<BizTeachingRecord> getTeacherActiveRecord(String teacherId);

    public BizTeachingRecordVo getLatestTeachingRecord(Long academyId, Long majorId, Long gradeId, Long classId);

    public BizTeachingRecordVo getLatestTeachingRecordByCourseId(Long academyId, Long majorId, Long gradeId, Long classId, Long courseId, String teacherId);

    /**
     * 新增教学记录
     * 
     * @param bizTeachingRecord 教学记录
     * @return 结果
     */
    public int insertBizTeachingRecord(BizTeachingRecord bizTeachingRecord);

    /**
     * 修改教学记录
     * 
     * @param bizTeachingRecord 教学记录
     * @return 结果
     */
    public int updateBizTeachingRecord(BizTeachingRecord bizTeachingRecord);

    /**
     * 批量删除教学记录
     * 
     * @param ids 需要删除的教学记录主键集合
     * @return 结果
     */
    public int deleteBizTeachingRecordByIds(Long[] ids);

    /**
     * 删除教学记录信息
     * 
     * @param id 教学记录主键
     * @return 结果
     */
    public int deleteBizTeachingRecordById(Long id);
}
