package cn.huanzi.qch.baseadmin.goods.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class SalesCountVo {
    private BigDecimal totalPurchasing;
    private BigDecimal totalSale;
    private BigDecimal totalProfit;
}
