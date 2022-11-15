package cn.huanzi.qch.baseadmin.goods.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class SalesGoodsVo {
    private String id;
    private String goodsId;
    private String name;
    private Integer saleNum;
    private BigDecimal purchasingPrice;
    private BigDecimal salePrice;
    private String img;
}
