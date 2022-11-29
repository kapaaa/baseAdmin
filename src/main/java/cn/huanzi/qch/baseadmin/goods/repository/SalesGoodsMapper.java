package cn.huanzi.qch.baseadmin.goods.repository;

import cn.huanzi.qch.baseadmin.goods.pojo.SalesGoods;
import cn.huanzi.qch.baseadmin.goods.vo.*;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SalesGoodsMapper extends BaseMapper<SalesGoods> {


    List<SalesGoodsVo> salesGoodsList(@Param("sql") String sql);


    List<OrdersReportVo> salesReport(@Param("startTime") String startTime, @Param("endTime") String endTime, @Param("name") String name);

    SalesCountVo salesCount(@Param("startTime") String startTime, @Param("endTime") String endTime, @Param("name") String name);

    List<SalesCountVo> salesGroupByDate(@Param("startTime") String startTime, @Param("endTime") String endTime, @Param("type") String type);

    List<SalesReportByNameVo> salesGroupByName(@Param("startTime") String startTime, @Param("endTime") String endTime);

    List<SalesReportByTypeVo> salesGroupByType(String startTime, String endTime);

    int updateStock(String goodId, Integer stock);
}
