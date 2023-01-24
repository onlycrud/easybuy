package com.easybuy.service;

import com.easybuy.pojo.Product;
import com.easybuy.pojo.Shopping;
import com.easybuy.pojo.User;

import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/9
 * version: 1.0
 */
public interface ShoppingService {

    List<Shopping> findShoppingByUser(User user);

    Integer findCountByUser(User user);

    Double findTotalPriceByUser(User user);

    String changeProductNum(Integer userId, Integer productId, Integer newNum);

    void deleteShopping(Integer userId , Integer productId );

    void deleteShoppingByUser(User user);

    String  addShopping(User user , Product product , Integer productSum);
}
