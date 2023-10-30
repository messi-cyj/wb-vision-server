package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizClassCourseMapper;
import com.ruoyi.system.domain.BizClassCourse;
import com.ruoyi.system.service.IBizClassCourseService;

/**
 * 班级课程Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@Service
public class BizClassCourseServiceImpl implements IBizClassCourseService 
{
    @Autowired
    private BizClassCourseMapper bizClassCourseMapper;

    /**
     * 查询班级课程
     * 
     * @param id 班级课程主键
     * @return 班级课程
     */
    @Override
    public BizClassCourse selectBizClassCourseById(Long id)
    {
        return bizClassCourseMapper.selectBizClassCourseById(id);
    }

    /**
     * 查询班级课程列表
     * 
     * @param bizClassCourse 班级课程
     * @return 班级课程
     */
    @Override
    public List<BizClassCourse> selectBizClassCourseList(BizClassCourse bizClassCourse)
    {
        return bizClassCourseMapper.selectBizClassCourseList(bizClassCourse);
    }

    /**
     * 新增班级课程
     * 
     * @param bizClassCourse 班级课程
     * @return 结果
     */
    @Override
    public int insertBizClassCourse(BizClassCourse bizClassCourse)
    {
        return bizClassCourseMapper.insertBizClassCourse(bizClassCourse);
    }

    /**
     * 修改班级课程
     * 
     * @param bizClassCourse 班级课程
     * @return 结果
     */
    @Override
    public int updateBizClassCourse(BizClassCourse bizClassCourse)
    {
        return bizClassCourseMapper.updateBizClassCourse(bizClassCourse);
    }

    /**
     * 批量删除班级课程
     * 
     * @param ids 需要删除的班级课程主键
     * @return 结果
     */
    @Override
    public int deleteBizClassCourseByIds(Long[] ids)
    {
        return bizClassCourseMapper.deleteBizClassCourseByIds(ids);
    }

    /**
     * 删除班级课程信息
     * 
     * @param id 班级课程主键
     * @return 结果
     */
    @Override
    public int deleteBizClassCourseById(Long id)
    {
        return bizClassCourseMapper.deleteBizClassCourseById(id);
    }
}
