import request from '@/utils/request'

// 查询年级列表
export function listGrade(query) {
  return request({
    url: '/system/grade/list',
    method: 'get',
    params: query
  })
}

// 查询年级详细
export function getGrade(id) {
  return request({
    url: '/system/grade/' + id,
    method: 'get'
  })
}

// 新增年级
export function addGrade(data) {
  return request({
    url: '/system/grade',
    method: 'post',
    data: data
  })
}

// 修改年级
export function updateGrade(data) {
  return request({
    url: '/system/grade',
    method: 'put',
    data: data
  })
}

// 删除年级
export function delGrade(id) {
  return request({
    url: '/system/grade/' + id,
    method: 'delete'
  })
}
