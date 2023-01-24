package com.easybuy.service.impl;

import com.easybuy.mapper.ProductCategoryMapper;
import com.easybuy.pojo.ProductCategory;
import com.easybuy.service.ProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/16
 * version: 1.0
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ProductCategoryServiceImpl implements ProductCategoryService {

    @Autowired
    ProductCategoryMapper productCategoryMapper ;


    @Override
    public List<ProductCategory> getAll() {
        return productCategoryMapper.getAll();
    }

    @Override
    public List<ProductCategory> getLevelOne() {
        return productCategoryMapper.getLevelOne();
    }

    @Override
    public List<ProductCategory> getLevelTwo() {
        return productCategoryMapper.getLevelTwo();
    }

    @Override
    public List<ProductCategory> getLevelThree() {
        return productCategoryMapper.getLevelThree();
    }

    @Override
    public ProductCategory findById(Integer categoryId) {
        return productCategoryMapper.findById(categoryId);
    }
}
