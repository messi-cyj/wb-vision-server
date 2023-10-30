import request from "@/utils/request";

// 查询桌子设备列表
export function listDeskDevice(query) {
  return request({
    url: "/system/deskDevice/list",
    method: "get",
    params: query,
  });
}

// 查询桌子设备详细
export function getDeskDevice(id) {
  return request({
    url: "/system/deskDevice/" + id,
    method: "get",
  });
}

// 新增桌子设备
export function addDeskDevice(data) {
  return request({
    url: "/system/deskDevice",
    method: "post",
    data: data,
  });
}

// 修改桌子设备
export function updateDeskDevice(data) {
  return request({
    url: "/system/deskDevice",
    method: "put",
    data: data,
  });
}

// 删除桌子设备
export function delDeskDevice(id) {
  return request({
    url: "/system/deskDevice/" + id,
    method: "delete",
  });
}
