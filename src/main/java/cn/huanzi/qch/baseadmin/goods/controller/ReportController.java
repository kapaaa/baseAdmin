package cn.huanzi.qch.baseadmin.goods.controller;

import cn.huanzi.qch.baseadmin.common.pojo.Result;
import cn.huanzi.qch.baseadmin.goods.service.GoodsService;
import cn.huanzi.qch.baseadmin.goods.service.SalesService;
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
    private SalesService salesService;

    @GetMapping("/report")
    public ModelAndView report() {
        return new ModelAndView("goods/salesReport");
    }

    @GetMapping("/reports")
    public ModelAndView reports() {
        return new ModelAndView("goods/salesReportByYear");
    }

    /**
     * 销售报表
     *
     * @param startTime
     * @param endTime
     * @param name
     * @return
     */
    @GetMapping("/salesReport")
    public Result salesReport(@RequestParam(required = false) String startTime,
                              @RequestParam(required = false) String endTime,
                              @RequestParam Integer page,
                              @RequestParam Integer limit,
                              @RequestParam(required = false) String name) {
        PageHelper.startPage(page, limit);
        return salesService.salesReport(startTime, endTime, name);
    }

    /**
     * 销售报表名字
     * @param startTime
     * @param endTime
     * @return
     */
    @GetMapping("/salesGroupByName")
    public Result salesGoodsReport(@RequestParam(required = false) String startTime,
                                   @RequestParam(required = false) String endTime) {
        return salesService.salesGroupByName(startTime, endTime);
    }

    /**
     * 销售报表日期
     * @param startTime
     * @param endTime
     * @return
     */
    @GetMapping("/salesGroupByDate")
    public Result salesGroupByDate(@RequestParam(required = false) String startTime, @RequestParam(required = false) String endTime,@RequestParam(required = false) String type) {
        return salesService.salesGroupByDate(startTime, endTime,type);
    }
    /**
     * 销售报表类型
     * @param startTime
     * @param endTime
     * @return
     */
    @GetMapping("/salesGroupByType")
    public Result salesGroupByType(@RequestParam(required = false) String startTime, @RequestParam(required = false) String endTime) {
        return salesService.salesGroupByType(startTime, endTime);
    }
}
