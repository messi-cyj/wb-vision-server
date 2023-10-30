package com.ruoyi.system.domain.vo;

import lombok.Data;

import java.util.List;

@Data
public class WebSocketDataVo {

    private String cmd;

    private String deskNo;
    private String deskName;

    private List<WebSocketDeskVo> deskList;

    private List<String> targetIdList;

}
