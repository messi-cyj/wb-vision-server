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
import com.ruoyi.system.domain.BizGrade;
import com.ruoyi.system.service.IBizGradeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 年级Controller
 * 
 * @author ruoyi
 * @date 2022-04-13
 */
@RestController
@RequestMapping("/system/grade")
public class BizGradeController extends BaseController
{
    @Autowired
    private IBizGradeService bizGradeService;

    /**
     * 查询年级列表
     */
    @PreAuthorize("@ss.hasPermi('system:grade:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizGrade bizGrade)
    {
        startPage();
        List<BizGrade> list = bizGradeService.selectBizGradeList(bizGrade);
        return getDataTable(list);
    }

    /**
     * 导出年级列表
     */
    @PreAuthorize("@ss.hasPermi('system:grade:export')")
    @Log(title = "年级", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BizGrade bizGrade)
    {
        List<BizGrade> list = bizGradeService.selectBizGradeList(bizGrade);
        ExcelUtil<BizGrade> util = new ExcelUtil<BizGrade>(BizGrade.class);
        util.exportExcel(response, list, "年级数据");
    }

    /**
     * 获取年级详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:grade:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bizGradeService.selectBizGradeById(id));
    }

    /**
     * 新增年级
     */
    @PreAuthorize("@ss.hasPermi('system:grade:add')")
    @Log(title = "年级", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizGrade bizGrade)
    {
        return toAjax(bizGradeService.insertBizGrade(bizGrade));
    }

    /**
     * 修改年级
     */
    @PreAuthorize("@ss.hasPermi('system:grade:edit')")
    @Log(title = "年级", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizGrade bizGrade)
    {
        return toAjax(bizGradeService.updateBizGrade(bizGrade));
    }

    /**
     * 删除年级
     */
    @PreAuthorize("@ss.hasPermi('system:grade:remove')")
    @Log(title = "年级", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bizGradeService.deleteBizGradeByIds(ids));
    }
}
