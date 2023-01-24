package com.easybuy.service;

import com.easybuy.pojo.User;

/**
 * author: 刘韧
 * date: 2023/1/8
 * version: 1.0
 */

public interface UserService {

    User login(String loginName   , String password);

    void registerUser(User user);
    User findUserByName(String loginName);

    Integer findShoppingCountByUser( User user);

    Double getUserBalance(User user);

}
