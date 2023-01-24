package com.easybuy.service.impl;

import com.easybuy.mapper.UserCollectionMapper;
import com.easybuy.pojo.UserCollection;
import com.easybuy.service.UserCollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.IdentityHashMap;
import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/17
 * version: 1.0
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class UserCollectionServiceImpl implements UserCollectionService {

    @Autowired
    UserCollectionMapper userCollectionMapper   ;

    @Override
    public List<UserCollection> findCollectionByUserId(Integer userId) {

        return userCollectionMapper.findCollectionByUserId(userId);
    }

    @Override
    public void deleteCollectionByUser(Integer userId) {
        userCollectionMapper.deleteCollectionByUser(userId);
    }

    @Override
    public String addCollection(UserCollection userCollection) {
        UserCollection collection = userCollectionMapper.findCollectionByUserIdAndProductId(userCollection.getUserId(), userCollection.getProduct().getId());
        if (collection==null){
            userCollectionMapper.insertCollection(userCollection);
            return "success";
        }else {
            return "exist";
        }

    }
}
