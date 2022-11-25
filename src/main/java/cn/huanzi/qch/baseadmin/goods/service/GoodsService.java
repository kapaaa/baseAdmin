package cn.huanzi.qch.baseadmin.goods.service;

import cn.huanzi.qch.baseadmin.common.pojo.PageInfo;
import cn.huanzi.qch.baseadmin.common.pojo.Result;
import cn.huanzi.qch.baseadmin.common.service.CommonService;
import cn.huanzi.qch.baseadmin.goods.pojo.Goods;
import cn.huanzi.qch.baseadmin.goods.vo.GoodsVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesGoodsVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesReportVo;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface GoodsService extends CommonService<GoodsVo, Goods, String> {
    /**
     * 销售商品列表
     *
     * @param key
     * @return
     */
    Result<List<SalesGoodsVo>> salesGoodsList(String key);

    /**
     * 出售或回退
     *
     * @param goods
     * @return
     */
    Result<SalesGoodsVo> salesOne(SalesGoodsVo goods);

    /**
     * 销售报表
     *
     * @param startTime
     * @param endTime
     * @param name
     * @return
     */
    Result<com.github.pagehelper.PageInfo<SalesReportVo>> salesReport(String startTime, String endTime, String name);

    Result<List<SalesReportVo>> salesGroupByName(String startTime, String endTime);

    Result getSalesCount(String startTime, String endTime, String name);

    Result salesGroupByDate(String startTime, String endTime,String type);

    void update(GoodsVo goodsVo);

    Result salesGroupByType(String startTime, String endTime);

    Result<Boolean> checkStock(String goodId, Integer stock);
}
