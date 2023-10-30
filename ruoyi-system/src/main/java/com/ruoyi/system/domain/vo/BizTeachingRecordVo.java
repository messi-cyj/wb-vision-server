package com.ruoyi.system.domain.vo;

import com.ruoyi.system.domain.BizTeachingRecord;
import lombok.Data;

@Data
public class BizTeachingRecordVo extends BizTeachingRecord {

    private String academyName;
    private String majorName;
    private String className;
    private String gradeName;
    private String courseName;
    private String teacherName;
    private String classroomName;

}
