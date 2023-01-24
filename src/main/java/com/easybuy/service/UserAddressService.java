package com.easybuy.service;

import com.easybuy.pojo.User;
import com.easybuy.pojo.UserAddress;

/**
 * author: 刘韧
 * date: 2023/1/13
 * version: 1.0
 */
public interface UserAddressService {

    UserAddress getAddress(User user );

    UserAddress findAddressById(Integer id );

    void updateAddress(UserAddress userAddress);

}
