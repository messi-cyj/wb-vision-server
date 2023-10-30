package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.domain.vo.BizAttendanceVo;
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
import com.ruoyi.system.domain.BizAttendance;
import com.ruoyi.system.service.IBizAttendanceService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 考勤Controller
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@RestController
@RequestMapping("/system/attendance")
public class BizAttendanceController extends BaseController
{
    @Autowired
    private IBizAttendanceService bizAttendanceService;

    /**
     * 查询考勤列表
     */
    @PreAuthorize("@ss.hasPermi('system:attendance:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizAttendance bizAttendance)
    {
        startPage();
        List<BizAttendanceVo> list = bizAttendanceService.selectBizAttendanceList(bizAttendance);
        return getDataTable(list);
    }

    /**
     * 导出考勤列表
     */
    @PreAuthorize("@ss.hasPermi('system:attendance:export')")
    @Log(title = "考勤", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BizAttendance bizAttendance)
    {
        List<BizAttendanceVo> list = bizAttendanceService.selectBizAttendanceList(bizAttendance);
        ExcelUtil<BizAttendanceVo> util = new ExcelUtil<>(BizAttendanceVo.class);
        util.exportExcel(response, list, "考勤数据");
    }

    /**
     * 获取考勤详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:attendance:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bizAttendanceService.selectBizAttendanceById(id));
    }

    /**
     * 新增考勤
     */
    @PreAuthorize("@ss.hasPermi('system:attendance:add')")
    @Log(title = "考勤", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizAttendance bizAttendance)
    {
        return toAjax(bizAttendanceService.insertBizAttendance(bizAttendance));
    }

    /**
     * 修改考勤
     */
    @PreAuthorize("@ss.hasPermi('system:attendance:edit')")
    @Log(title = "考勤", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizAttendance bizAttendance)
    {
        return toAjax(bizAttendanceService.updateBizAttendance(bizAttendance));
    }

    /**
     * 删除考勤
     */
    @PreAuthorize("@ss.hasPermi('system:attendance:remove')")
    @Log(title = "考勤", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bizAttendanceService.deleteBizAttendanceByIds(ids));
    }
}
