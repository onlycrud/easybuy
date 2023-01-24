package com.easybuy.service;

import com.easybuy.pojo.Order;
import com.easybuy.pojo.OrderDetail;
import com.easybuy.pojo.Shopping;

import javax.jnlp.IntegrationService;
import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/15
 * version: 1.0
 */
public interface OrderService {

    Integer createOrder(Order order  );

    void saveDetails(List<Shopping> list , Order order) ;

    Order findOrderById(Integer orderId );

}
