import request from "@/utils/request";

// 查询教学记录列表
export function listRecord(query) {
  return request({
    url: "/system/teachingRecord/list",
    method: "get",
    params: query,
  });
}

// 查询教学记录详细
export function getRecord(id) {
  return request({
    url: "/system/teachingRecord/" + id,
    method: "get",
  });
}

// 新增教学记录
export function addRecord(data) {
  return request({
    url: "/system/teachingRecord",
    method: "post",
    data: data,
  });
}

// 修改教学记录
export function updateRecord(data) {
  return request({
    url: "/system/teachingRecord",
    method: "put",
    data: data,
  });
}

// 删除教学记录
export function delRecord(id) {
  return request({
    url: "/system/teachingRecord/" + id,
    method: "delete",
  });
}
