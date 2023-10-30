package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.BizSchool;

/**
 * 学校Service接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface IBizSchoolService 
{
    /**
     * 查询学校
     * 
     * @param id 学校主键
     * @return 学校
     */
    public BizSchool selectBizSchoolById(Long id);

    /**
     * 查询学校列表
     * 
     * @param bizSchool 学校
     * @return 学校集合
     */
    public List<BizSchool> selectBizSchoolList(BizSchool bizSchool);

    /**
     * 新增学校
     * 
     * @param bizSchool 学校
     * @return 结果
     */
    public int insertBizSchool(BizSchool bizSchool);

    /**
     * 修改学校
     * 
     * @param bizSchool 学校
     * @return 结果
     */
    public int updateBizSchool(BizSchool bizSchool);

    /**
     * 批量删除学校
     * 
     * @param ids 需要删除的学校主键集合
     * @return 结果
     */
    public int deleteBizSchoolByIds(Long[] ids);

    /**
     * 删除学校信息
     * 
     * @param id 学校主键
     * @return 结果
     */
    public int deleteBizSchoolById(Long id);
}
