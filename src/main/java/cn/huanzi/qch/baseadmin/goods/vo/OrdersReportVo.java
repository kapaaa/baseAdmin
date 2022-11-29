package cn.huanzi.qch.baseadmin.goods.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class OrdersReportVo {

    private String id;
    private BigDecimal totalPurchasing;
    private BigDecimal totalSale;
    private BigDecimal profit;
    private String createTime;
    private Integer payType;
    private String userName;


}
