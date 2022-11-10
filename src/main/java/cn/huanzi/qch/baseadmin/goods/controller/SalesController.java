package cn.huanzi.qch.baseadmin.goods.controller;

import cn.huanzi.qch.baseadmin.common.controller.CommonController;
import cn.huanzi.qch.baseadmin.common.pojo.PageInfo;
import cn.huanzi.qch.baseadmin.common.pojo.Result;
import cn.huanzi.qch.baseadmin.goods.pojo.Goods;
import cn.huanzi.qch.baseadmin.goods.service.GoodsService;
import cn.huanzi.qch.baseadmin.goods.vo.GoodsVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesGoodsVo;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/sales")
public class SalesController extends CommonController<GoodsVo, Goods, String> {

    @Autowired
    private GoodsService goodsService;

    @GetMapping("/index")
    public ModelAndView list() {
        return new ModelAndView("/goods/sales");
    }

    @GetMapping("/report")
    public ModelAndView report() {
        return new ModelAndView("goods/salesReport");
    }

    @GetMapping("/list")
    @ResponseBody
    public Result query(@RequestParam String key) {
        return goodsService.salesGoodsList(key);
    }

    @PostMapping("/saleOne")
    @ResponseBody
    public Result saleOne(@RequestBody SalesGoodsVo goods) {
        return goodsService.salesOne(goods.getId(), goods.getGoodsId(), goods.getSaleNum());
    }

    @GetMapping("/salesReport")
    public Result salesReport(@RequestParam(required=false) String startTime,
                              @RequestParam(required=false) String endTime,
                              @RequestParam Integer page,
                              @RequestParam Integer limit,
                              @RequestParam(required=false) String name) {
        PageHelper.startPage(page,limit);

        System.out.println(startTime);
        System.out.println(endTime);
        System.out.println(name);
        return goodsService.salesReport(startTime, endTime, name);
    }

    @GetMapping("/salesCount")
    public Result getSalesCount(@RequestParam(required=false) String startTime,
                              @RequestParam(required=false) String endTime,
                              @RequestParam(required=false) String name) {

        return goodsService.getSalesCount(startTime, endTime, name);
    }
}
