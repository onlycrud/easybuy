<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" href="../css/style.css"/>
    <!--[if IE 6]>
    <script src="../js/iepng.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input, a');
    </script>
    <![endif]-->

    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="../js/menu.js"></script>

    <script type="text/javascript" src="../js/n_nav.js"></script>

    <script type="text/javascript" src="../js/select.js"></script>

    <script type="text/javascript" src="../js/num.js">
        var jq = jQuery.noConflict();
    </script>

    <script type="text/javascript" src="../js/shade.js"></script>

    <title>尤洪</title>
    <script type="text/javascript" src="../js/jquery-1.11.1.min_044d0927.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[name=pack]").click(function () {
                var packs = $("[name=pack]");
                for (var i = 0; i < packs.length; i++) {
                    packs[i].checked = false;
                    $(packs[i]).attr("disabled", false);
                    this.checked = true;
                    $(this).attr("disabled", true);
                }
                var elsePay = parseFloat($("#elsePay").html());
                var packPay = $(this).attr("class");
                if (packPay == "yes") {
                    elsePay += 15;
                } else {
                    elsePay -= 15;
                }
                $("#elsePay").html(elsePay);
                var finalPrice = elsePay + ${totalPrice};
                $("#totalPay").html(finalPrice)
            });

            $("[name=ch]").click(function () {
                var ch = $("[name=ch]");
                for (var i = 0; i < ch.length; i++) {
                    ch[i].checked = false;
                    this.checked = true;
                }
            });

            $(".pay li").click(function () {
                var pays = $(".pay li");
                for (var i = 0; i < pays.length; i++) {
                    $(".pay li").attr("class", "");
                    $(this).attr("class", "checked");
                }
            });

            $("[name=wish]").click(function () {
                var wish = $("[name=wish]");
                for (var i = 0; i < wish.length; i++) {
                    wish[i].checked = false;
                    $(wish[i]).attr("disabled", false);
                    this.checked = true;
                    $(this).attr("disabled", true);
                }
                var elsePay = parseFloat($("#elsePay").html());
                var wishPay = $(this).attr("class");
                if (wishPay == "yes") {
                    elsePay += 15;
                } else {
                    elsePay -= 15;
                }
                $("#elsePay").html(elsePay);
                var finalPrice = elsePay + ${totalPrice};
                $("#totalPay").html(finalPrice)

            });
            $("#sure_order").click(function () {
                var elsePay = parseFloat($("#elsePay").html());
                var cost = elsePay + ${totalPrice};
                var pay_id = $(".pay .checked").attr("id");
                var payType;
                if (pay_id == "pay_1") {
                    payType = 1;
                } else if (pay_id == "pay_2") {
                    payType = 2;
                } else if (pay_id == "pay_3") {
                    payType = 3;
                } else if (pay_id == "pay_4") {
                    payType = 4;
                }
                var expressType;
                var express = $("[name=ch][checked=checked]").attr("id");
                if (express == "ch_1") {
                    express = 1;
                } else if (express == "ch_2") {
                    express = 2;
                }else if (express == "ch_3" ){
                    express = 3 ;
                }
                window.location = "buyCar_Three.do?cost=" + cost + "&payType=" + payType + "&expressType=" + expressType;
            })
        })
    </script>
