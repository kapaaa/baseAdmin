package cn.huanzi.qch.baseadmin.goods.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class SalesCountVo {
    private BigDecimal totalPurchasing;
    private BigDecimal totalSale;
    private BigDecimal totalProfit;
    private Date createTime;

}
