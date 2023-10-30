import request from '@/utils/request'

// 查询成绩列表
export function listScore(query) {
  return request({
    url: '/system/score/list',
    method: 'get',
    params: query
  })
}

// 查询成绩详细
export function getScore(id) {
  return request({
    url: '/system/score/' + id,
    method: 'get'
  })
}

// 新增成绩
export function addScore(data) {
  return request({
    url: '/system/score',
    method: 'post',
    data: data
  })
}

// 修改成绩
export function updateScore(data) {
  return request({
    url: '/system/score',
    method: 'put',
    data: data
  })
}

// 删除成绩
export function delScore(id) {
  return request({
    url: '/system/score/' + id,
    method: 'delete'
  })
}
