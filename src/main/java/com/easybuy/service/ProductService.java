package com.easybuy.service;

import com.easybuy.pojo.Page;
import com.easybuy.pojo.Product;

import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/13
 * version: 1.0
 */
public interface ProductService {
    Page searchByName(String name , Integer pageNum );
    Page searchByCategory(Integer categoryId , Integer pageNum);
    Product findProductById(Integer id);
    List<Product> getAllProduct();
}
