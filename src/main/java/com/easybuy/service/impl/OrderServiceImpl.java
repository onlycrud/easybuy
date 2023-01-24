package com.easybuy.service.impl;

import com.easybuy.mapper.OrderMapper;
import com.easybuy.pojo.Order;
import com.easybuy.pojo.OrderDetail;
import com.easybuy.pojo.Shopping;
import com.easybuy.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/15
 * version: 1.0
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderMapper orderMapper;

    @Override
    public Integer createOrder(Order order) {
        return  orderMapper.insertOrder(order);
    }

    @Override
    public void saveDetails(List<Shopping> list , Order order) {
        Integer orderId = order.getId();
        ArrayList<OrderDetail> details = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            Shopping shopping = list.get(i);
            OrderDetail detail = new OrderDetail();
            detail.setOrderId(orderId);
            detail.setProductId(shopping.getProduct().getId());
            detail.setQuantity(shopping.getProductSum());
            detail.setCost(shopping.getProductSum() * shopping.getProduct().getPrice());
            details.add(detail);
            orderMapper.insertOrderDetail(detail);
        }
        order.setDetails(details);
    }

    @Override
    public Order findOrderById(Integer orderId) {
        return orderMapper.findOrderById(orderId);
    }
}
