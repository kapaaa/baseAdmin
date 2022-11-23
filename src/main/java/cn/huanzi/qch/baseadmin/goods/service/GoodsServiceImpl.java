package cn.huanzi.qch.baseadmin.goods.service;

import cn.huanzi.qch.baseadmin.common.emum.GoodsTypeEnum;
import cn.huanzi.qch.baseadmin.common.pojo.PageInfo;
import cn.huanzi.qch.baseadmin.common.pojo.Result;
import cn.huanzi.qch.baseadmin.common.service.CommonServiceImpl;
import cn.huanzi.qch.baseadmin.goods.pojo.Goods;
import cn.huanzi.qch.baseadmin.goods.repository.GoodsMapper;
import cn.huanzi.qch.baseadmin.goods.repository.SalesGoodsMapper;
import cn.huanzi.qch.baseadmin.goods.vo.*;
import cn.huanzi.qch.baseadmin.util.SecurityUtil;
import cn.huanzi.qch.baseadmin.util.SqlUtil;
import cn.huanzi.qch.baseadmin.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
    public synchronized Result<SalesGoodsVo> salesOne(SalesGoodsVo goods) {
        String id = goods.getId().isEmpty() ? UUIDUtil.getUuid() : goods.getId();
        salesGoodsMapper.salesOne(id, goods.getGoodsId(), goods.getSaleNum(), new SimpleDateFormat("yyyy-MM-dd").format(new Date()), SecurityUtil.getLoginUser().getUsername(), goods.getPurchasingPrice(), goods.getSalePrice());
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
        SalesCountVo salesCountVo = salesGoodsMapper.salesCount(startTime, endTime, name);
        if (salesCountVo != null && salesCountVo.getTotalSale() != null && salesCountVo.getTotalPurchasing() != null) {
            salesCountVo.setTotalProfit(salesCountVo.getTotalSale().subtract(salesCountVo.getTotalPurchasing()));
        }
        return Result.of(salesCountVo);
    }

    @Override
    public Result salesGroupByDate(String startTime, String endTime, String type) {
        startTime = checkStartTime(startTime);
        endTime = checkEndTime(endTime);
        List<SalesCountVo> salesCountVos = salesGoodsMapper.salesGroupByDate(startTime, endTime, type);
        if (!CollectionUtils.isEmpty(salesCountVos)) {
            for (SalesCountVo e : salesCountVos) {
                if (e != null && e.getTotalSale() != null && e.getTotalPurchasing() != null) {
                    e.setTotalProfit(e.getTotalSale().subtract(e.getTotalPurchasing()));
                }
            }
        }
        return Result.of(salesCountVos);
    }

    @Override
    public Result<List<SalesReportVo>> salesGroupByName(String startTime, String endTime) {
        startTime = checkStartTime(startTime);
        endTime = checkEndTime(endTime);
        return Result.of(salesGoodsMapper.salesGroupByName(startTime, endTime));
    }

    @Override
    public Result salesGroupByType(String startTime, String endTime) {
        startTime = checkStartTime(startTime);
        endTime = checkEndTime(endTime);
        List<SalesReportByTypeVo> salesReportByTypeVos = salesGoodsMapper.salesGroupByType(startTime, endTime);
        for (SalesReportByTypeVo e : salesReportByTypeVos) {
            e.setName(GoodsTypeEnum.getValue(e.getType()));
        }
        return Result.of(salesReportByTypeVos);
    }

    @Override
    public Result<Boolean> checkStock(String goodId) {
        Goods goods = GoodsMapper.selectById(goodId);
        if (goods != null && goods.getStock() != null && goods.getStock() > 0) {
            return Result.of(true);
        }
        return Result.of(false);
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
        goods.setStock(goodsVo.getStock());
        goods.setUpdateTime(new Date());
        GoodsMapper.updateById(goods);
    }

    public String checkStartTime(String startTime) {
        if (startTime.isEmpty()) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cale = Calendar.getInstance();
            cale.add(Calendar.MONTH, 0);
            cale.set(Calendar.DAY_OF_MONTH, 1);
            return format.format(cale.getTime());
        }
        return startTime;
    }

    public String checkEndTime(String endTime) {
        if (endTime.isEmpty()) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            return format.format(new Date());
        }
        return endTime;
    }

}
