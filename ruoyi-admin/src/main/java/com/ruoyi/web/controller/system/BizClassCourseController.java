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
import com.ruoyi.system.domain.BizClassCourse;
import com.ruoyi.system.service.IBizClassCourseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 班级课程Controller
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@RestController
@RequestMapping("/system/classCourse")
public class BizClassCourseController extends BaseController
{
    @Autowired
    private IBizClassCourseService bizClassCourseService;

    /**
     * 查询班级课程列表
     */
    @PreAuthorize("@ss.hasPermi('system:course:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizClassCourse bizClassCourse)
    {
        startPage();
        List<BizClassCourse> list = bizClassCourseService.selectBizClassCourseList(bizClassCourse);
        return getDataTable(list);
    }

    /**
     * 导出班级课程列表
     */
    @PreAuthorize("@ss.hasPermi('system:course:export')")
    @Log(title = "班级课程", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BizClassCourse bizClassCourse)
    {
        List<BizClassCourse> list = bizClassCourseService.selectBizClassCourseList(bizClassCourse);
        ExcelUtil<BizClassCourse> util = new ExcelUtil<BizClassCourse>(BizClassCourse.class);
        util.exportExcel(response, list, "班级课程数据");
    }

    /**
     * 获取班级课程详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:course:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bizClassCourseService.selectBizClassCourseById(id));
    }

    /**
     * 新增班级课程
     */
    @PreAuthorize("@ss.hasPermi('system:course:add')")
    @Log(title = "班级课程", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizClassCourse bizClassCourse)
    {
        return toAjax(bizClassCourseService.insertBizClassCourse(bizClassCourse));
    }

    /**
     * 修改班级课程
     */
    @PreAuthorize("@ss.hasPermi('system:course:edit')")
    @Log(title = "班级课程", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizClassCourse bizClassCourse)
    {
        return toAjax(bizClassCourseService.updateBizClassCourse(bizClassCourse));
    }

    /**
     * 删除班级课程
     */
    @PreAuthorize("@ss.hasPermi('system:course:remove')")
    @Log(title = "班级课程", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bizClassCourseService.deleteBizClassCourseByIds(ids));
    }
}
