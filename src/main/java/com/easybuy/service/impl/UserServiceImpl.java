package com.easybuy.service.impl;

import com.easybuy.mapper.UserMapper;
import com.easybuy.pojo.User;
import com.easybuy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


/**
 * author: 刘韧
 * date: 2023/1/8
 * version: 1.0
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public User login(String loginName, String password) {
        User user = new User();
        user.setLoginName(loginName);
        user.setPassword(password);
        User findUser = userMapper.findUserByNameAndPwd(user);
        if (findUser==null){
            return null ;
        }
        return findUser;
    }

    @Override
    public void registerUser(User user) {
        userMapper.insertUser(user);
    }

    @Override
    public User findUserByName(String loginName) {
        return userMapper.findUserByName(loginName);
    }

    @Override
    public Integer findShoppingCountByUser(User user) {
        return userMapper.findShoppingCountByUser(user.getId());
    }

    @Override
    public Double getUserBalance(User user) {
        return userMapper.getUserBalance(user);
    }
}
