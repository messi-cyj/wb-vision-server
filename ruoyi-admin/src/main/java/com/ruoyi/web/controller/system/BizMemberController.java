package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.vo.BizMemberVo;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.BizMember;
import com.ruoyi.system.service.IBizMemberService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户Controller
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@RestController
@RequestMapping("/system/member")
public class BizMemberController extends BaseController
{
    @Autowired
    private IBizMemberService bizMemberService;

    /**
     * 查询用户列表
     */
    @PreAuthorize("@ss.hasPermi('system:member:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizMember bizMember)
    {
        startPage();
        List<BizMemberVo> list = bizMemberService.selectBizMemberList(bizMember);
        return getDataTable(list);
    }

    /**
     * 导出用户列表
     */
    @PreAuthorize("@ss.hasPermi('system:member:export')")
    @Log(title = "用户", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BizMember bizMember)
    {
        List<BizMemberVo> list = bizMemberService.selectBizMemberList(bizMember);
        ExcelUtil<BizMemberVo> util = new ExcelUtil<BizMemberVo>(BizMemberVo.class);
        util.exportExcel(response, list, "用户数据");
    }

    /**
     * 获取用户详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:member:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bizMemberService.selectBizMemberById(id));
    }

    /**
     * 新增用户
     */
    @PreAuthorize("@ss.hasPermi('system:member:add')")
    @Log(title = "用户", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizMember bizMember)
    {
        return toAjax(bizMemberService.insertBizMember(bizMember));
    }

    /**
     * 修改用户
     */
    @PreAuthorize("@ss.hasPermi('system:member:edit')")
    @Log(title = "用户", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizMember bizMember)
    {
        return toAjax(bizMemberService.updateBizMember(bizMember));
    }

    /**
     * 修改用户密码
     */
    @PreAuthorize("@ss.hasPermi('system:member:edit')")
    @Log(title = "用户", businessType = BusinessType.UPDATE)
    @PutMapping("/pwd")
    public AjaxResult editPwd(@RequestBody BizMember bizMember)
    {
        return toAjax(bizMemberService.updatePwd(bizMember.getId(), bizMember.getPassword()));
    }

    /**
     * 删除用户
     */
    @PreAuthorize("@ss.hasPermi('system:member:remove')")
    @Log(title = "用户", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bizMemberService.deleteBizMemberByIds(ids));
    }
}
