package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.domain.vo.BizMajorVo;
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
import com.ruoyi.system.domain.BizMajor;
import com.ruoyi.system.service.IBizMajorService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 专业Controller
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@RestController
@RequestMapping("/system/major")
public class BizMajorController extends BaseController
{
    @Autowired
    private IBizMajorService bizMajorService;

    /**
     * 查询专业列表
     */
    @PreAuthorize("@ss.hasPermi('system:major:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizMajor bizMajor)
    {
        startPage();
        List<BizMajorVo> list = bizMajorService.selectBizMajorList(bizMajor);
        return getDataTable(list);
    }

    /**
     * 导出专业列表
     */
    @PreAuthorize("@ss.hasPermi('system:major:export')")
    @Log(title = "专业", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BizMajor bizMajor)
    {
        List<BizMajorVo> list = bizMajorService.selectBizMajorList(bizMajor);
        ExcelUtil<BizMajorVo> util = new ExcelUtil<BizMajorVo>(BizMajorVo.class);
        util.exportExcel(response, list, "专业数据");
    }

    /**
     * 获取专业详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:major:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bizMajorService.selectBizMajorById(id));
    }

    /**
     * 新增专业
     */
    @PreAuthorize("@ss.hasPermi('system:major:add')")
    @Log(title = "专业", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizMajor bizMajor)
    {
        return toAjax(bizMajorService.insertBizMajor(bizMajor));
    }

    /**
     * 修改专业
     */
    @PreAuthorize("@ss.hasPermi('system:major:edit')")
    @Log(title = "专业", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizMajor bizMajor)
    {
        return toAjax(bizMajorService.updateBizMajor(bizMajor));
    }

    /**
     * 删除专业
     */
    @PreAuthorize("@ss.hasPermi('system:major:remove')")
    @Log(title = "专业", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bizMajorService.deleteBizMajorByIds(ids));
    }
}
