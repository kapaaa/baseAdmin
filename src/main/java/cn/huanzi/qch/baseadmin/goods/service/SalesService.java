package cn.huanzi.qch.baseadmin.goods.service;

import cn.huanzi.qch.baseadmin.common.pojo.Result;
import cn.huanzi.qch.baseadmin.goods.pojo.OrderDetails;
import cn.huanzi.qch.baseadmin.goods.vo.*;

import java.util.List;

public interface SalesService {

    Result<List<SalesGoodsVo>> salesGoodsList(String key);

    Result sales(OrdersVo goods);

    Result<com.github.pagehelper.PageInfo<OrdersReportVo>> salesReport(String startTime, String endTime, String name);

    Result<List<SalesReportByNameVo>> salesGroupByName(String startTime, String endTime);

    Result getSalesCount(String startTime, String endTime, String name);

    Result salesGroupByDate(String startTime, String endTime,String type);


    Result salesGroupByType(String startTime, String endTime);

    Result<Boolean> checkStock(String goodId, Integer stock);

    Result<List<OrderDetailsGoodVo>> orderDetails(String orderId);
}
