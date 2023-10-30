package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.domain.vo.BizMemberVo;
import com.ruoyi.system.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BizMemberMapper;

/**
 * 用户Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@Slf4j
@Service
public class BizMemberServiceImpl implements IBizMemberService 
{
    @Autowired
    private BizMemberMapper bizMemberMapper;

    @Autowired
    private IBizSchoolService schoolService;

    @Autowired
    private IBizAcademyService academyService;

    @Autowired
    private IBizMajorService majorService;

    @Autowired
    private IBizClassService classService;

    @Autowired
    private IBizGradeService gradeService;

    @Autowired
    private ICameraService cameraService;

    @Autowired
    private IBizDeviceService deviceService;

    /**
     * 查询用户
     * 
     * @param id 用户主键
     * @return 用户
     */
    @Override
    public BizMember selectBizMemberById(Long id)
    {
        return bizMemberMapper.selectBizMemberById(id);
    }

    @Override
    public BizMember selectBizMemberByUserId(String userId) {
        return bizMemberMapper.selectBizMemberByUserId(userId);
    }

    @Override
    public void modifyPassword(String userId, String oldPassword, String newPassword) {
        BizMember member = bizMemberMapper.selectBizMemberByUserId(userId);
        if (member == null) {
            throw new ServiceException("用户不存在");
        }
        if (!SecurityUtils.matchesPassword(oldPassword, member.getPassword())) {
            throw new ServiceException("旧密码不正确");
        }
        if (StringUtils.isBlank(newPassword) || newPassword.trim().length() < 5) {
            throw new ServiceException("新密码不正确，长度必须大于等于5");
        }
        member.setPassword(SecurityUtils.encryptPassword(newPassword));
        member.setUpdateTime(new Date());
        bizMemberMapper.updateBizMember(member);
    }

    /**
     * 查询用户列表
     * 
     * @param bizMember 用户
     * @return 用户
     */
    @Override
    public List<BizMemberVo> selectBizMemberList(BizMember bizMember)
    {
        List<BizMember> memberList = bizMemberMapper.selectBizMemberList(bizMember);
        return memberList.parallelStream().map(it -> {
            BizMemberVo result = new BizMemberVo();
            BeanUtils.copyProperties(it, result);
            if (it.getSchoolId() != null) {
                BizSchool school = schoolService.selectBizSchoolById(it.getSchoolId());
                if (school != null) {
                    result.setSchoolName(school.getName());
                }
            }
            if (it.getAcademyId() != null) {
                BizAcademy academy = academyService.selectBizAcademyById(it.getAcademyId());
                if (academy != null) {
                    result.setAcademyName(academy.getName());
                }
            }
            if (it.getMajorId() != null) {
                BizMajor major = majorService.selectBizMajorById(it.getMajorId());
                if (major != null) {
                    result.setMajorName(major.getName());
                }
            }
            if (it.getGradeId() != null) {
                BizGrade grade = gradeService.selectBizGradeById(it.getGradeId());
                if (grade != null) {
                    result.setGradeName(grade.getName());
                }
            }
            if (it.getClassId() != null) {
                BizClass clazz = classService.selectBizClassById(it.getClassId());
                if (clazz != null) {
                    result.setClassName(clazz.getName());
                }
            }
            return result;
        }).collect(Collectors.toList());
    }

    /**
     * 新增用户
     * 
     * @param bizMember 用户
     * @return 结果
     */
    @Override
    public int insertBizMember(BizMember bizMember)
    {
        bizMember.setPassword(SecurityUtils.encryptPassword(bizMember.getPassword().trim()));
        bizMember.setCreateTime(DateUtils.getNowDate());

        // 同步人脸
        if (StringUtils.isNotBlank(bizMember.getAvatar())) {
            List<BizDevice> deviceList = deviceService.selectBizDeviceList(new BizDevice());
            List<BizDevice> faceList = deviceList.parallelStream().filter(it -> it.getType().equals("face")).collect(Collectors.toList());
            if (faceList.size() > 0) {
                String[] relativePaths = bizMember.getAvatar().split("/profile");
                String filePath = RuoYiConfig.getUploadPath() + relativePaths[1];
                for (BizDevice device : faceList) {
                    try {
                        cameraService.publishFaceImage(device, filePath, bizMember.getName(),
                                bizMember.getBirthday(), bizMember.getIdentificationNumber());
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                }
            }
        }

        return bizMemberMapper.insertBizMember(bizMember);
    }

    /**
     * 修改用户
     * 
     * @param bizMember 用户
     * @return 结果
     */
    @Override
    public int updateBizMember(BizMember bizMember)
    {
        bizMember.setUpdateTime(DateUtils.getNowDate());
        bizMember.setPassword(null);
        BizMember old = bizMemberMapper.selectBizMemberByUserId(bizMember.getUserId());

        // 同步人脸
        if (StringUtils.isNotBlank(bizMember.getAvatar()) && !bizMember.getAvatar().equals(old.getAvatar())) {
            List<BizDevice> deviceList = deviceService.selectBizDeviceList(new BizDevice());
            List<BizDevice> faceList = deviceList.parallelStream().filter(it -> it.getType().equals("face")).collect(Collectors.toList());
            if (faceList.size() > 0) {
                String[] relativePaths = bizMember.getAvatar().split("/profile");
                String filePath = RuoYiConfig.getProfile() + relativePaths[1];
                for (BizDevice device : faceList) {
                    try {
                        cameraService.publishFaceImage(device, filePath, bizMember.getUserId(),
                                bizMember.getBirthday(), bizMember.getIdentificationNumber());
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                }
            }
        }

        return bizMemberMapper.updateBizMember(bizMember);
    }

    @Override
    public int updatePwd(Long id, String newPassword) {
        BizMember old = bizMemberMapper.selectBizMemberById(id);
        if (old == null) {
            throw new ServiceException("用户不存在");
        }
        old.setUpdateTime(DateUtils.getNowDate());
        old.setPassword(SecurityUtils.encryptPassword(newPassword));

        return bizMemberMapper.updateBizMember(old);
    }

    /**
     * 批量删除用户
     * 
     * @param ids 需要删除的用户主键
     * @return 结果
     */
    @Override
    public int deleteBizMemberByIds(Long[] ids)
    {
        return bizMemberMapper.deleteBizMemberByIds(ids);
    }

    /**
     * 删除用户信息
     * 
     * @param id 用户主键
     * @return 结果
     */
    @Override
    public int deleteBizMemberById(Long id)
    {
        return bizMemberMapper.deleteBizMemberById(id);
    }
}
