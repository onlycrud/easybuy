package com.easybuy.service;

import com.easybuy.pojo.UserCollection;

import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/17
 * version: 1.0
 */
public interface UserCollectionService {

    List<UserCollection> findCollectionByUserId(Integer userId);

    void deleteCollectionByUser(Integer userId);

    String addCollection(UserCollection userCollection);

}
