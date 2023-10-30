package com.ruoyi.system.domain.vo;

import com.ruoyi.system.domain.BizDesk;
import com.ruoyi.system.domain.BizDevice;
import lombok.Data;

import java.util.List;

@Data
public class BizDeskVo extends BizDesk {

    private String classroomName;
    private String classroomNo;
    private List<BizDevice> deviceList;
    private List<String> attendanceStudentNameList;

}
