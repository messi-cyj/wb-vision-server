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
import com.ruoyi.system.domain.BizClassroom;
import com.ruoyi.system.service.IBizClassroomService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 教室Controller
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@RestController
@RequestMapping("/system/classroom")
public class BizClassroomController extends BaseController
{
    @Autowired
    private IBizClassroomService bizClassroomService;

    /**
     * 查询教室列表
     */
    @PreAuthorize("@ss.hasPermi('system:classroom:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizClassroom bizClassroom)
    {
        startPage();
        List<BizClassroom> list = bizClassroomService.selectBizClassroomList(bizClassroom);
        return getDataTable(list);
    }

    /**
     * 导出教室列表
     */
    @PreAuthorize("@ss.hasPermi('system:classroom:export')")
    @Log(title = "教室", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BizClassroom bizClassroom)
    {
        List<BizClassroom> list = bizClassroomService.selectBizClassroomList(bizClassroom);
        ExcelUtil<BizClassroom> util = new ExcelUtil<BizClassroom>(BizClassroom.class);
        util.exportExcel(response, list, "教室数据");
    }

    /**
     * 获取教室详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:classroom:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bizClassroomService.selectBizClassroomById(id));
    }

    /**
     * 新增教室
     */
    @PreAuthorize("@ss.hasPermi('system:classroom:add')")
    @Log(title = "教室", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizClassroom bizClassroom)
    {
        return toAjax(bizClassroomService.insertBizClassroom(bizClassroom));
    }

    /**
     * 修改教室
     */
    @PreAuthorize("@ss.hasPermi('system:classroom:edit')")
    @Log(title = "教室", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizClassroom bizClassroom)
    {
        return toAjax(bizClassroomService.updateBizClassroom(bizClassroom));
    }

    /**
     * 删除教室
     */
    @PreAuthorize("@ss.hasPermi('system:classroom:remove')")
    @Log(title = "教室", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bizClassroomService.deleteBizClassroomByIds(ids));
    }
}
