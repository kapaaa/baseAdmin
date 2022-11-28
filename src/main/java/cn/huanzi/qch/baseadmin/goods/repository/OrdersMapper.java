package cn.huanzi.qch.baseadmin.goods.repository;

import cn.huanzi.qch.baseadmin.goods.pojo.Orders;
import cn.huanzi.qch.baseadmin.goods.pojo.SalesGoods;
import cn.huanzi.qch.baseadmin.goods.vo.SalesCountVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesGoodsVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesReportByTypeVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesReportVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

@Mapper
public interface OrdersMapper extends BaseMapper<Orders> {



}
