package cn.huanzi.qch.baseadmin.goods.controller;

import cn.huanzi.qch.baseadmin.common.controller.CommonController;
import cn.huanzi.qch.baseadmin.common.pojo.PageInfo;
import cn.huanzi.qch.baseadmin.common.pojo.Result;
import cn.huanzi.qch.baseadmin.goods.pojo.Goods;
import cn.huanzi.qch.baseadmin.goods.service.GoodsService;
import cn.huanzi.qch.baseadmin.goods.vo.GoodsVo;
import cn.huanzi.qch.baseadmin.sys.sysuser.vo.SysUserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/goods")
public class GoodsController extends CommonController<GoodsVo, Goods, String> {

@Autowired
private GoodsService goodsService;
    @GetMapping("/index")
    public ModelAndView list() {
        return new ModelAndView("goods/goods");
    }

    @PostMapping("/add")
    @ResponseBody
    public Result add(@RequestBody GoodsVo goodsVo) {
        goodsService.save(goodsVo);
        return new Result() ;
    }

    @PostMapping("/update")
    @ResponseBody
    public Result update(@RequestBody GoodsVo goodsVo) {
        goodsService.update(goodsVo);
        return new Result() ;
    }




    @GetMapping("/list")
    @ResponseBody
    public Result query(@RequestParam Integer page,@RequestParam Integer limit) {
        GoodsVo goodsVo = new GoodsVo();
        goodsVo.setRows(limit);
        goodsVo.setPage(page);
        Result<PageInfo<GoodsVo>> list = goodsService.page(goodsVo);

        return list;
    }

    @PutMapping("/delete/{id}")
    @ResponseBody
    public Result delete(@PathVariable("id") String id) {
        return goodsService.delete(id);
    }
}
