package com.easybuy.pojo;

/**
 * author: 刘韧
 * date: 2023/1/16
 * version: 1.0
 */
public class UserCollection {
    private Integer id ;
    private Integer userId ;
    private Product product;

    @Override
    public String toString() {
        return "UserCollection{" +
                "id=" + id +
                ", userId=" + userId +
                ", product=" + product +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
