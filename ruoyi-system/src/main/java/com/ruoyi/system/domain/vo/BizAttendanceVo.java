package com.ruoyi.system.domain.vo;

import com.ruoyi.system.domain.BizAttendance;
import lombok.Data;

@Data
public class BizAttendanceVo extends BizAttendance {

    private String studentNo;
    private String deskName;
    private String studentName;
    private String status;
    private String delayTime;

    private String academyName;
    private String majorName;
    private String gradeName;
    private String className;
    private String courseName;
    private String teachingRecordName;
    private String classroomName;

}
