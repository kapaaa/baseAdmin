package cn.huanzi.qch.baseadmin.goods.pojo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "goods_sales")
@Data
public class SalesGoods implements Serializable {
    @Id
    private String id;//

    private String goodsId;

    private Integer saleNum;//进货价格

    private Date createTime;//销售价格

}
