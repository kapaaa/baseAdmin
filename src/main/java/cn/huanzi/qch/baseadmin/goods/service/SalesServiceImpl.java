package cn.huanzi.qch.baseadmin.goods.service;

import cn.huanzi.qch.baseadmin.common.emum.GoodsTypeEnum;
import cn.huanzi.qch.baseadmin.common.pojo.Result;
import cn.huanzi.qch.baseadmin.goods.pojo.Goods;
import cn.huanzi.qch.baseadmin.goods.pojo.OrderDetails;
import cn.huanzi.qch.baseadmin.goods.pojo.Orders;
import cn.huanzi.qch.baseadmin.goods.repository.GoodsMapper;
import cn.huanzi.qch.baseadmin.goods.repository.OrderDetailsMapper;
import cn.huanzi.qch.baseadmin.goods.repository.OrdersMapper;
import cn.huanzi.qch.baseadmin.goods.repository.SalesGoodsMapper;
import cn.huanzi.qch.baseadmin.goods.vo.*;
import cn.huanzi.qch.baseadmin.util.SecurityUtil;
import cn.huanzi.qch.baseadmin.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class SalesServiceImpl implements SalesService {


    @Autowired
    private SalesGoodsMapper salesGoodsMapper;
    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private OrderDetailsMapper orderDetailsMapper;


    @Override
    public Result<List<SalesGoodsVo>> salesGoodsList(String key) {
        if (!key.isEmpty()) {
            key = "WHERE a.name LIKE '%" + key + "%' OR a.code LIKE '%" + key + "%'";
        } else {
            key = "";
        }
        List<SalesGoodsVo> salesGoodsVos = salesGoodsMapper.salesGoodsList(key);
        return Result.of(salesGoodsVos);
    }


    @Override
    @Transactional
    public synchronized Result sales(OrdersVo orderVos) {
        Orders orders = new Orders();
        String orderId = UUIDUtil.getUuid();
        orders.setId(orderId);
        orders.setPayType(orderVos.getPayType());
        orders.setUserName(SecurityUtil.getLoginUser().getUsername());
        orders.setCreateTime(new Date());
        BigDecimal amount = new BigDecimal(0);
        BigDecimal cost = new BigDecimal(0);

        List<OrderDetails> orderDetailsList = new ArrayList<>();
        for (OrderDetailsVo o : orderVos.getOrderDetails()) {
            OrderDetails orderDetails = new OrderDetails();
            orderDetails.setId(UUIDUtil.getUuid());
            orderDetails.setGoodId(o.getGoodId());
            orderDetails.setOrderId(orderId);
            orderDetails.setPurchasingPrice(o.getPurchasingPrice());
            orderDetails.setSaleNum(o.getSaleNum());
            orderDetails.setSalePrice(o.getSalePrice());
            orderDetailsList.add(orderDetails);
            amount = amount.add(o.getSalePrice().multiply(BigDecimal.valueOf(o.getSaleNum())));
            cost = cost.add(o.getPurchasingPrice().multiply(BigDecimal.valueOf(o.getSaleNum())));
            //TODO 库存
            salesGoodsMapper.updateStock(o.getGoodId(), o.getSaleNum());
        }
        orders.setAmount(amount);
        orders.setCost(cost);
        ordersMapper.insert(orders);
        orderDetailsMapper.batchInsert(orderDetailsList);
        return Result.of(null);
    }

    @Override
    public Result<com.github.pagehelper.PageInfo<OrdersReportVo>> salesReport(String startTime, String endTime, String name) {
        startTime = checkStartTime(startTime);
        endTime = checkEndTime(endTime);
        List<OrdersReportVo> salesReportVos = salesGoodsMapper.salesReport(startTime, endTime, name);
        com.github.pagehelper.PageInfo<OrdersReportVo> pageInfo = new com.github.pagehelper.PageInfo<>(salesReportVos);
        return Result.of(pageInfo);
    }

    @Override
    public Result<List<OrderDetailsGoodVo>> orderDetails(String orderId) {
        return Result.of(orderDetailsMapper.orderDetails(orderId));
    }

    @Override
    public Result<SalesCountVo> getSalesCount(String startTime, String endTime, String name) {
        startTime = checkStartTime(startTime);
        endTime = checkEndTime(endTime);
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
    public Result<List<SalesReportByNameVo>> salesGroupByName(String startTime, String endTime) {
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
    public Result<Boolean> checkStock(String goodId, Integer stock) {
        Goods goods = goodsMapper.selectById(goodId);
        if (goods != null && goods.getStock() != null && goods.getStock() >= stock) {
            return Result.of(true);
        }
        return Result.of(false);
    }

    public String checkStartTime(String startTime) {
        if (startTime.isEmpty()) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd ");
            Calendar cale = Calendar.getInstance();
            cale.add(Calendar.MONTH, 0);
            cale.set(Calendar.DAY_OF_MONTH, 1);
            return format.format(cale.getTime());
        }
        return startTime;
    }

    public String checkEndTime(String endTime) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (endTime.isEmpty()) {
            return format.format(new Date());
        }
        Date parse = null;
        try {
            parse = format.parse(endTime + " 23:59:59");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return format.format(parse);
    }

}
