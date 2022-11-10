package cn.huanzi.qch.baseadmin.goods.vo;

import cn.huanzi.qch.baseadmin.common.pojo.PageCondition;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class GoodsVo extends PageCondition implements Serializable {
    private String id;

    private String name;

    private BigDecimal purchasingPrice;//销售价格

    private BigDecimal salePrice;//进货价格

    private String code;//编码

    private String img;//图片

    private Integer type;//类型




}
