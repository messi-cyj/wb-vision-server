package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.domain.vo.BizAcademyVo;
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
import com.ruoyi.system.domain.BizAcademy;
import com.ruoyi.system.service.IBizAcademyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 学院Controller
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@RestController
@RequestMapping("/system/academy")
public class BizAcademyController extends BaseController
{
    @Autowired
    private IBizAcademyService bizAcademyService;

    /**
     * 查询学院列表
     */
    @PreAuthorize("@ss.hasPermi('system:academy:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizAcademy bizAcademy)
    {
        startPage();
        List<BizAcademyVo> list = bizAcademyService.selectBizAcademyList(bizAcademy);
        return getDataTable(list);
    }

    /**
     * 导出学院列表
     */
    @PreAuthorize("@ss.hasPermi('system:academy:export')")
    @Log(title = "学院", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BizAcademy bizAcademy)
    {
        List<BizAcademyVo> list = bizAcademyService.selectBizAcademyList(bizAcademy);
        ExcelUtil<BizAcademyVo> util = new ExcelUtil<BizAcademyVo>(BizAcademyVo.class);
        util.exportExcel(response, list, "学院数据");
    }

    /**
     * 获取学院详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:academy:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bizAcademyService.selectBizAcademyById(id));
    }

    /**
     * 新增学院
     */
    @PreAuthorize("@ss.hasPermi('system:academy:add')")
    @Log(title = "学院", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizAcademy bizAcademy)
    {
        return toAjax(bizAcademyService.insertBizAcademy(bizAcademy));
    }

    /**
     * 修改学院
     */
    @PreAuthorize("@ss.hasPermi('system:academy:edit')")
    @Log(title = "学院", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizAcademy bizAcademy)
    {
        return toAjax(bizAcademyService.updateBizAcademy(bizAcademy));
    }

    /**
     * 删除学院
     */
    @PreAuthorize("@ss.hasPermi('system:academy:remove')")
    @Log(title = "学院", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bizAcademyService.deleteBizAcademyByIds(ids));
    }
}
