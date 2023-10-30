package com.ruoyi.system.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.PageUtils;
import com.ruoyi.system.domain.BizMajor;
import com.ruoyi.system.domain.vo.BizClassVo;
import com.ruoyi.system.service.IBizMajorService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizClassMapper;
import com.ruoyi.system.domain.BizClass;
import com.ruoyi.system.service.IBizClassService;

/**
 * 班级Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@Service
public class BizClassServiceImpl implements IBizClassService 
{
    @Autowired
    private BizClassMapper bizClassMapper;

    @Autowired
    private IBizMajorService majorService;

    /**
     * 查询班级
     * 
     * @param id 班级主键
     * @return 班级
     */
    @Override
    public BizClass selectBizClassById(Long id)
    {
        return bizClassMapper.selectBizClassById(id);
    }

    /**
     * 查询班级列表
     * 
     * @param bizClass 班级
     * @return 班级
     */
    @Override
    public List<BizClassVo> selectBizClassList(BizClass bizClass)
    {
        List<BizClass> list = bizClassMapper.selectBizClassList(bizClass);
        List<BizClassVo> results = list.parallelStream().map(it -> {
            BizClassVo result = new BizClassVo();
            BeanUtils.copyProperties(it, result);
            BizMajor major = majorService.selectBizMajorById(it.getMajorId());
            if (major != null) {
                result.setMajorName(major.getName());
            }
            return result;
        }).collect(Collectors.toList());

        return PageUtils.newPage(list, results);
    }

    /**
     * 新增班级
     * 
     * @param bizClass 班级
     * @return 结果
     */
    @Override
    public int insertBizClass(BizClass bizClass)
    {
        bizClass.setCreateTime(DateUtils.getNowDate());
        return bizClassMapper.insertBizClass(bizClass);
    }

    /**
     * 修改班级
     * 
     * @param bizClass 班级
     * @return 结果
     */
    @Override
    public int updateBizClass(BizClass bizClass)
    {
        bizClass.setUpdateTime(DateUtils.getNowDate());
        return bizClassMapper.updateBizClass(bizClass);
    }

    /**
     * 批量删除班级
     * 
     * @param ids 需要删除的班级主键
     * @return 结果
     */
    @Override
    public int deleteBizClassByIds(Long[] ids)
    {
        return bizClassMapper.deleteBizClassByIds(ids);
    }

    /**
     * 删除班级信息
     * 
     * @param id 班级主键
     * @return 结果
     */
    @Override
    public int deleteBizClassById(Long id)
    {
        return bizClassMapper.deleteBizClassById(id);
    }
}
