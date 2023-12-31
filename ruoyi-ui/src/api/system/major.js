import request from '@/utils/request'

// 查询专业列表
export function listMajor(query) {
  return request({
    url: '/system/major/list',
    method: 'get',
    params: query
  })
}

// 查询专业详细
export function getMajor(id) {
  return request({
    url: '/system/major/' + id,
    method: 'get'
  })
}

// 新增专业
export function addMajor(data) {
  return request({
    url: '/system/major',
    method: 'post',
    data: data
  })
}

// 修改专业
export function updateMajor(data) {
  return request({
    url: '/system/major',
    method: 'put',
    data: data
  })
}

// 删除专业
export function delMajor(id) {
  return request({
    url: '/system/major/' + id,
    method: 'delete'
  })
}
