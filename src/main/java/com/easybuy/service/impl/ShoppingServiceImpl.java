package com.easybuy.service.impl;

import com.alibaba.druid.sql.visitor.functions.If;
import com.easybuy.mapper.ShoppingMapper;
import com.easybuy.pojo.Product;
import com.easybuy.pojo.Shopping;
import com.easybuy.pojo.User;
import com.easybuy.service.ShoppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.ws.ServiceMode;
import java.util.IdentityHashMap;
import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/9
 * version: 1.0
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ShoppingServiceImpl  implements ShoppingService {

    @Autowired
    ShoppingMapper shoppingMapper ;

    @Override
    public List<Shopping> findShoppingByUser(User user) {
        return shoppingMapper.findShoppingByUser(user);
    }

    @Override
    public Integer findCountByUser(User user) {
        return shoppingMapper.findCountByUser(user);
    }

    @Override
    public Double findTotalPriceByUser(User user) {
        return shoppingMapper.findTotalPriceByUser(user);
    }

    @Override
    public String changeProductNum(Integer userId, Integer productId, Integer newNum) {

        Shopping shopping = shoppingMapper.findShoppingByUserAndProductId(userId, productId);

        if (newNum < 0 || newNum > shopping.getProduct().getStock() ){
            return "库存不足，修改失败！";
        }
        if (newNum == 0){
            shoppingMapper.deleteShopping(shopping);
            return "删除商品成功！";
        }
        shopping.setProductSum(newNum);
        shoppingMapper.updateShopping(shopping);

        return "修改数量成功！";
    }

    @Override
    public void deleteShopping(Integer userId, Integer productId) {
        Shopping shopping = shoppingMapper.findShoppingByUserAndProductId(userId, productId);
        shoppingMapper.deleteShopping(shopping);
    }

    @Override
    public void deleteShoppingByUser(User user) {
        List<Shopping> list = shoppingMapper.findShoppingByUser(user);
        for (Shopping shopping : list) {
            shoppingMapper.deleteShopping(shopping);
        }
    }

    @Override
    public String addShopping(User user, Product product , Integer productSum) {
        Shopping s = shoppingMapper.findShoppingByUserAndProductId(user.getId(), product.getId());
        if (s==null){
            Shopping shopping = new Shopping();
            shopping.setProductSum(productSum);
            shopping.setProduct(product);
            shopping.setUser(user);
            shoppingMapper.insertShopping(shopping);
            return "success";
        }else {
            s.setProductSum(s.getProductSum() + productSum );
            shoppingMapper.updateShopping(s);
            return "exist";
        }

    }


}
