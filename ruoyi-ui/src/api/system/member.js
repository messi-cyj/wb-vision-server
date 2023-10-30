import request from "@/utils/request";

// 查询用户列表
export function listMember(query) {
  return request({
    url: "/system/member/list",
    method: "get",
    params: query,
  });
}

// 查询用户详细
export function getMember(id) {
  return request({
    url: "/system/member/" + id,
    method: "get",
  });
}

// 新增用户
export function addMember(data) {
  return request({
    url: "/system/member",
    method: "post",
    data: data,
  });
}

// 修改用户
export function updateMember(data) {
  return request({
    url: "/system/member",
    method: "put",
    data: data,
  });
}

// 重置密码
export function updateMemberPwd(id, newPwd) {
  return request({
    url: "/system/member/pwd",
    method: "put",
    data: {
      id,
      password: newPwd,
    },
  });
}

// 删除用户
export function delMember(id) {
  return request({
    url: "/system/member/" + id,
    method: "delete",
  });
}
