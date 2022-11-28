package cn.huanzi.qch.baseadmin.goods.vo;

import cn.huanzi.qch.baseadmin.goods.pojo.OrderDetails;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class OrdersVo {
    private Integer id;
    private BigDecimal amount;
    private Integer createTime;
    private Integer payType;
    private String userName;
    List<OrderDetailsVo> orderDetails;
}
