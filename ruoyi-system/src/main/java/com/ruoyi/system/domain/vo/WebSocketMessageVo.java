package com.ruoyi.system.domain.vo;

import lombok.Data;

@Data
public class WebSocketMessageVo<T> {

    private String version = "v1";
    private String type;
    private int code = 200;
    private String msg;
    private T data;

}
