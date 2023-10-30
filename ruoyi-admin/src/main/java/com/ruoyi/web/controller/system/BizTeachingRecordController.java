package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.domain.vo.BizTeachingRecordVo;
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
import com.ruoyi.system.domain.BizTeachingRecord;
import com.ruoyi.system.service.IBizTeachingRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 教学记录Controller
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@RestController
@RequestMapping("/system/teachingRecord")
public class BizTeachingRecordController extends BaseController
{
    @Autowired
    private IBizTeachingRecordService bizTeachingRecordService;

    /**
     * 查询教学记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizTeachingRecord bizTeachingRecord)
    {
        startPage();
        List<BizTeachingRecordVo> list = bizTeachingRecordService.selectBizTeachingRecordList(bizTeachingRecord);
        return getDataTable(list);
    }

    /**
     * 导出教学记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:record:export')")
    @Log(title = "教学记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BizTeachingRecord bizTeachingRecord)
    {
        List<BizTeachingRecordVo> list = bizTeachingRecordService.selectBizTeachingRecordList(bizTeachingRecord);
        ExcelUtil<BizTeachingRecordVo> util = new ExcelUtil<BizTeachingRecordVo>(BizTeachingRecordVo.class);
        util.exportExcel(response, list, "教学记录数据");
    }

    /**
     * 获取教学记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:record:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bizTeachingRecordService.selectBizTeachingRecordById(id));
    }

    /**
     * 新增教学记录
     */
    @PreAuthorize("@ss.hasPermi('system:record:add')")
    @Log(title = "教学记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizTeachingRecord bizTeachingRecord)
    {
        return toAjax(bizTeachingRecordService.insertBizTeachingRecord(bizTeachingRecord));
    }

    /**
     * 修改教学记录
     */
    @PreAuthorize("@ss.hasPermi('system:record:edit')")
    @Log(title = "教学记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizTeachingRecord bizTeachingRecord)
    {
        return toAjax(bizTeachingRecordService.updateBizTeachingRecord(bizTeachingRecord));
    }

    /**
     * 删除教学记录
     */
    @PreAuthorize("@ss.hasPermi('system:record:remove')")
    @Log(title = "教学记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bizTeachingRecordService.deleteBizTeachingRecordByIds(ids));
    }
}
