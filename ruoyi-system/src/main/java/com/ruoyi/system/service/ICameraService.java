package com.ruoyi.system.service;

import com.ruoyi.system.domain.BizDevice;

import java.io.UnsupportedEncodingException;

public interface ICameraService {

    void publishFaceImage(BizDevice device, String imagePath, String name, String birthday, String identificationNumber) throws UnsupportedEncodingException;

}
