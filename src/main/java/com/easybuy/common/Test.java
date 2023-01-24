package com.easybuy.common;

import com.easybuy.mapper.*;
import com.easybuy.pojo.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import sun.rmi.runtime.NewThreadAction;

import java.io.InputStream;
import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/10
 * version: 1.0
 */
public class Test {
    public static void main(String[] args) {
        String resource = "mybatis-config.xml" ;
        SqlSession sqlSession = null ;
        try {
            InputStream is = Resources.getResourceAsStream(resource);
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
            sqlSession = sqlSessionFactory.openSession();

            UserCollectionMapper mapper = sqlSession.getMapper(UserCollectionMapper.class);


            List<UserCollection> list = mapper.findCollectionByUserId(2);
            list.forEach(System.out::println);


            sqlSession.close();

        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        }
    }
}
