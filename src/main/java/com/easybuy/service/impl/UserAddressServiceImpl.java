package com.easybuy.service.impl;

import com.easybuy.mapper.UserAddressMapper;
import com.easybuy.pojo.User;
import com.easybuy.pojo.UserAddress;
import com.easybuy.service.UserAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.ws.ServiceMode;
import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/13
 * version: 1.0
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class UserAddressServiceImpl implements UserAddressService  {

    @Autowired
    UserAddressMapper userAddressMapper;

    @Override
    public UserAddress getAddress(User user) {
        List<UserAddress> list = userAddressMapper.findAddressByUser(user);
        if (list.size()==0){
            return null ;
        }
        for (int i = 0; i < list.size(); i++) {
            UserAddress userAddress = list.get(i);
            if (userAddress.getIsDefault()==1){
                return userAddress ;
            }
        }
        return list.get(0);
    }

    @Override
    public UserAddress findAddressById(Integer id) {
        return userAddressMapper.findAddressById(id);
    }

    @Override
    public void updateAddress(UserAddress userAddress) {
        userAddressMapper.updateAddress(userAddress);
    }
}
