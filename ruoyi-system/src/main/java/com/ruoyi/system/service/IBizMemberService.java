package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.BizMember;
import com.ruoyi.system.domain.vo.BizMemberVo;

/**
 * 用户Service接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface IBizMemberService 
{
    /**
     * 查询用户
     * 
     * @param id 用户主键
     * @return 用户
     */
    public BizMember selectBizMemberById(Long id);

    public BizMember selectBizMemberByUserId(String userId);

    public void modifyPassword(String userId, String oldPassword, String newPassword);

    /**
     * 查询用户列表
     * 
     * @param bizMember 用户
     * @return 用户集合
     */
    public List<BizMemberVo> selectBizMemberList(BizMember bizMember);

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

    public int updatePwd(Long id, String newPassword);

    /**
     * 批量删除用户
     * 
     * @param ids 需要删除的用户主键集合
     * @return 结果
     */
    public int deleteBizMemberByIds(Long[] ids);

    /**
     * 删除用户信息
     * 
     * @param id 用户主键
     * @return 结果
     */
    public int deleteBizMemberById(Long id);
}
