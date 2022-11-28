package cn.huanzi.qch.baseadmin.goods.vo;

import lombok.Data;

import java.math.BigDecimal;
@Data
public class OrderDetailsVo {
    private Integer orderId;
    private String goodId;
    private BigDecimal purchasingPrice;
    private BigDecimal salePrice;
    private Integer saleNum;
}
