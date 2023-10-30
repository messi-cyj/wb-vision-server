import request from '@/utils/request'

// 查询考勤列表
export function listAttendance(query) {
  return request({
    url: '/system/attendance/list',
    method: 'get',
    params: query
  })
}

// 查询考勤详细
export function getAttendance(id) {
  return request({
    url: '/system/attendance/' + id,
    method: 'get'
  })
}

// 新增考勤
export function addAttendance(data) {
  return request({
    url: '/system/attendance',
    method: 'post',
    data: data
  })
}

// 修改考勤
export function updateAttendance(data) {
  return request({
    url: '/system/attendance',
    method: 'put',
    data: data
  })
}

// 删除考勤
export function delAttendance(id) {
  return request({
    url: '/system/attendance/' + id,
    method: 'delete'
  })
}
