package com.easybuy.service.impl;

import com.easybuy.mapper.ProductMapper;
import com.easybuy.pojo.Page;
import com.easybuy.pojo.Product;
import com.easybuy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.jnlp.IntegrationService;
import javax.xml.ws.ServiceMode;
import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/13
 * version: 1.0
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {


    @Autowired
    ProductMapper productMapper;


    @Override
    public Page searchByName(String name , Integer pageNum) {
        List<Product> list = productMapper.findProductByName(name);
        Integer totalCount = productMapper.findCountByName(name);
        Page page = new Page();
        page.setList(list);
        page.setTotalCount(totalCount);
        page.setPageNum(pageNum);
        page.setTotalPage(totalCount%20==0? totalCount/20 : totalCount/20 +1);
        page.setType(0);
        return page ;
    }

    @Override
    public Page searchByCategory(Integer categoryId, Integer pageNum) {
        List<Product> list = productMapper.findProductByCategoryId(categoryId);
        Page page = new Page();
        page.setList(list);
        page.setPageNum(pageNum);
        page.setTotalCount(list.size());
        page.setType(1);
        page.setTotalPage(list.size()%20==0?list.size()/20 : list.size()/20 + 1 );

        return page ;
    }

    @Override
    public Product findProductById(Integer id) {
        return productMapper.findProductById(id);
    }

    @Override
    public List<Product> getAllProduct() {
        return productMapper.findAllProduct();
    }
}
