package com.easybuy.mapper;

import com.easybuy.pojo.Product;

import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/13
 * version: 1.0
 */
public interface ProductMapper {
    List<Product> findProductByName(String name);

    Integer findCountByName(String name);

    List<Product> findProductByCategoryId(Integer categoryId);

    Product findProductById(Integer id);

    List<Product> findAllProduct();
}
