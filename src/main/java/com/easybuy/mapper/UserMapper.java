package com.easybuy.mapper;

import com.easybuy.pojo.User;

/**
 * author: 刘韧
 * date: 2023/1/8
 * version: 1.0
 */
public interface UserMapper {

    User findUserByNameAndPwd(User user);

    User findUserByName(String loginName);

    void insertUser(User user);

    Integer findShoppingCountByUser( Integer userId);

    Double getUserBalance(User user);


}
