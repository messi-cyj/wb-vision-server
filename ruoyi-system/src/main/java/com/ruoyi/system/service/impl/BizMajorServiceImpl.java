package com.ruoyi.system.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.PageUtils;
import com.ruoyi.system.domain.BizAcademy;
import com.ruoyi.system.domain.vo.BizMajorVo;
import com.ruoyi.system.service.IBizAcademyService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizMajorMapper;
import com.ruoyi.system.domain.BizMajor;
import com.ruoyi.system.service.IBizMajorService;

/**
 * 专业Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@Service
public class BizMajorServiceImpl implements IBizMajorService 
{
    @Autowired
    private BizMajorMapper bizMajorMapper;

    @Autowired
    private IBizAcademyService academyService;

    /**
     * 查询专业
     * 
     * @param id 专业主键
     * @return 专业
     */
    @Override
    public BizMajor selectBizMajorById(Long id)
    {
        return bizMajorMapper.selectBizMajorById(id);
    }

    /**
     * 查询专业列表
     * 
     * @param bizMajor 专业
     * @return 专业
     */
    @Override
    public List<BizMajorVo> selectBizMajorList(BizMajor bizMajor)
    {
        List<BizMajor> list = bizMajorMapper.selectBizMajorList(bizMajor);
        List<BizMajorVo> results = list.parallelStream().map(it -> {
            BizMajorVo result = new BizMajorVo();
            BeanUtils.copyProperties(it, result);
            if (it.getAcademyId() != null) {
                BizAcademy academy = academyService.selectBizAcademyById(it.getAcademyId());
                if (academy != null) {
                    result.setAcademyName(academy.getName());
                }
            }
            return result;
        }).collect(Collectors.toList());
        return PageUtils.newPage(list, results);
    }

    /**
     * 新增专业
     * 
     * @param bizMajor 专业
     * @return 结果
     */
    @Override
    public int insertBizMajor(BizMajor bizMajor)
    {
        bizMajor.setCreateTime(DateUtils.getNowDate());
        return bizMajorMapper.insertBizMajor(bizMajor);
    }

    /**
     * 修改专业
     * 
     * @param bizMajor 专业
     * @return 结果
     */
    @Override
    public int updateBizMajor(BizMajor bizMajor)
    {
        bizMajor.setUpdateTime(DateUtils.getNowDate());
        return bizMajorMapper.updateBizMajor(bizMajor);
    }

    /**
     * 批量删除专业
     * 
     * @param ids 需要删除的专业主键
     * @return 结果
     */
    @Override
    public int deleteBizMajorByIds(Long[] ids)
    {
        return bizMajorMapper.deleteBizMajorByIds(ids);
    }

    /**
     * 删除专业信息
     * 
     * @param id 专业主键
     * @return 结果
     */
    @Override
    public int deleteBizMajorById(Long id)
    {
        return bizMajorMapper.deleteBizMajorById(id);
    }
}
