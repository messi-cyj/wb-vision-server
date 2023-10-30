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
import com.ruoyi.system.domain.BizResource;
import com.ruoyi.system.service.IBizResourceService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 资源Controller
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@RestController
@RequestMapping("/system/resource")
public class BizResourceController extends BaseController
{
    @Autowired
    private IBizResourceService bizResourceService;

    /**
     * 查询资源列表
     */
    @PreAuthorize("@ss.hasPermi('system:resource:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizResource bizResource)
    {
        startPage();
        List<BizResource> list = bizResourceService.selectBizResourceList(bizResource);
        return getDataTable(list);
    }

    /**
     * 导出资源列表
     */
    @PreAuthorize("@ss.hasPermi('system:resource:export')")
    @Log(title = "资源", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BizResource bizResource)
    {
        List<BizResource> list = bizResourceService.selectBizResourceList(bizResource);
        ExcelUtil<BizResource> util = new ExcelUtil<BizResource>(BizResource.class);
        util.exportExcel(response, list, "资源数据");
    }

    /**
     * 获取资源详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:resource:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bizResourceService.selectBizResourceById(id));
    }

    /**
     * 新增资源
     */
    @PreAuthorize("@ss.hasPermi('system:resource:add')")
    @Log(title = "资源", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizResource bizResource)
    {
        return toAjax(bizResourceService.insertBizResource(bizResource));
    }

    /**
     * 修改资源
     */
    @PreAuthorize("@ss.hasPermi('system:resource:edit')")
    @Log(title = "资源", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizResource bizResource)
    {
        return toAjax(bizResourceService.updateBizResource(bizResource));
    }

    /**
     * 删除资源
     */
    @PreAuthorize("@ss.hasPermi('system:resource:remove')")
    @Log(title = "资源", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bizResourceService.deleteBizResourceByIds(ids));
    }
}
