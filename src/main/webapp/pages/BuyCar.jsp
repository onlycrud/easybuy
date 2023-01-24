<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="../css/style.css" />
    <!--[if IE 6]>
    <script src="../js/iepng.js" type="text/javascript"></script>
        <script type="text/javascript">
           EvPNG.fix('div, ul, img, li, input, a'); 
        </script>
    <![endif]-->
    
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="../js/menu.js"></script>
                
	<script type="text/javascript" src="../js/n_nav.js"></script>
    
    <script type="text/javascript" src="../js/num.js">
    	var jq = jQuery.noConflict();
    </script>     
    
    <script type="text/javascript" src="../js/shade.js"></script>
    
<title>尤洪</title>
    <script type="text/javascript" src="../js/jquery-1.11.1.min_044d0927.js"></script>
    <script type="text/javascript" >
        $(function(){
            $(".car_ipt").blur(function () {
                var productSum = $(".car_ipt").val();
                if (isNaN(productSum)){
                    alert("请输入数字！");
                    window.location = "showBuyCar.do";
                }
                var id = this.id;
                $.post("changeProductNum.do" , {"newNum":productSum , "productId":id} , function (msg) {
                    alert(msg);
                    window.location = "showBuyCar.do";
                },"text")
            });

            $(".car_btn_1").click(function() {
                var oldSum = $(this).next().val();
                var newNum = parseInt(oldSum) - 1;
                var id =  $(this).next().attr("id") ;
                $.post("changeProductNum.do" , {"newNum":newNum , "productId":id} , function (msg) {
                    alert(msg);
                    window.location = "showBuyCar.do";
                },"text")
            });

             $(".car_btn_2").click(function() {
                 var oldSum = $(this).prev().val();
                 var newNum = parseInt(oldSum) + 1;
                 var id = $(this).prev().attr("id") ;
                 $.post("changeProductNum.do" , {"newNum":newNum , "productId":id} , function (msg) {
                     alert(msg);
                     window.location = "showBuyCar.do";
                 },"text")
             });

            $(".delete").click(function () {
                ShowDiv('MyDiv','fade');
                var productId = $(".delete").attr("id");
                $(".b_sure").attr("href" , "deleteShopping.do?id=" + productId);
            });
        })
    </script>
