package com.ruoyi.system.service.impl;

import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.PageUtils;
import com.ruoyi.system.domain.BizClass;
import com.ruoyi.system.domain.BizMajor;
import com.ruoyi.system.domain.vo.BizCourseVo;
import com.ruoyi.system.service.IBizClassService;
import com.ruoyi.system.service.IBizMajorService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizCourseMapper;
import com.ruoyi.system.domain.BizCourse;
import com.ruoyi.system.service.IBizCourseService;

/**
 * 课程Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@Service
public class BizCourseServiceImpl implements IBizCourseService 
{
    @Autowired
    private BizCourseMapper bizCourseMapper;

    @Autowired
    private IBizMajorService majorService;

    @Autowired
    private IBizClassService classService;

    /**
     * 查询课程
     * 
     * @param id 课程主键
     * @return 课程
     */
    @Override
    public BizCourse selectBizCourseById(Long id)
    {
        return bizCourseMapper.selectBizCourseById(id);
    }

    /**
     * 查询课程列表
     * 
     * @param bizCourse 课程
     * @return 课程
     */
    @Override
    public List<BizCourseVo> selectBizCourseList(BizCourse bizCourse)
    {
        List<BizCourse> list = bizCourseMapper.selectBizCourseList(bizCourse);
        List<BizCourseVo> results = list.parallelStream().map(it -> {
            BizCourseVo result = new BizCourseVo();
            BeanUtils.copyProperties(it, result);
            if (it.getMajorId() != null) {
                BizMajor major = majorService.selectBizMajorById(it.getMajorId());
                if (major != null) {
                    result.setMajorName(major.getName());
                }
            }
            if (it.getClassId() != null) {
                BizClass classById = classService.selectBizClassById(it.getClassId());
                if (classById != null) {
                    result.setClassName(classById.getName());
                }
            }
            return result;
        }).collect(Collectors.toList());
        return PageUtils.newPage(list, results);
    }

    /**
     * 新增课程
     * 
     * @param bizCourse 课程
     * @return 结果
     */
    @Override
    public int insertBizCourse(BizCourse bizCourse)
    {
        if (bizCourse.getClassId() != null) {
            BizClass bizClass = classService.selectBizClassById(bizCourse.getClassId());
            if (bizClass == null) {
                throw new ServiceException("班级不存在");
            }
            bizCourse.setMajorId(bizClass.getMajorId());
        }
        bizCourse.setCreateTime(DateUtils.getNowDate());

        return bizCourseMapper.insertBizCourse(bizCourse);
    }

    /**
     * 修改课程
     * 
     * @param bizCourse 课程
     * @return 结果
     */
    @Override
    public int updateBizCourse(BizCourse bizCourse)
    {
        if (bizCourse.getClassId() != null) {
            BizClass bizClass = classService.selectBizClassById(bizCourse.getClassId());
            if (bizClass == null) {
                throw new ServiceException("班级不存在");
            }
            bizCourse.setMajorId(bizClass.getMajorId());
        }
        bizCourse.setUpdateTime(DateUtils.getNowDate());
        return bizCourseMapper.updateBizCourse(bizCourse);
    }

    /**
     * 批量删除课程
     * 
     * @param ids 需要删除的课程主键
     * @return 结果
     */
    @Override
    public int deleteBizCourseByIds(Long[] ids)
    {
        return bizCourseMapper.deleteBizCourseByIds(ids);
    }

    /**
     * 删除课程信息
     * 
     * @param id 课程主键
     * @return 结果
     */
    @Override
    public int deleteBizCourseById(Long id)
    {
        return bizCourseMapper.deleteBizCourseById(id);
    }
}
