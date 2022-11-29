package cn.huanzi.qch.baseadmin.goods.controller;

import cn.huanzi.qch.baseadmin.common.pojo.Result;
import cn.huanzi.qch.baseadmin.goods.pojo.OrderDetails;
import cn.huanzi.qch.baseadmin.goods.service.GoodsService;
import cn.huanzi.qch.baseadmin.goods.service.SalesService;
import cn.huanzi.qch.baseadmin.goods.vo.OrderDetailsGoodVo;
import cn.huanzi.qch.baseadmin.goods.vo.OrderDetailsVo;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/report")
public class ReportController {
    @Autowired
    private SalesService salesService;

    @GetMapping("/reportAdmin")
    public ModelAndView reportAdmin() {
        return new ModelAndView("goods/salesReportAdmin");
    }
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
    public Result salesGroupByName(@RequestParam(required = false) String startTime,
                                   @RequestParam(required = false) String endTime) {
        return salesService.salesGroupByName(startTime, endTime);
    }
    /**
     * 销售详情
     *
     * @param orderId
     * @return
     */
    @GetMapping("/orderDetails")
    public Result<List<OrderDetailsGoodVo>> orderDetails(@RequestParam String orderId  ) {
        return salesService.orderDetails(orderId);
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
