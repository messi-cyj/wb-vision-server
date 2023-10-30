package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.domain.BizDeskDevice;
import com.ruoyi.system.domain.vo.BizDeskVo;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.BizDesk;
import com.ruoyi.system.service.IBizDeskService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 桌子Controller
 * 
 * @author ruoyi
 * @date 2022-04-13
 */
@RestController
@RequestMapping("/system/desk")
public class BizDeskController extends BaseController
{
    @Autowired
    private IBizDeskService bizDeskService;

    /**
     * 查询桌子列表
     */
    @PreAuthorize("@ss.hasPermi('system:desk:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizDesk bizDesk)
    {
        startPage();
        List<BizDeskVo> list = bizDeskService.selectBizDeskList(bizDesk);
        return getDataTable(list);
    }

    /**
     * 导出桌子列表
     */
    @PreAuthorize("@ss.hasPermi('system:desk:export')")
    @Log(title = "桌子", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BizDesk bizDesk)
    {
        List<BizDeskVo> list = bizDeskService.selectBizDeskList(bizDesk);
        ExcelUtil<BizDeskVo> util = new ExcelUtil<BizDeskVo>(BizDeskVo.class);
        util.exportExcel(response, list, "桌子数据");
    }

    /**
     * 获取桌子详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:desk:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bizDeskService.selectBizDeskById(id));
    }

    /**
     * 新增桌子
     */
    @PreAuthorize("@ss.hasPermi('system:desk:add')")
    @Log(title = "桌子", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizDesk bizDesk)
    {
        return toAjax(bizDeskService.insertBizDesk(bizDesk));
    }

    /**
     * 绑定设备
     */
    @PreAuthorize("@ss.hasPermi('system:desk:add')")
    @Log(title = "桌子", businessType = BusinessType.INSERT)
    @PostMapping("/{id}/bind")
    public AjaxResult bind(@RequestBody BizDeskDevice deskDevice)
    {
        bizDeskService.bindDevice(deskDevice);
        return AjaxResult.success();
    }

    @PreAuthorize("@ss.hasPermi('system:desk:add')")
    @Log(title = "桌子", businessType = BusinessType.INSERT)
    @PostMapping("/{deskId}/unbind")
    public AjaxResult unbind(@PathVariable("deskId") Long deskId, @RequestBody BizDeskDevice body)
    {
        bizDeskService.unbindDevice(body.getClassroomId(), deskId, body.getDeviceId());
        return AjaxResult.success();
    }

    @PreAuthorize("@ss.hasPermi('system:desk:add')")
    @Log(title = "桌子", businessType = BusinessType.INSERT)
    @GetMapping("/{id}/device/list")
    public AjaxResult getBindList(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bizDeskService.getBindDeviceList(id));
    }

    /**
     * 修改桌子
     */
    @PreAuthorize("@ss.hasPermi('system:desk:edit')")
    @Log(title = "桌子", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizDesk bizDesk)
    {
        return toAjax(bizDeskService.updateBizDesk(bizDesk));
    }

    /**
     * 删除桌子
     */
    @PreAuthorize("@ss.hasPermi('system:desk:remove')")
    @Log(title = "桌子", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bizDeskService.deleteBizDeskByIds(ids));
    }
}
