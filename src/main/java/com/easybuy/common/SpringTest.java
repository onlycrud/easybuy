package com.easybuy.common;

import com.easybuy.pojo.User;
import com.easybuy.pojo.UserCollection;
import com.easybuy.service.ShoppingService;
import com.easybuy.service.UserCollectionService;
import com.easybuy.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/10
 * version: 1.0
 */
public class SpringTest {

    public static void main(String[] args) {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring.xml");
        UserCollectionService service = applicationContext.getBean("userCollectionServiceImpl", UserCollectionService.class);


        List<UserCollection> list = service.findCollectionByUserId(2);
        System.out.println(list);
        for (UserCollection userCollection : list) {
            System.out.println(userCollection);
        }


    }

}
