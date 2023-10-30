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
import com.ruoyi.system.domain.BizScore;
import com.ruoyi.system.service.IBizScoreService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 成绩Controller
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@RestController
@RequestMapping("/system/score")
public class BizScoreController extends BaseController
{
    @Autowired
    private IBizScoreService bizScoreService;

    /**
     * 查询成绩列表
     */
    @PreAuthorize("@ss.hasPermi('system:score:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizScore bizScore)
    {
        startPage();
        List<BizScore> list = bizScoreService.selectBizScoreList(bizScore);
        return getDataTable(list);
    }

    /**
     * 导出成绩列表
     */
    @PreAuthorize("@ss.hasPermi('system:score:export')")
    @Log(title = "成绩", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BizScore bizScore)
    {
        List<BizScore> list = bizScoreService.selectBizScoreList(bizScore);
        ExcelUtil<BizScore> util = new ExcelUtil<BizScore>(BizScore.class);
        util.exportExcel(response, list, "成绩数据");
    }

    /**
     * 获取成绩详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:score:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bizScoreService.selectBizScoreById(id));
    }

    /**
     * 新增成绩
     */
    @PreAuthorize("@ss.hasPermi('system:score:add')")
    @Log(title = "成绩", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizScore bizScore)
    {
        return toAjax(bizScoreService.insertBizScore(bizScore));
    }

    /**
     * 修改成绩
     */
    @PreAuthorize("@ss.hasPermi('system:score:edit')")
    @Log(title = "成绩", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizScore bizScore)
    {
        return toAjax(bizScoreService.updateBizScore(bizScore));
    }

    /**
     * 删除成绩
     */
    @PreAuthorize("@ss.hasPermi('system:score:remove')")
    @Log(title = "成绩", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bizScoreService.deleteBizScoreByIds(ids));
    }
}
