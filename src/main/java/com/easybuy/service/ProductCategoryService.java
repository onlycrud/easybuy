package com.easybuy.service;

import com.easybuy.pojo.ProductCategory;

import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/16
 * version: 1.0
 */
public interface ProductCategoryService {


    List<ProductCategory> getAll();

    List<ProductCategory> getLevelOne();

    List<ProductCategory> getLevelTwo();

    List<ProductCategory> getLevelThree();

    ProductCategory findById(Integer categoryId);


}
