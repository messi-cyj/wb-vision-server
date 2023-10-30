package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BizClassCourse;

/**
 * 班级课程Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface BizClassCourseMapper 
{
    /**
     * 查询班级课程
     * 
     * @param id 班级课程主键
     * @return 班级课程
     */
    public BizClassCourse selectBizClassCourseById(Long id);

    /**
     * 查询班级课程列表
     * 
     * @param bizClassCourse 班级课程
     * @return 班级课程集合
     */
    public List<BizClassCourse> selectBizClassCourseList(BizClassCourse bizClassCourse);

    /**
     * 新增班级课程
     * 
     * @param bizClassCourse 班级课程
     * @return 结果
     */
    public int insertBizClassCourse(BizClassCourse bizClassCourse);

    /**
     * 修改班级课程
     * 
     * @param bizClassCourse 班级课程
     * @return 结果
     */
    public int updateBizClassCourse(BizClassCourse bizClassCourse);

    /**
     * 删除班级课程
     * 
     * @param id 班级课程主键
     * @return 结果
     */
    public int deleteBizClassCourseById(Long id);

    /**
     * 批量删除班级课程
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizClassCourseByIds(Long[] ids);
}
