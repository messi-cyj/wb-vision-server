package com.ruoyi.system.service.impl;

import com.netsdk.demo.frame.FaceRecognition;
import com.netsdk.demo.module.FaceRecognitionModule;
import com.netsdk.demo.module.LoginModule;
import com.netsdk.lib.NetSDKLib;
import com.netsdk.lib.ToolKits;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.system.domain.BizDevice;
import com.ruoyi.system.service.ICameraService;
import com.sun.jna.Memory;
import com.sun.jna.Pointer;
import com.sun.jna.ptr.IntByReference;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.UnsupportedEncodingException;

@Slf4j
@Service
public class CameraServiceImpl implements ICameraService {

    @PostConstruct
    public void a() {
        LoginModule.init(new NetSDKLib.fDisConnect() {
            @Override
            public void invoke(NetSDKLib.LLong lLoginID, String pchDVRIP, int nDVRPort, Pointer dwUser) {

            }
        }, null);
    }

    @Override
    public void publishFaceImage(BizDevice device, String imagePath, String name, String birthday, String identificationNumber) throws UnsupportedEncodingException {
        int nSpecCap = NetSDKLib.EM_LOGIN_SPAC_CAP_TYPE.EM_LOGIN_SPEC_CAP_TCP;    // TCP登入
        IntByReference nError = new IntByReference(0);
        boolean isOk = LoginModule.login(device.getIp(), device.getPort().intValue(), device.getUsername(),
                device.getPassword());
        if (!isOk) {
            throw new ServiceException("Login device failed, name: " + device.getName() + ", ip: "+device.getIp());
        }

        byte[] data = null;

        try {
            data = java.nio.file.Files.readAllBytes(java.nio.file.Paths.get(imagePath));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        NetSDKLib.NET_FACERECONGNITION_GROUP_INFO[] groups = FaceRecognitionModule.findGroupInfo("");
        if (groups == null) {
            // 分组不存在，自动创建分组
            boolean addOk = FaceRecognitionModule.addGroup("default");
            if (!addOk) {
                log.error("Add default face group failed, reason: {}", ToolKits.getErrorCodePrint());
                throw new ServiceException("添加默认人脸分组失败");
            }
            log.info("Add default group success");
            groups = FaceRecognitionModule.findGroupInfo("");
            if (groups == null || groups.length == 0) {
                log.error("Add default face group failed");
                throw new ServiceException("添加默认人脸分组失败");
            }
            log.info("Add default group success, total: {}", groups.length);
        }
        for (NetSDKLib.NET_FACERECONGNITION_GROUP_INFO groupInfo : groups) {
            String groupId = new String(groupInfo.szGroupId);
            Memory image = new Memory(data.length);
            image.write(0, data, 0, data.length);
            boolean addOk = FaceRecognitionModule.addPerson(groupId, image,
                    new String(name.getBytes(), "GBK"), 1, false, "", 1, identificationNumber == null ? "" : identificationNumber);

            if (!addOk) {
                throw new ServiceException(ToolKits.getErrorCodePrint());
            }
        }
    }
}
