package cn.huanzi.qch.baseadmin.goods.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class OrderDetailsGoodVo {
    private Integer type;
    private String name;
    private BigDecimal purchasingPrice;
    private BigDecimal salePrice;
    private Integer saleNum;
    private Integer stock;
}
