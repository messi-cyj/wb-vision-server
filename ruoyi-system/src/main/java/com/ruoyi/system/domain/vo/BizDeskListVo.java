package com.ruoyi.system.domain.vo;

import com.ruoyi.system.domain.BizDesk;
import lombok.Data;

import java.util.List;

@Data
public class BizDeskListVo {

    private BizDeskVo teacherDesk;
    private List<BizDeskVo> studentDeskList;

}
