package com.ruoyi.system.domain.vo;

import com.ruoyi.system.domain.BizDesk;
import com.ruoyi.system.domain.BizDeskDevice;
import com.ruoyi.system.domain.BizDevice;
import lombok.Data;

@Data
public class BizDeskDeviceVo extends BizDeskDevice {

    private BizDesk desk;
    private BizDevice device;

}
