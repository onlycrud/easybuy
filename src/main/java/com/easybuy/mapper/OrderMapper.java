package com.easybuy.mapper;

import com.easybuy.pojo.Order;
import com.easybuy.pojo.OrderDetail;

/**
 * author: 刘韧
 * date: 2023/1/15
 * version: 1.0
 */
public interface OrderMapper {

    Integer insertOrder(Order order);

    Integer insertOrderDetail(OrderDetail orderDetail);

    Order findOrderById(Integer orderId);

}
