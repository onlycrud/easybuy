package com.easybuy.mapper;

import com.easybuy.pojo.News;

import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/12
 * version: 1.0
 */
public interface NewsMapper {

    List<News> getNews();

    News findNewsById(Integer newsId);

    List<News> getNewsByPage(Integer from);

}