</head>
<body>
<!--Begin Header Begin-->
<%@include file="top.jsp" %>
<!--End Header End-->
<!--Begin Menu Begin-->
<%@include file="menu.jsp" %>
<!--End Menu End-->
<div class="i_bg">
    <div class="content mar_20">
        <img src="../images/img2.jpg"/>
    </div>

    <!--Begin 第二步：确认订单信息 Begin -->
    <div class="content mar_20">
        <div class="two_bg">
            <div class="two_t">
                <span class="fr"><a href="showBuyCar.do">修改</a></span>商品列表
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="car_th" width="550">商品名称</td>
                    <td class="car_th" width="140">单价</td>
                    <td class="car_th" width="150">购买数量</td>
                    <td class="car_th" width="130">小计</td>
                    <td class="car_th" width="140">返还积分</td>
                </tr>
                <c:forEach items="${list}" var="shopping" varStatus="i">
                    <tr>
                        <td>
                            <div class="c_s_img"><img src="../images/${shopping.product.fileName}" width="73"
                                                      height="73"/></div>
                                ${shopping.product.name}
                        </td>
                        <td align="center">￥ &nbsp; <fmt:formatNumber
                                pattern="0.00">${shopping.product.price}</fmt:formatNumber></td>
                        <td align="center">${shopping.productSum}</td>
                        <td align="center" style="color:#ff4e00;">￥ &nbsp; <fmt:formatNumber
                                pattern="0.00">${shopping.product.price * shopping.productSum}</fmt:formatNumber></td>
                        <td align="center"><fmt:formatNumber
                                pattern="0">${shopping.productSum * shopping.product.price / 10}</fmt:formatNumber></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5" align="right" style="font-family:'Microsoft YaHei';">
                        商品总价：￥ &nbsp; <fmt:formatNumber pattern="0.00">${totalPrice}</fmt:formatNumber> ； 返还积分
                        <fmt:formatNumber pattern="0">${totalPrice / 10}</fmt:formatNumber>
                    </td>
                </tr>
            </table>

            <div class="two_t">
                <span class="fr"><a href="changeAddress.do?id=${address.id}">修改</a></span>收货人信息
            </div>
            <table border="0" class="peo_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="p_td" width="160">收货人名称</td>
                    <td width="395">${address.user.userName}</td>
                    <td class="p_td" width="160">电子邮件</td>
                    <td width="395">${address.user.email}</td>
                </tr>
                <tr>
                    <td class="p_td">详细信息</td>
                    <td>${address.address}</td>
                    <td class="p_td">邮政编码</td>
                    <td>6011111</td>
                </tr>
                <tr>
                    <td class="p_td">电话</td>
                    <td></td>
                    <td class="p_td">手机</td>
                    <td>${address.user.mobile}</td>
                </tr>
                <tr>
                    <td class="p_td">标志建筑</td>
                    <td></td>
                    <td class="p_td">最佳送货时间</td>
                    <td><fmt:formatDate value="<%= new Date(System.currentTimeMillis() + 86400 * 1000 * 2)%>"
                                        pattern="MM-dd"/></td>
                </tr>
            </table>


            <div class="two_t">
                配送方式
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="car_th" width="80"></td>
                    <td class="car_th" width="200">名称</td>
                    <td class="car_th" width="370">订购描述</td>
                    <td class="car_th" width="150">费用</td>
                    <td class="car_th" width="135">免费额度</td>
                    <td class="car_th" width="175">保价费用</td>
                </tr>
                <tr>
                    <td align="center"><input type="checkbox" id="ch_1" name="ch" checked="checked"/></td>
                    <td align="center" style="font-size:14px;"><b>申通快递</b></td>
                    <td>江、浙、沪地区首重为15元/KG，其他地区18元/KG，续重均为5-6元/KG， 云南地区为8元</td>
                    <td align="center">￥15.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center">不支持保价</td>
                </tr>
                <tr>
                    <td align="center"><input type="checkbox" id="ch_2" name="ch"/></td>
                    <td align="center" style="font-size:14px;"><b>城际快递</b></td>
                    <td>运费固定</td>
                    <td align="center">￥15.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center">不支持保价</td>
                </tr>
                <tr>
                    <td align="center"><input type="checkbox" id="ch_3" name="ch"/></td>
                    <td align="center" style="font-size:14px;"><b>邮局平邮</b></td>
                    <td>运费固定</td>
                    <td align="center">￥15.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center">不支持保价</td>
                </tr>
                <tr>
                    <td colspan="6">
                        <span class="fr"><label class="r_rad"><input type="checkbox" name="baojia"/></label><label
                                class="r_txt">配送是否需要保价</label></span>
                    </td>
                </tr>
            </table>

            <div class="two_t">
                支付方式
            </div>
            <ul class="pay">
                <li id="pay_1" class="checked">余额支付
                    <div class="ch_img"></div>
                </li>
                <li id="pay_2">银行亏款/转账
                    <div class="ch_img"></div>
                </li>
                <li id="pay_3">货到付款
                    <div class="ch_img"></div>
                </li>
                <li id="pay_4">支付宝
                    <div class="ch_img"></div>
                </li>
            </ul>

            <div class="two_t">
                商品包装
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="car_th" width="80"></td>
                    <td class="car_th" width="490">名称</td>
                    <td class="car_th" width="180">费用</td>
                    <td class="car_th" width="180">免费额度</td>
                    <td class="car_th" width="180">图片</td>
                </tr>
                <tr>
                    <td align="center"><input type="checkbox" class="no" disabled name="pack" checked="checked"/></td>
                    <td><b style="font-size:14px;">不要包装</b></td>
                    <td align="center">￥0.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center"></td>
                </tr>
                <tr>
                    <td align="center"><input type="checkbox" class="yes" name="pack"/></td>
                    <td><b style="font-size:14px;">精品包装</b></td>
                    <td align="center">￥15.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center"><a href="#" style="color:#ff4e00;">查看</a></td>
                </tr>
            </table>

            <div class="two_t">
                祝福贺卡
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="car_th" width="80"></td>
                    <td class="car_th" width="490">名称</td>
                    <td class="car_th" width="180">费用</td>
                    <td class="car_th" width="180">免费额度</td>
                    <td class="car_th" width="180">图片</td>
                </tr>
                <tr>
                    <td align="center"><input type="checkbox" class="no" name="wish" disabled="disabled"
                                              checked="checked"/></td>
                    <td><b style="font-size:14px;">不要贺卡</b></td>
                    <td align="center">￥0.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center"></td>
                </tr>
                <tr>
                    <td align="center" style="border-bottom:0; padding-bottom:0;"><input class="yes" type="checkbox"
                                                                                         name="wish"/>
                    </td>
                    <td style="border-bottom:0; padding-bottom:0;"><b style="font-size:14px;">祝福贺卡</b></td>
                    <td align="center" style="border-bottom:0; padding-bottom:0;">￥15.00</td>
                    <td align="center" style="border-bottom:0; padding-bottom:0;">￥0.00</td>
                    <td align="center" style="border-bottom:0; padding-bottom:0;"><a href="#"
                                                                                     style="color:#ff4e00;">查看</a></td>
                </tr>
                <tr valign="top">
                    <td align="center"></td>
                    <td colspan="4">
                        <span class="fl"><b style="font-size:14px;">祝福语：</b></span>
                        <span class="fl"><textarea class="add_txt" style="width:860px; height:50px;"></textarea></span>
                    </td>
                </tr>
            </table>

            <div class="two_t">
                其他信息
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="145" align="right" style="padding-right:0;"><b style="font-size:14px;">使用红包：</b></td>
                    <td>
                        <span class="fl" style="margin-left:50px; margin-right:10px;">选择已有红包</span>
                        <select class="jj" name="city">
                            <option value="0" selected="selected">请选择</option>
                            <option value="1">50元</option>
                            <option value="2">30元</option>
                            <option value="3">20元</option>
                            <option value="4">10元</option>
                        </select>
                        <span class="fl" style="margin-left:50px; margin-right:10px;">或者输入红包序列号</span>
                        <span class="fl"><input type="text" value="" class="c_ipt" style="width:220px;"/>
                    <span class="fr" style="margin-left:10px;"><input type="submit" value="验证红包" class="btn_tj"/></span>
                    </td>
                </tr>
                <tr valign="top">
                    <td align="right" style="padding-right:0;"><b style="font-size:14px;">订单附言：</b></td>
                    <td style="padding-left:0;"><textarea class="add_txt" style="width:860px; height:50px;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="padding-right:0;"><b style="font-size:14px;">缺货处理：</b></td>
                    <td>
                        <label class="r_rad"><input type="checkbox" name="none" checked="checked"/></label><label
                            class="r_txt" style="margin-right:50px;">等待所有商品备齐后再发</label>
                        <label class="r_rad"><input type="checkbox" name="none"/></label><label class="r_txt"
                                                                                                style="margin-right:50px;">取下订单</label>
                        <label class="r_rad"><input type="checkbox" name="none"/></label><label class="r_txt"
                                                                                                style="margin-right:50px;">与店主协商</label>
                    </td>
                </tr>
            </table>

            <table border="0" style="width:900px; margin-top:20px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="right">
                        该订单完成后，您将获得 <font color="#ff4e00"><fmt:formatNumber
                            pattern="0">${totalPrice / 10}</fmt:formatNumber> </font> 积分 ，以及价值 <font color="#ff4e00">￥0.00</font>
                        的红包 <br/>
                        商品总价: <font color="#ff4e00">￥ <fmt:formatNumber
                            pattern="0.00">${totalPrice}</fmt:formatNumber>
                    </font> + 配送费用和包装费用: <font color="#ff4e00">￥ <span id="elsePay">15.00</span></font>
                    </td>
                </tr>
                <tr height="70">
                    <td align="right">
                        <b style="font-size:14px;">应付款金额：<span id="totalPay" style="font-size:22px; color:#ff4e00;">￥
                            <fmt:formatNumber pattern="0.00">${totalPrice + 15.00}</fmt:formatNumber> </span></b>
                    </td>
                </tr>
                <tr height="70">
                    <td align="right"><a id="sure_order" href="#"><img src="../images/btn_sure.gif"/></a></td>
                </tr>
            </table>


        </div>
    </div>
    <!--End 第二步：确认订单信息 End-->


    <!--Begin Footer Begin -->
    <%@include file="foot.jsp" %>
    <!--End Footer End -->
</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
