package com.easybuy.pojo;

import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/9
 * version: 1.0
 */
public class Page {
    private Integer pageNum;
    private Integer totalPage ;
    private List list ;
    private Integer totalCount ;
    private Integer type ; //0代表搜索  1代表分类

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }
}
