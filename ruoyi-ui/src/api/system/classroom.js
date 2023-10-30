import request from '@/utils/request'

// 查询教室列表
export function listClassroom(query) {
  return request({
    url: '/system/classroom/list',
    method: 'get',
    params: query
  })
}

// 查询教室详细
export function getClassroom(id) {
  return request({
    url: '/system/classroom/' + id,
    method: 'get'
  })
}

// 新增教室
export function addClassroom(data) {
  return request({
    url: '/system/classroom',
    method: 'post',
    data: data
  })
}

// 修改教室
export function updateClassroom(data) {
  return request({
    url: '/system/classroom',
    method: 'put',
    data: data
  })
}

// 删除教室
export function delClassroom(id) {
  return request({
    url: '/system/classroom/' + id,
    method: 'delete'
  })
}
