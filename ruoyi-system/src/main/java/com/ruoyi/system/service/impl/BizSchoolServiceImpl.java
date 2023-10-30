package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizSchoolMapper;
import com.ruoyi.system.domain.BizSchool;
import com.ruoyi.system.service.IBizSchoolService;

/**
 * 学校Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@Service
public class BizSchoolServiceImpl implements IBizSchoolService 
{
    @Autowired
    private BizSchoolMapper bizSchoolMapper;

    /**
     * 查询学校
     * 
     * @param id 学校主键
     * @return 学校
     */
    @Override
    public BizSchool selectBizSchoolById(Long id)
    {
        return bizSchoolMapper.selectBizSchoolById(id);
    }

    /**
     * 查询学校列表
     * 
     * @param bizSchool 学校
     * @return 学校
     */
    @Override
    public List<BizSchool> selectBizSchoolList(BizSchool bizSchool)
    {
        return bizSchoolMapper.selectBizSchoolList(bizSchool);
    }

    /**
     * 新增学校
     * 
     * @param bizSchool 学校
     * @return 结果
     */
    @Override
    public int insertBizSchool(BizSchool bizSchool)
    {
        bizSchool.setCreateTime(DateUtils.getNowDate());
        return bizSchoolMapper.insertBizSchool(bizSchool);
    }

    /**
     * 修改学校
     * 
     * @param bizSchool 学校
     * @return 结果
     */
    @Override
    public int updateBizSchool(BizSchool bizSchool)
    {
        bizSchool.setUpdateTime(DateUtils.getNowDate());
        return bizSchoolMapper.updateBizSchool(bizSchool);
    }

    /**
     * 批量删除学校
     * 
     * @param ids 需要删除的学校主键
     * @return 结果
     */
    @Override
    public int deleteBizSchoolByIds(Long[] ids)
    {
        return bizSchoolMapper.deleteBizSchoolByIds(ids);
    }

    /**
     * 删除学校信息
     * 
     * @param id 学校主键
     * @return 结果
     */
    @Override
    public int deleteBizSchoolById(Long id)
    {
        return bizSchoolMapper.deleteBizSchoolById(id);
    }
}
