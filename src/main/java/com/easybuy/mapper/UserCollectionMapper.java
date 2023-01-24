package com.easybuy.mapper;

import com.easybuy.pojo.UserCollection;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/17
 * version: 1.0
 */
public interface UserCollectionMapper {


    List<UserCollection> findCollectionByUserId(Integer userId);

    void deleteCollectionByUser(Integer userId);

    void insertCollection(UserCollection userCollection);

    UserCollection findCollectionByUserIdAndProductId(@Param("userId") Integer userId ,@Param("productId") Integer productId);

}
