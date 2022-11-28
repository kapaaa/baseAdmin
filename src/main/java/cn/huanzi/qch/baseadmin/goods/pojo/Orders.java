package cn.huanzi.qch.baseadmin.goods.pojo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "orders")
@Data
public class Orders implements Serializable {
    @Id
    private String id;//id
    private BigDecimal amount;//总销售金额
    private Date createTime; //创建时间
    private Integer payType; //支付方式1微信2支付宝
    private String userName;//销售人
    private BigDecimal cost;//总成本

}
