package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BizMember;

/**
 * 用户Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface BizMemberMapper 
{
    /**
     * 查询用户
     * 
     * @param id 用户主键
     * @return 用户
     */
    public BizMember selectBizMemberById(Long id);

    public BizMember selectBizMemberByUserId(String userId);

    /**
     * 查询用户列表
     * 
     * @param bizMember 用户
     * @return 用户集合
     */
    public List<BizMember> selectBizMemberList(BizMember bizMember);

    /**
     * 新增用户
     * 
     * @param bizMember 用户
     * @return 结果
     */
    public int insertBizMember(BizMember bizMember);

    /**
     * 修改用户
     * 
     * @param bizMember 用户
     * @return 结果
     */
    public int updateBizMember(BizMember bizMember);

    /**
     * 删除用户
     * 
     * @param id 用户主键
     * @return 结果
     */
    public int deleteBizMemberById(Long id);

    /**
     * 批量删除用户
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizMemberByIds(Long[] ids);
}
