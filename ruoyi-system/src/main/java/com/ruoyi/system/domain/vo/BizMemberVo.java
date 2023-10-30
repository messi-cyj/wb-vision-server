package com.ruoyi.system.domain.vo;

import com.ruoyi.system.domain.BizMember;
import lombok.Data;

@Data
public class BizMemberVo extends BizMember {

    private String schoolName;
    private String academyName;
    private String majorName;
    private String gradeName;
    private String className;
    private String deskName;

    private BizTeachingRecordVo teachingRecord;

}
