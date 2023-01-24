package com.easybuy.mapper;

import com.easybuy.pojo.Shopping;
import com.easybuy.pojo.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/9
 * version: 1.0
 */
public interface ShoppingMapper {

    List<Shopping> findShoppingByUser(User user);

    Integer findCountByUser(User user);

    Double findTotalPriceByUser(User user);

    Shopping findShoppingByUserAndProductId(@Param("userId") Integer userId ,@Param("productId")  Integer productId);

    void updateShopping(Shopping shopping);

    void deleteShopping(Shopping shopping);

    void insertShopping(Shopping shopping);

}
