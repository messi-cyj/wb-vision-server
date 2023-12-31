package com.ruoyi.framework.api.service;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.enums.UserStatus;
import com.ruoyi.common.exception.base.BaseException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.BizMember;
import com.ruoyi.system.service.IBizMemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;

@Service
public class MemberDetailsServiceImpl implements UserDetailsService
{
    private static final Logger log = LoggerFactory.getLogger(MemberDetailsServiceImpl.class);

    @Autowired
    private IBizMemberService memberService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException
    {
        BizMember user = memberService.selectBizMemberByUserId(username);
        if (StringUtils.isNull(user))
        {
            log.info("登录用户：{} 不存在.", username);
            throw new UsernameNotFoundException("登录用户：" + username + " 不存在");
        }
        else if (UserStatus.DELETED.getCode().equals(user.getStatus()))
        {
            log.info("登录用户：{} 已被删除.", username);
            throw new BaseException("对不起，您的账号：" + username + " 已被删除");
        }
        else if (UserStatus.DISABLE.getCode().equals(user.getStatus()))
        {
            log.info("登录用户：{} 已被停用.", username);
            throw new BaseException("对不起，您的账号：" + username + " 已停用");
        }

        return createLoginUser(user);
    }

    public UserDetails createLoginUser(BizMember member)
    {
        SysUser user = new SysUser();
        user.setUserId(member.getId());
        user.setUserName(member.getUserId());
        user.setPassword(member.getPassword());
        user.setEmail(member.getEmail());
        return new LoginUser(user, new HashSet<>());
    }
}
