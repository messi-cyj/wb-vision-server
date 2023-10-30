package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BizTeachingRecord;
import org.apache.ibatis.annotations.Param;

/**
 * 教学记录Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface BizTeachingRecordMapper 
{
    /**
     * 查询教学记录
     * 
     * @param id 教学记录主键
     * @return 教学记录
     */
    public BizTeachingRecord selectBizTeachingRecordById(Long id);

    /**
     * 查询教学记录列表
     * 
     * @param bizTeachingRecord 教学记录
     * @return 教学记录集合
     */
    public List<BizTeachingRecord> selectBizTeachingRecordList(BizTeachingRecord bizTeachingRecord);

    public BizTeachingRecord getLatestTeachingRecord(@Param("academyId") Long academyId, @Param("majorId") Long majorId,
                                                     @Param("gradeId") Long gradeId, @Param("classId") Long classId);

    public BizTeachingRecord getLatestTeachingRecordByCourseId(@Param("academyId") Long academyId, @Param("majorId") Long majorId,
                                                     @Param("gradeId") Long gradeId, @Param("classId") Long classId, @Param("courseId") Long courseId,
                                                               @Param("teacherId") String teacherId);

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
     * 删除教学记录
     * 
     * @param id 教学记录主键
     * @return 结果
     */
    public int deleteBizTeachingRecordById(Long id);

    /**
     * 批量删除教学记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizTeachingRecordByIds(Long[] ids);
}
