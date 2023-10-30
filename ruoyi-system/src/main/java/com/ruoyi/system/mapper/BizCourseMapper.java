package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BizCourse;

/**
 * 课程Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface BizCourseMapper 
{
    /**
     * 查询课程
     * 
     * @param id 课程主键
     * @return 课程
     */
    public BizCourse selectBizCourseById(Long id);

    /**
     * 查询课程列表
     * 
     * @param bizCourse 课程
     * @return 课程集合
     */
    public List<BizCourse> selectBizCourseList(BizCourse bizCourse);

    /**
     * 新增课程
     * 
     * @param bizCourse 课程
     * @return 结果
     */
    public int insertBizCourse(BizCourse bizCourse);

    /**
     * 修改课程
     * 
     * @param bizCourse 课程
     * @return 结果
     */
    public int updateBizCourse(BizCourse bizCourse);

    /**
     * 删除课程
     * 
     * @param id 课程主键
     * @return 结果
     */
    public int deleteBizCourseById(Long id);

    /**
     * 批量删除课程
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizCourseByIds(Long[] ids);
}
