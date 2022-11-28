package cn.huanzi.qch.baseadmin.goods.pojo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;

@Entity
@Table(name = "order_details")
@Data
public class OrderDetails {
    @Id
    private String id;
    private String orderId;
    private String goodId;
    private Integer saleNum;//销售数量
    private BigDecimal purchasingPrice;//进货价格
    private BigDecimal salePrice;//销售价格

}
