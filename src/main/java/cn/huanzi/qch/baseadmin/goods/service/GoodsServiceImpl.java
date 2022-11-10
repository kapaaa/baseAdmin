package cn.huanzi.qch.baseadmin.goods.service;

import cn.huanzi.qch.baseadmin.common.pojo.PageInfo;
import cn.huanzi.qch.baseadmin.common.pojo.Result;
import cn.huanzi.qch.baseadmin.common.service.CommonServiceImpl;
import cn.huanzi.qch.baseadmin.goods.pojo.Goods;
import cn.huanzi.qch.baseadmin.goods.repository.GoodsMapper;
import cn.huanzi.qch.baseadmin.goods.repository.SalesGoodsMapper;
import cn.huanzi.qch.baseadmin.goods.vo.GoodsVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesCountVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesGoodsVo;
import cn.huanzi.qch.baseadmin.goods.vo.SalesReportVo;
import cn.huanzi.qch.baseadmin.util.SqlUtil;
import cn.huanzi.qch.baseadmin.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class GoodsServiceImpl extends CommonServiceImpl<GoodsVo, Goods, String> implements GoodsService {

    @PersistenceContext
    private EntityManager em;
    @Autowired
    private SalesGoodsMapper salesGoodsMapper;
    @Autowired
    private GoodsMapper GoodsMapper;

    /**
     * 重写save方法，当新增、修改权限表后需要去更新权限集合
     */
    @Override
    public Result<GoodsVo> save(GoodsVo entityVo) {
        Result<GoodsVo> result = super.save(entityVo);
        return result;
    }

    @Override
    public Result<PageInfo<GoodsVo>> page(GoodsVo entityVo) {

        //根据实体、Vo直接拼接全部SQL
        StringBuilder sql = SqlUtil.joinSqlByEntityAndVo(Goods.class, entityVo);

        //设置SQL、映射实体，以及设置值，返回一个Query对象
        Query query = em.createNativeQuery(sql.toString(), Goods.class);

        //分页设置，page从0开始
        PageRequest pageRequest = entityVo.getPageable();

        //获取最终分页结果
        Result<PageInfo<GoodsVo>> result = Result.of(PageInfo.of(PageInfo.getJpaPage(query, pageRequest, em), GoodsVo.class));
        return result;
    }

    /**
     * 重写list方法，当新增、修改权限表后需要去更新权限集合
     */
    @Override
    public Result<List<GoodsVo>> list(GoodsVo entityVo) {
        return super.list(entityVo);
    }

    @Override
    public Result<String> delete(String id) {
        return super.delete(id);
    }

    @Override
    public Result<List<SalesGoodsVo>> salesGoodsList(String key) {
        if (!key.isEmpty()) {
            key = "WHERE a.name LIKE '%" + key + "%' OR a.code LIKE '%" + key + "%'";
        } else {
            key = "";
        }
        List<SalesGoodsVo> salesGoodsVos = salesGoodsMapper.salesGoodsList(key, new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        return Result.of(salesGoodsVos);
    }

    @Override
    @Transactional
    public synchronized Result<SalesGoodsVo> salesOne(String id, String goodsId, Integer saleNum) {
        id = id.isEmpty() ? UUIDUtil.getUuid() : id;
        salesGoodsMapper.salesOne(id.isEmpty() ? UUIDUtil.getUuid() : id, goodsId, saleNum, new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        return Result.of(salesGoodsMapper.findSalesGoodsById(id));
    }

    @Override
    public Result<com.github.pagehelper.PageInfo<SalesReportVo>> salesReport(String startTime, String endTime, String name) {
        if (StringUtils.isEmpty(startTime) || StringUtils.isEmpty(endTime)) {
            String format = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            startTime = format;
            endTime = format;
        }
        List<SalesReportVo> salesReportVos = salesGoodsMapper.salesReport(startTime, endTime, name);
        com.github.pagehelper.PageInfo<SalesReportVo> pageInfo = new com.github.pagehelper.PageInfo<>(salesReportVos);
        return Result.of(pageInfo);
    }

    @Override
    public Result<SalesCountVo> getSalesCount(String startTime, String endTime, String name) {
        if (StringUtils.isEmpty(startTime) || StringUtils.isEmpty(endTime)) {
            String format = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            startTime = format;
            endTime = format;
        }
        SalesCountVo salesCountVo = salesGoodsMapper.SalesCount(startTime, endTime, name);
        if (salesCountVo.getTotalSale() != null) {
            salesCountVo.setTotalProfit(salesCountVo.getTotalSale().subtract(salesCountVo.getTotalPurchasing()));
        }
        return Result.of(salesCountVo);
    }

    @Override
    public void update(GoodsVo goodsVo) {
        Goods goods = new Goods();
        goods.setName(goodsVo.getName());
        goods.setId(goodsVo.getId());
        goods.setCode(goodsVo.getCode());
        goods.setImg(goodsVo.getImg());
        goods.setPurchasingPrice(goodsVo.getPurchasingPrice());
        goods.setSalePrice(goodsVo.getSalePrice());
        goods.setType(goodsVo.getType());
        goods.setUpdateTime(new Date());
        GoodsMapper.updateById(goods);
    }
}
