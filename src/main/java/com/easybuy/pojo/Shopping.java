package com.easybuy.pojo;

/**
 * author: 刘韧
 * date: 2023/1/9
 * version: 1.0
 */
public class Shopping {
    private Integer shoppingId ;
    private User user;
    private Product product ;
    private Integer productSum ;

    @Override
    public String toString() {
        return "Shopping{" +
                "shoppingId=" + shoppingId +
                ", user=" + user +
                ", product=" + product +
                ", productSum=" + productSum +
                '}';
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getProductSum() {
        return productSum;
    }

    public void setProductSum(Integer productSum) {
        this.productSum = productSum;
    }

    public Integer getShoppingId() {
        return shoppingId;
    }

    public void setShoppingId(Integer shoppingId) {
        this.shoppingId = shoppingId;
    }
}
