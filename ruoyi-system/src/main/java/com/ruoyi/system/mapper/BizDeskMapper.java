package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.BizDesk;
import org.apache.ibatis.annotations.Param;

/**
 * 桌子Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-13
 */
public interface BizDeskMapper 
{
    /**
     * 查询桌子
     * 
     * @param id 桌子主键
     * @return 桌子
     */
    public BizDesk selectBizDeskById(Long id);

    public BizDesk selectBizDeskByNo(@Param("classroomId") Long classroomId, @Param("no") String no);

    /**
     * 查询桌子列表
     * 
     * @param bizDesk 桌子
     * @return 桌子集合
     */
    public List<BizDesk> selectBizDeskList(BizDesk bizDesk);

    /**
     * 新增桌子
     * 
     * @param bizDesk 桌子
     * @return 结果
     */
    public int insertBizDesk(BizDesk bizDesk);

    /**
     * 修改桌子
     * 
     * @param bizDesk 桌子
     * @return 结果
     */
    public int updateBizDesk(BizDesk bizDesk);

    /**
     * 删除桌子
     * 
     * @param id 桌子主键
     * @return 结果
     */
    public int deleteBizDeskById(Long id);

    /**
     * 批量删除桌子
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBizDeskByIds(Long[] ids);
}
