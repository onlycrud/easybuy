package com.easybuy.pojo;


import java.util.Date;
import java.util.List;

/**
 * author: 刘韧
 * date: 2023/1/9
 * version: 1.0
 */
public class Order {
    private Integer id;
    private User user ;
    private UserAddress userAddress;
    private Date createTime;
    private Double cost ;//总消费
    private String serialNumber;
    private Integer payType ; //支付方式 1表示余额支付 ， 2表示银行转账 ， 3表示货到付款 ， 4表示支付宝  5表示余额不足
    private Integer expressType ;//快递方式 1表示申通快递， 2 表示城际快递 ， 3 表示邮局平邮

    private List<OrderDetail> details ;

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public Integer getExpressType() {
        return expressType;
    }

    public void setExpressType(Integer expressType) {
        this.expressType = expressType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public UserAddress getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(UserAddress userAddress) {
        this.userAddress = userAddress;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public List<OrderDetail> getDetails() {
        return details;
    }

    public void setDetails(List<OrderDetail> details) {
        this.details = details;
    }
}