</head>
<body>  
<!--Begin Header Begin-->
<%@include file="top.jsp"%>
<!--End Header End--> 
<!--Begin Menu Begin-->
<%@include file="menu.jsp"%>
<!--End Menu End--> 
<div class="i_bg">  
    <div class="content mar_20">
    	<img src="../images/img1.jpg" />
    </div>
    
    <!--Begin 第一步：查看购物车 Begin -->
    <div class="content mar_20">
    	<table border="0" class="car_tab" style="width:1200px; margin-bottom:50px;" cellspacing="0" cellpadding="0">
          <tr>
            <td class="car_th" width="490">商品名称</td>
            <td class="car_th" width="140">单价</td>
            <td class="car_th" width="150">购买数量</td>
            <td class="car_th" width="130">小计</td>
            <td class="car_th" width="140">返还积分</td>
            <td class="car_th" width="150">操作</td>
          </tr>
            <c:forEach items="${list}" var="shopping" varStatus="i">
                <tr <c:if test="${i.index mod 2 eq 1 }">class="car_tr"</c:if> >
                    <td>
                        <div class="c_s_img"><img src="../images/${shopping.product.fileName}" width="73" height="73" /></div>
                        ${shopping.product.name}
                    </td>
                    <td align="center">￥ &nbsp; <fmt:formatNumber pattern="0.00">${shopping.product.price}</fmt:formatNumber></td>
                    <td align="center">
                        <div class="c_num">
                            <input type="button" value=""  class="car_btn_1" />
                            <input type="text" value="${shopping.productSum}" id="${shopping.product.id}" name="" class="car_ipt" />
                            <input type="button" value=""  class="car_btn_2" />
                        </div>
                    </td>
                    <td align="center" style="color:#ff4e00;"> <fmt:formatNumber pattern="0.00">${shopping.productSum * shopping.product.price}</fmt:formatNumber></td>
                    <td align="center"><fmt:formatNumber pattern="0">${shopping.productSum * shopping.product.price / 10}</fmt:formatNumber></td>
                    <td align="center"><a class="delete"  id="${shopping.product.id}">删除</a>&nbsp; &nbsp;<a href="#">加入收藏</a></td>
                </tr>
            </c:forEach>

          <tr height="70">
          	<td colspan="6" style="font-family:'Microsoft YaHei'; border-bottom:0;">
            	<label class="r_rad"><input type="checkbox" name="clear" checked="checked" /></label><label class="r_txt">清空购物车</label>
                <span class="fr">商品总价：<b style="font-size:22px; color:#ff4e00;">￥ &nbsp; <fmt:formatNumber pattern="0.00">${totalPrice}</fmt:formatNumber> </b></span>
            </td>
          </tr>
          <tr valign="top" height="150">
          	<td colspan="6" align="right">
            	<a href="Index.do"><img src="../images/buy1.gif" /></a>&nbsp; &nbsp; <a href="buyCarTwo.do"><img src="../images/buy2.gif" /></a>
            </td>
          </tr>
        </table>
        
    </div>
	<!--End 第一步：查看购物车 End-->
    
    <!--Begin 弹出层-删除商品 Begin-->
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">             
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="../images/close.gif" /></span>
            </div>
            <div class="notice_c">
           		
                <table border="0" align="center" style="font-size:16px;" cellspacing="0" cellpadding="0">
                  <tr valign="top">
                    <td>您确定要把该商品移除购物车吗？</td>
                  </tr>
                  <tr height="50" valign="bottom">
                    <td><a href="#" class="b_sure">确定</a><a href="#" onclick="CloseDiv('MyDiv','fade')" class="b_buy">取消</a></td>
                  </tr>
                </table>
                    
            </div>
        </div>
    </div>    
    <!--End 弹出层-删除商品 End-->
    
    
    <!--Begin Footer Begin -->
    <div class="b_btm_bg bg_color">
        <div class="b_btm">
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="../images/b1.png" width="62" height="62" /></td>
                <td><h2>正品保障</h2>正品行货  放心购买</td>
              </tr>
            </table>
			<table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="../images/b2.png" width="62" height="62" /></td>
                <td><h2>满38包邮</h2>满38包邮 免运费</td>
              </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="../images/b3.png" width="62" height="62" /></td>
                <td><h2>天天低价</h2>天天低价 畅选无忧</td>
              </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
              <tr>
                <td width="72"><img src="../images/b4.png" width="62" height="62" /></td>
                <td><h2>准时送达</h2>收货时间由你做主</td>
              </tr>
            </table>
        </div>
    </div>
    <div class="b_nav">
    	<dl>                                                                                            
        	<dt><a href="#">新手上路</a></dt>
            <dd><a href="#">售后流程</a></dd>
            <dd><a href="#">购物流程</a></dd>
            <dd><a href="#">订购方式</a></dd>
            <dd><a href="#">隐私声明</a></dd>
            <dd><a href="#">推荐分享说明</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">配送与支付</a></dt>
            <dd><a href="#">货到付款区域</a></dd>
            <dd><a href="#">配送支付查询</a></dd>
            <dd><a href="#">支付方式说明</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">会员中心</a></dt>
            <dd><a href="#">资金管理</a></dd>
            <dd><a href="#">我的收藏</a></dd>
            <dd><a href="#">我的订单</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">服务保证</a></dt>
            <dd><a href="#">退换货原则</a></dd>
            <dd><a href="#">售后服务保证</a></dd>
            <dd><a href="#">产品质量保证</a></dd>
        </dl>
        <dl>
        	<dt><a href="#">联系我们</a></dt>
            <dd><a href="#">网站故障报告</a></dd>
            <dd><a href="#">购物咨询</a></dd>
            <dd><a href="#">投诉与建议</a></dd>
        </dl>
        <div class="b_tel_bg">
        	<a href="#" class="b_sh1">新浪微博</a>            
        	<a href="#" class="b_sh2">腾讯微博</a>
            <p>
            服务热线：<br />
            <span>400-123-4567</span>
            </p>
        </div>
        <div class="b_er">
            <div class="b_er_c"><img src="../images/er.gif" width="118" height="118" /></div>
            <img src="../images/ss.png" />
        </div>
    </div>    
    <div class="btmbg">
		<div class="btm">
        	备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
            <img src="../images/b_1.gif" width="98" height="33" /><img src="../images/b_2.gif" width="98" height="33" /><img src="../images/b_3.gif" width="98" height="33" /><img src="../images/b_4.gif" width="98" height="33" /><img src="../images/b_5.gif" width="98" height="33" /><img src="../images/b_6.gif" width="98" height="33" />
        </div>    	
    </div>
    <!--End Footer End -->    
</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
