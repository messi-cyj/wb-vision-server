package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.system.domain.BizSchool;
import com.ruoyi.system.service.IBizSchoolService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 学校Controller
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@RestController
@RequestMapping("/system/school")
public class BizSchoolController extends BaseController
{
    @Autowired
    private IBizSchoolService bizSchoolService;

    /**
     * 查询学校列表
     */
    @PreAuthorize("@ss.hasPermi('system:school:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizSchool bizSchool)
    {
        startPage();
        List<BizSchool> list = bizSchoolService.selectBizSchoolList(bizSchool);
        return getDataTable(list);
    }

    /**
     * 导出学校列表
     */
    @PreAuthorize("@ss.hasPermi('system:school:export')")
    @Log(title = "学校", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BizSchool bizSchool)
    {
        List<BizSchool> list = bizSchoolService.selectBizSchoolList(bizSchool);
        ExcelUtil<BizSchool> util = new ExcelUtil<BizSchool>(BizSchool.class);
        util.exportExcel(response, list, "学校数据");
    }

    /**
     * 获取学校详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:school:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bizSchoolService.selectBizSchoolById(id));
    }

    /**
     * 新增学校
     */
    @PreAuthorize("@ss.hasPermi('system:school:add')")
    @Log(title = "学校", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizSchool bizSchool)
    {
        return toAjax(bizSchoolService.insertBizSchool(bizSchool));
    }

    /**
     * 修改学校
     */
    @PreAuthorize("@ss.hasPermi('system:school:edit')")
    @Log(title = "学校", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizSchool bizSchool)
    {
        return toAjax(bizSchoolService.updateBizSchool(bizSchool));
    }

    /**
     * 删除学校
     */
    @PreAuthorize("@ss.hasPermi('system:school:remove')")
    @Log(title = "学校", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bizSchoolService.deleteBizSchoolByIds(ids));
    }
}
