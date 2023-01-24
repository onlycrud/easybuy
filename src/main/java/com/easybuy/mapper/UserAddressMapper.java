package com.easybuy.mapper;

import com.easybuy.pojo.User;
import com.easybuy.pojo.UserAddress;

import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/11
 * version: 1.0
 */
public interface UserAddressMapper {

    List<UserAddress> findAddressByUser(User user);

    UserAddress findAddressById(Integer id);

    void updateAddress(UserAddress userAddress);
}
