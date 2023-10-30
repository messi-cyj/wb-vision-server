import request from "@/utils/request";

// 查询桌子列表
export function listDesk(query) {
  return request({
    url: "/system/desk/list",
    method: "get",
    params: query,
  });
}

// 查询桌子详细
export function getDesk(id) {
  return request({
    url: "/system/desk/" + id,
    method: "get",
  });
}

export function getDeskDeviceList(id) {
  return request({
    url: "/system/desk/" + id / "/device/list",
    method: "get",
  });
}

// 新增桌子
export function addDesk(data) {
  return request({
    url: "/system/desk",
    method: "post",
    data: data,
  });
}

export function bindDevice(id, data) {
  return request({
    url: "/system/desk/" + id + "/bind",
    method: "post",
    data: data,
  });
}

export function unbindDevice(classroomId, deskId, deviceId) {
  return request({
    url: "/system/desk/" + deskId + "/unbind",
    method: "post",
    data: {
      classroomId,
      deskId,
      deviceId,
    },
  });
}

// 修改桌子
export function updateDesk(data) {
  return request({
    url: "/system/desk",
    method: "put",
    data: data,
  });
}

// 删除桌子
export function delDesk(id) {
  return request({
    url: "/system/desk/" + id,
    method: "delete",
  });
}
