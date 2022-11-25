package cn.huanzi.qch.baseadmin.goods.controller;

import cn.huanzi.qch.baseadmin.common.controller.CommonController;
import cn.huanzi.qch.baseadmin.common.pojo.Result;
import cn.huanzi.qch.baseadmin.goods.pojo.Goods;
import cn.huanzi.qch.baseadmin.goods.service.GoodsService;
import cn.huanzi.qch.baseadmin.goods.vo.GoodsVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesGoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/sales")
public class SalesController extends CommonController<GoodsVo, Goods, String> {

    @Autowired
    private GoodsService goodsService;

    @GetMapping("/index")
    public ModelAndView reports2() {
        return new ModelAndView("goods/salesGood");
    }

    @GetMapping("/list")
    @ResponseBody
    public Result query(@RequestParam String key) {
        return goodsService.salesGoodsList(key);
    }

    @PostMapping("/saleOne")
    @ResponseBody
    public Result saleOne(@RequestBody SalesGoodsVo goods) {
        return goodsService.salesOne(goods);
    }
    @GetMapping("/checkStock")
    @ResponseBody
    public Result checkStock(@RequestParam String goodId,@RequestParam Integer stock) {
        return goodsService.checkStock(goodId,stock);
    }

    @GetMapping("/salesCount")
    public Result getSalesCount(@RequestParam(required = false) String startTime,
                                @RequestParam(required = false) String endTime,
                                @RequestParam(required = false) String name) {
        return goodsService.getSalesCount(startTime, endTime, name);
    }
}
