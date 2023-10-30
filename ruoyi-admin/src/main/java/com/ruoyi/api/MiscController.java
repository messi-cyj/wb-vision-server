package com.ruoyi.api;

import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.framework.config.ServerConfig;
import com.ruoyi.system.domain.BizResource;
import com.ruoyi.system.domain.BizTeachingRecord;
import com.ruoyi.system.domain.SysNotice;
import com.ruoyi.system.service.IBizResourceService;
import com.ruoyi.system.service.IBizTeachingRecordService;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysNoticeService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@Slf4j
public class MiscController {

    @Autowired
    private ISysNoticeService noticeService;

    @Autowired
    private IBizTeachingRecordService teachingRecordService;

    @Autowired
    private IBizResourceService resourceService;

    @Autowired
    private ISysConfigService sysConfigService;

    @Autowired
    private ServerConfig serverConfig;

    @GetMapping("/ping")
    public AjaxResult ping() {
        return AjaxResult.success("ok", "pong");
    }

    @GetMapping("/notice")
    public AjaxResult getNotice() {
        List<SysNotice> list = noticeService.selectNoticeList(new SysNotice());
        if (list.size() == 0) {
            return AjaxResult.success("");
        }
        return AjaxResult.success("ok", list.get(0).getNoticeTitle());
    }

    @GetMapping("/slogan")
    public AjaxResult getSlogan() {
        String title = sysConfigService.selectConfigByKey("slogan.title");
        String subTitle = sysConfigService.selectConfigByKey("slogan.subtitle");
        Map<String, String> data = new HashMap<>();
        data.put("title", StringUtils.isBlank(title) ? "视易控·Vision Easy" : title);
        data.put("subtitle", StringUtils.isBlank(subTitle) ? "让教学更高效" : subTitle);
        return AjaxResult.success(data);
    }

    @GetMapping("/resource/list")
    public AjaxResult getResourceList(@RequestParam("type") String type, @RequestParam("keyword") String keyword) {
        BizResource condition = new BizResource();
        if (StringUtils.isNotBlank(type)) {
            condition.setType(type);
        }
        if (StringUtils.isNotBlank(keyword)) {
            condition.setName(keyword);
        }
        List<BizResource> resourceList = resourceService.selectBizResourceList(condition);
        return AjaxResult.success(resourceList);
    }

    @PostMapping("/upload")
    public AjaxResult uploadFile(MultipartFile file, HttpServletRequest request) throws Exception
    {
        try
        {
            String teachingIdStr = request.getParameter("teachingRecordId");
            if (StringUtils.isBlank(teachingIdStr)) {
                return AjaxResult.error("课程记录ID不能为空");
            }
            Long teachingRecordId = Long.parseLong(teachingIdStr);
            BizTeachingRecord teachingRecord = teachingRecordService.selectBizTeachingRecordById(teachingRecordId);
            if (teachingRecord == null) {
                return AjaxResult.error("课程记录不存在");
            }

            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            String url = serverConfig.getUrl() + fileName;

            BizResource resource = new BizResource();
            resource.setUrl(url);
            resource.setBizId(teachingRecordId);
            resource.setName(FilenameUtils.getName(fileName));
            resource.setType(FilenameUtils.getExtension(fileName));
            resourceService.insertBizResource(resource);

            AjaxResult ajax = AjaxResult.success();
            ajax.put("url", url);
            ajax.put("fileName", fileName);
            ajax.put("newFileName", FileUtils.getName(fileName));
            ajax.put("originalFilename", file.getOriginalFilename());
            return ajax;
        }
        catch (Exception e)
        {
            return AjaxResult.error(e.getMessage());
        }
    }

    @GetMapping("/download")
    public void fileDownload(Long resourceId, HttpServletResponse response, HttpServletRequest request)
    {
        try
        {
            BizResource resource = resourceService.selectBizResourceById(resourceId);
            if (resource == null) {
                return;
            }
            String[] relativePaths = resource.getUrl().split("/profile");
            String filePath = RuoYiConfig.getProfile() + relativePaths[1];

            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, resource.getName());
            FileUtils.writeBytes(filePath, response.getOutputStream());
        }
        catch (Exception e)
        {
            log.error("下载文件失败", e);
        }
    }

}
