package com.easybuy.service.impl;

import com.easybuy.mapper.NewsMapper;
import com.easybuy.pojo.News;
import com.easybuy.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.ws.ServiceMode;
import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/12
 * version: 1.0
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class NewsServiceImpl implements NewsService {

    @Autowired
    NewsMapper newsMapper;


    @Override
    public List<News> getNews() {
        return newsMapper.getNews();
    }

    @Override
    public News findNewsById(Integer newsId) {
        return newsMapper.findNewsById(newsId);
    }

    @Override
    public List<News> getNewsByPage(Integer pageNum) {
        Integer from = (pageNum-1) * 10     ;
        return newsMapper.getNewsByPage(from);
    }
}
