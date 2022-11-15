package cn.huanzi.qch.baseadmin.goods.repository;

import cn.huanzi.qch.baseadmin.goods.pojo.SalesGoods;
import cn.huanzi.qch.baseadmin.goods.vo.SalesCountVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesGoodsVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesReportVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.math.BigDecimal;
import java.util.List;

@Mapper
public interface SalesGoodsMapper extends BaseMapper<SalesGoods> {

    @Select("SELECT  b.id,a.id as goods_id,a.name,a.purchasing_price,a.sale_price,IFNULL(b.sale_num,0) AS sale_num,a.img FROM goods a LEFT JOIN goods_sales b ON a.id=b.goods_id AND b.create_time>=#{time} ${sql} ")
    List<SalesGoodsVo> salesGoodsList(@Param("sql") String sql, @Param("time") String time);

    Integer salesOne(@Param("id") String id,
                     @Param("goodsId") String goodsId,
                     @Param("saleNum") Integer saleNum,
                     @Param("createTime") String createTime,
                     @Param("userName") String userName,
                     @Param("purchasingPrice") BigDecimal purchasingPrice,
                     @Param("salePrice") BigDecimal salePrice);

    @Select("SELECT  b.id,a.id as goods_id,a.name,IFNULL(b.sale_num,0) AS sale_num,a.img FROM goods a LEFT JOIN goods_sales b ON a.id=b.goods_id where b.id=#{id}")
    SalesGoodsVo findSalesGoodsById(@Param("id") String id);

    List<SalesReportVo> salesReport(@Param("startTime") String startTime, @Param("endTime") String endTime, @Param("name") String name);

    SalesCountVo SalesCount(@Param("startTime") String startTime, @Param("endTime") String endTime, @Param("name") String name);
}
