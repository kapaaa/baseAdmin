package cn.huanzi.qch.baseadmin.goods.pojo;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "goods")
@Data

public class Goods implements Serializable {
    @Id
    private String id;//

    private String name;

    private BigDecimal purchasingPrice;//进货价格

    private BigDecimal salePrice;//销售价格

    private String code;//编码

    private String img;//图片

    private Integer type;//类型

    private Integer stock;//库存

    private Date createTime;//创建时间

    private Date updateTime;//修改时间

}
