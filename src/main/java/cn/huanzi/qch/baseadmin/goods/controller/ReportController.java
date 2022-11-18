package cn.huanzi.qch.baseadmin.goods.controller;

import cn.huanzi.qch.baseadmin.common.pojo.Result;
import cn.huanzi.qch.baseadmin.goods.service.GoodsService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/report")
public class ReportController {
    @Autowired
    private GoodsService goodsService;

    @GetMapping("/report")
    public ModelAndView report() {
        return new ModelAndView("goods/salesReport");
    }

    @GetMapping("/reports")
    public ModelAndView reports() {
        return new ModelAndView("goods/salesReports");
    }

    @GetMapping("/salesReport")
    public Result salesReport(@RequestParam(required = false) String startTime,
                              @RequestParam(required = false) String endTime,
                              @RequestParam Integer page,
                              @RequestParam Integer limit,
                              @RequestParam(required = false) String name) {
        PageHelper.startPage(page, limit);
        return goodsService.salesReport(startTime, endTime, name);
    }

    @GetMapping("/salesGroupByName")
    public Result salesGoodsReport(@RequestParam(required = false) String startTime,
                                   @RequestParam(required = false) String endTime) {
        return goodsService.salesGroupByName(startTime, endTime);
    }

    @GetMapping("/salesGroupByDate")
    public Result salesGroupByDate(@RequestParam(required = false) String startTime, @RequestParam(required = false) String endTime) {
        return goodsService.salesGroupByDate(startTime, endTime);
    }
    @GetMapping("/salesGroupByType")
    public Result salesGroupByType(@RequestParam(required = false) String startTime, @RequestParam(required = false) String endTime) {
        return goodsService.salesGroupByType(startTime, endTime);
    }

}
