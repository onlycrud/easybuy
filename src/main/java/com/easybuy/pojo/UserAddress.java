package com.easybuy.pojo;

import java.util.Date;

/**
 * author: 刘韧
 * date: 2023/1/10
 * version: 1.0
 */
public class UserAddress {
    private Integer id;
    private User user;
    private String address ;
    private Date createTime ;
    private Integer isDefault ; // 1代表默认地址 0代表不是默认
    private String remark ;

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
    }

    public String getRemark() {
        return remark;
    }

    @Override
    public String toString() {
        return "UserAddress{" +
                "id=" + id +
                ", user=" + user +
                ", address='" + address + '\'' +
                ", createTime=" + createTime +
                ", isDefault=" + isDefault +
                ", remark='" + remark + '\'' +
                '}';
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}
