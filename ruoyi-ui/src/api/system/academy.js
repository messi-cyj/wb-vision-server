import request from '@/utils/request'

// 查询学院列表
export function listAcademy(query) {
  return request({
    url: '/system/academy/list',
    method: 'get',
    params: query
  })
}

// 查询学院详细
export function getAcademy(id) {
  return request({
    url: '/system/academy/' + id,
    method: 'get'
  })
}

// 新增学院
export function addAcademy(data) {
  return request({
    url: '/system/academy',
    method: 'post',
    data: data
  })
}

// 修改学院
export function updateAcademy(data) {
  return request({
    url: '/system/academy',
    method: 'put',
    data: data
  })
}

// 删除学院
export function delAcademy(id) {
  return request({
    url: '/system/academy/' + id,
    method: 'delete'
  })
}
