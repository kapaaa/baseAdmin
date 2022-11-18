package cn.huanzi.qch.baseadmin.goods.repository;

import cn.huanzi.qch.baseadmin.goods.pojo.SalesGoods;
import cn.huanzi.qch.baseadmin.goods.vo.SalesCountVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesGoodsVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesReportByTypeVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesReportVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.math.BigDecimal;
import java.util.List;

@Mapper
public interface SalesGoodsMapper extends BaseMapper<SalesGoods> {


    List<SalesGoodsVo> salesGoodsList(@Param("sql") String sql, @Param("time") String time);

    Integer salesOne(@Param("id") String id,
                     @Param("goodsId") String goodsId,
                     @Param("saleNum") Integer saleNum,
                     @Param("createTime") String createTime,
                     @Param("userName") String userName,
                     @Param("purchasingPrice") BigDecimal purchasingPrice,
                     @Param("salePrice") BigDecimal salePrice);

    SalesGoodsVo findSalesGoodsById(@Param("id") String id);

    List<SalesReportVo> salesReport(@Param("startTime") String startTime, @Param("endTime") String endTime, @Param("name") String name);

    SalesCountVo salesCount(@Param("startTime") String startTime, @Param("endTime") String endTime, @Param("name") String name);

    List<SalesCountVo> salesGroupByDate(@Param("startTime") String startTime, @Param("endTime") String endTime, @Param("type") String type);

    List<SalesReportVo> salesGroupByName(@Param("startTime") String startTime, @Param("endTime") String endTime);

    List<SalesReportByTypeVo> salesGroupByType(String startTime, String endTime);

}
