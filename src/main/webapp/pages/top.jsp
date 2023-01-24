<%--
  Created by IntelliJ IDEA.
  User: 19565
  Date: 2023/1/9
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="soubg">
    <div class="sou">
        <!--Begin 所在收货地区 Begin-->
        <span class="s_city_b">
        	<span class="fl">送货至：</span>
            <span class="s_city">
            	<span>四川</span>
                <div class="s_city_bg">
                	<div class="s_city_t"></div>
                    <div class="s_city_c">
                    	<h2>请选择所在的收货地区</h2>
                        <table border="0" class="c_tab" style="width:235px; margin-top:10px;" cellspacing="0"
                               cellpadding="0">
                          <tr>
                            <th>A</th>
                            <td class="c_h"><span>安徽</span><span>澳门</span></td>
                          </tr>
                          <tr>
                            <th>B</th>
                            <td class="c_h"><span>北京</span></td>
                          </tr>
                          <tr>
                            <th>C</th>
                            <td class="c_h"><span>重庆</span></td>
                          </tr>
                          <tr>
                            <th>F</th>
                            <td class="c_h"><span>福建</span></td>
                          </tr>
                          <tr>
                            <th>G</th>
                            <td class="c_h"><span>广东</span><span>广西</span><span>贵州</span><span>甘肃</span></td>
                          </tr>
                          <tr>
                            <th>H</th>
                            <td class="c_h"><span>河北</span><span>河南</span><span>黑龙江</span><span>海南</span><span>湖北</span><span>湖南</span></td>
                          </tr>
                          <tr>
                            <th>J</th>
                            <td class="c_h"><span>江苏</span><span>吉林</span><span>江西</span></td>
                          </tr>
                          <tr>
                            <th>L</th>
                            <td class="c_h"><span>辽宁</span></td>
                          </tr>
                          <tr>
                            <th>N</th>
                            <td class="c_h"><span>内蒙古</span><span>宁夏</span></td>
                          </tr>
                          <tr>
                            <th>Q</th>
                            <td class="c_h"><span>青海</span></td>
                          </tr>
                          <tr>
                            <th>S</th>
                            <td class="c_h"><span>上海</span><span>山东</span><span>山西</span><span class="c_check">四川</span><span>陕西</span></td>
                          </tr>
                          <tr>
                            <th>T</th>
                            <td class="c_h"><span>台湾</span><span>天津</span></td>
                          </tr>
                          <tr>
                            <th>X</th>
                            <td class="c_h"><span>西藏</span><span>香港</span><span>新疆</span></td>
                          </tr>
                          <tr>
                            <th>Y</th>
                            <td class="c_h"><span>云南</span></td>
                          </tr>
                          <tr>
                            <th>Z</th>
                            <td class="c_h"><span>浙江</span></td>
                          </tr>
                        </table>
                    </div>
                </div>
            </span>
        </span>
        <!--End 所在收货地区 End-->
        <span class="fr">
        	<span class="fl">
                <c:if test="${sessionScope.user==null}">
                    你好，请
                    <a href="TestLogin.do">登录</a>&nbsp;
                    <a href="TestRegister.do" style="color:#ff4e00;">免费注册</a>&nbsp;|&nbsp;
                </c:if>
                <c:if test="${sessionScope.user!=null}">
                    欢迎 ${sessionScope.user.loginName} 用户！
                    <a href="Index.do">主页</a>&nbsp;|&nbsp;
                </c:if>
                <a href="#">我的订单</a>&nbsp;|
            </span>
        	<span class="ss">
            	<div class="ss_list">
                	<a href="#">收藏夹</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">我的收藏夹</a></li>
                                <li><a href="#">我的收藏夹</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="ss_list">
                	<a href="#">客户服务</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">客户服务</a></li>
                                <li><a href="#">客户服务</a></li>
                                <li><a href="#">客户服务</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="ss_list">
                	<a href="#">网站导航</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">网站导航</a></li>
                                <li><a href="#">网站导航</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="../images/s_tel.png" align="absmiddle"/></a></span>
        </span>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("#search_btn").click(function () {
            var name = $("#search_name").val();
            if (name == null || name == '') {
                return false;
            }else{
                return true ;
            }
        })
    })
</script>
<div class="top">
    <div class="logo"><a href="Index.jsp"><img src="../images/logo.png"/></a></div>
    <div class="search">
        <form id="search" method="get" action="search.do">
            <input type="hidden" id="search_pageNum" name="pageNum" value="1"  />
            <input type="text" id="search_name" value="${name}" name="name" class="s_ipt"/>
            <input type="submit" id="search_btn" value="搜索" class="s_btn"/>
        </form>
        <span class="fl">
            <a href="search.do?name=咖啡&pageNum=1">咖啡</a>
            <a href="search.do?name=iphone6S&pageNum=1">iphone 6S</a>
            <a href="search.do?name=新鲜美食&pageNum=1">新鲜美食</a>
            <a href="search.do?name=蛋糕&pageNum=1">蛋糕</a>
            <a href="search.do?name=日用品&pageNum=1">日用品</a>
            <a href="search.do?name=连衣裙&pageNum=1">连衣裙</a>
        </span>
    </div>
    <div class="i_car">
        <div class="car_t" id="car" onclick="window.location.href='showBuyCar.do'">购物车 [
            <span>${sessionScope.shoppingCount}</span> ]
        </div>
        <div class="car_bg">
            <!--Begin 购物车未登录 Begin-->
            <c:if test="${sessionScope.user == null}">
                <div class="un_login">还未登录！<a href="TestLogin.do" style="color:#ff4e00;">马上登录</a> 查看购物车！</div>
            </c:if>
            <!--End 购物车未登录 End-->
            <!--Begin 购物车已登录 Begin-->
            <c:if test="${sessionScope.user != null}">
                <ul class="cars">
                    <c:forEach items="${sessionScope.user.shoppings}" var="shopping">
                        <li>
                            <div class="img"><a href="#"><img src="../images/${shopping.product.fileName}" width="58"
                                                              height="58"/></a></div>
                            <div class="name"><a href="#">${shopping.product.name}</a></div>
                            <div class="price"><font color="#ff4e00">￥<fmt:formatNumber
                                    pattern="0.00">${shopping.product.price}</fmt:formatNumber> </font>
                                X ${shopping.productSum}</div>
                        </li>
                    </c:forEach>
                </ul>
                <div class="price_sum">共计&nbsp;
                    <font color="#ff4e00">
                        ￥ ${sessionScope.totalPrice}
                    </font>
                    <span>
                    </span>
                </div>
                <div class="price_a"><a href="showBuyCar.do">去购物车结算</a></div>
            </c:if>
            <!--End 购物车已登录 End-->
        </div>
    </div>
</div>
