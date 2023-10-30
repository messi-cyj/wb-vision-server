package com.ruoyi.system.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.PageUtils;
import com.ruoyi.system.domain.BizSchool;
import com.ruoyi.system.domain.vo.BizAcademyVo;
import com.ruoyi.system.service.IBizSchoolService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizAcademyMapper;
import com.ruoyi.system.domain.BizAcademy;
import com.ruoyi.system.service.IBizAcademyService;

/**
 * 学院Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@Service
public class BizAcademyServiceImpl implements IBizAcademyService 
{
    @Autowired
    private BizAcademyMapper bizAcademyMapper;

    @Autowired
    private IBizSchoolService schoolService;

    /**
     * 查询学院
     * 
     * @param id 学院主键
     * @return 学院
     */
    @Override
    public BizAcademy selectBizAcademyById(Long id)
    {
        return bizAcademyMapper.selectBizAcademyById(id);
    }

    /**
     * 查询学院列表
     * 
     * @param bizAcademy 学院
     * @return 学院
     */
    @Override
    public List<BizAcademyVo> selectBizAcademyList(BizAcademy bizAcademy)
    {
        List<BizAcademy> list = bizAcademyMapper.selectBizAcademyList(bizAcademy);
        List<BizAcademyVo> results = list.parallelStream().map(it -> {
            BizAcademyVo result = new BizAcademyVo();
            BeanUtils.copyProperties(it, result);
            if (it.getSchoolId() != null) {
                BizSchool school = schoolService.selectBizSchoolById(it.getSchoolId());
                if (school != null) {
                    result.setSchoolName(school.getName());
                }
            }
            return result;
        }).collect(Collectors.toList());
        return PageUtils.newPage(list, results);
    }

    /**
     * 新增学院
     * 
     * @param bizAcademy 学院
     * @return 结果
     */
    @Override
    public int insertBizAcademy(BizAcademy bizAcademy)
    {
        bizAcademy.setCreateTime(DateUtils.getNowDate());
        return bizAcademyMapper.insertBizAcademy(bizAcademy);
    }

    /**
     * 修改学院
     * 
     * @param bizAcademy 学院
     * @return 结果
     */
    @Override
    public int updateBizAcademy(BizAcademy bizAcademy)
    {
        bizAcademy.setUpdateTime(DateUtils.getNowDate());
        return bizAcademyMapper.updateBizAcademy(bizAcademy);
    }

    /**
     * 批量删除学院
     * 
     * @param ids 需要删除的学院主键
     * @return 结果
     */
    @Override
    public int deleteBizAcademyByIds(Long[] ids)
    {
        return bizAcademyMapper.deleteBizAcademyByIds(ids);
    }

    /**
     * 删除学院信息
     * 
     * @param id 学院主键
     * @return 结果
     */
    @Override
    public int deleteBizAcademyById(Long id)
    {
        return bizAcademyMapper.deleteBizAcademyById(id);
    }
}
