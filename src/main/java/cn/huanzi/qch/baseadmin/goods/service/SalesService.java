package cn.huanzi.qch.baseadmin.goods.service;

import cn.huanzi.qch.baseadmin.common.pojo.Result;
import cn.huanzi.qch.baseadmin.goods.vo.GoodsVo;
import cn.huanzi.qch.baseadmin.goods.vo.OrdersVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesGoodsVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesReportVo;

import java.util.List;

public interface SalesService {

    Result<List<SalesGoodsVo>> salesGoodsList(String key);

    Result sales(OrdersVo goods);

    Result<com.github.pagehelper.PageInfo<SalesReportVo>> salesReport(String startTime, String endTime, String name);

    Result<List<SalesReportVo>> salesGroupByName(String startTime, String endTime);

    Result getSalesCount(String startTime, String endTime, String name);

    Result salesGroupByDate(String startTime, String endTime,String type);


    Result salesGroupByType(String startTime, String endTime);

    Result<Boolean> checkStock(String goodId, Integer stock);
}
