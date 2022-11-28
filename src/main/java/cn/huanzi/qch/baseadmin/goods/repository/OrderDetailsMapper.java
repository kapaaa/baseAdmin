package cn.huanzi.qch.baseadmin.goods.repository;

import cn.huanzi.qch.baseadmin.goods.pojo.OrderDetails;
import cn.huanzi.qch.baseadmin.goods.pojo.Orders;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderDetailsMapper extends BaseMapper<OrderDetails> {

    int batchInsert(List<OrderDetails> entity);
}
