package cn.huanzi.qch.baseadmin.goods.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class SalesReportVo {

    private String name;
    private BigDecimal purchasingPrice;
    private BigDecimal totalPurchasing;
    private BigDecimal salePrice;
    private BigDecimal totalSale;
    private Integer saleNum;
    private BigDecimal profit;
    private String createTime;


}
