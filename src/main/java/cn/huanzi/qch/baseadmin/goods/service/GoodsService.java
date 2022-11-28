package cn.huanzi.qch.baseadmin.goods.service;

import cn.huanzi.qch.baseadmin.common.pojo.Result;
import cn.huanzi.qch.baseadmin.common.service.CommonService;
import cn.huanzi.qch.baseadmin.goods.pojo.Goods;
import cn.huanzi.qch.baseadmin.goods.vo.GoodsVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesGoodsVo;

public interface GoodsService extends CommonService<GoodsVo, Goods, String> {

    void update(GoodsVo goodsVo);
}
