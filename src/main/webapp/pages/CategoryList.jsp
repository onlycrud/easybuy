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

    <script type="text/javascript" src="../js/lrscroll_1.js"></script>


    <script type="text/javascript" src="../js/n_nav.js"></script>

    <script type="text/javascript" src="../js/jquery-1.11.1.min_044d0927.js"></script>

    <script type="text/javascript">

        function deleteAllCollection() {
            if (confirm("是否要清空收藏夹？")){
                $.post("deleteAllCollection.do" , {"userId":${sessionScope.user.id}} , function (result) {
                    alert(result);
                    window.location.reload()
                })
            }
        }

        $(function () {
            function go(newPageNum) {
                document.getElementById("search_pageNum").value = newPageNum;
                document.getElementById("search").onsubmit
            }


            $(".img").click(function () {
                var id = $(this).attr("id");
                window.location="showProduct.do?id="+ id ;
            })
        })
    </script>
    <title>尤洪</title>
</head>
<body>
<!--Begin Header Begin-->
<%@include file="top.jsp" %>
<!--End Header End-->
<!--Begin Menu Begin-->
<%@include file="menu.jsp" %>
<!--End Menu End-->
<div class="i_bg">
    <c:if test="${page.type==1}">
        <div class="postion">
            <span class="fl">全部 > ${category1.name} > ${category2.name} > </span>
            <span class="n_ch">
            <span class="fl">分类：<font>${category3.name}</font></span>
            <a href="#"><img src="../images/s_close.gif"/></a>
        </span>
        </div>
        <!--Begin 筛选条件 Begin-->
        <div class="content mar_10">
            <table border="0" class="choice" style="width:100%; font-family:'宋体'; margin:0 auto;" cellspacing="0"
                   cellpadding="0">
                <tr valign="top">
                    <td width="70">&nbsp; 品牌：</td>
                    <td class="td_a"><a href="#" class="now">香奈儿（Chanel）</a><a href="#">迪奥（Dior）</a><a href="#">范思哲（VERSACE）</a><a
                            href="#">菲拉格慕（Ferragamo）</a><a href="#">兰蔻（LANCOME）</a><a href="#">爱马仕（HERMES）</a><a
                            href="#">卡文克莱（Calvin Klein）</a><a href="#">古驰（GUCCI）</a><a href="#">宝格丽（BVLGARI）</a><a
                            href="#">阿迪达斯（Adidas）</a><a href="#">卡尔文·克莱恩（CK）</a><a href="#">凌仕（LYNX）</a><a href="#">大卫杜夫（Davidoff）</a><a
                            href="#">安娜苏（Anna sui）</a><a href="#">阿玛尼（ARMANI）</a><a href="#">娇兰（Guerlain）</a></td>
                </tr>
                <tr valign="top">
                    <td>&nbsp; 价格：</td>
                    <td class="td_a"><a href="#">0-199</a><a href="#" class="now">200-399</a><a href="#">400-599</a><a
                            href="#">600-899</a><a href="#">900-1299</a><a href="#">1300-1399</a><a href="#">1400以上</a>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp; 类型：</td>
                    <td class="td_a"><a href="#">女士香水</a><a href="#">男士香水</a><a href="#">Q版香水</a><a href="#">组合套装</a><a
                            href="#">香体走珠</a><a href="#">其它</a></td>
                </tr>
                <tr>
                    <td>&nbsp; 香型：</td>
                    <td class="td_a"><a href="#">浓香水</a><a href="#">香精Parfum香水</a><a href="#">淡香精EDP淡香水</a><a href="#">香露EDT</a><a
                            href="#">古龙水</a><a href="#">其它</a></td>
                </tr>
            </table>
        </div>
        <!--End 筛选条件 End-->
    </c:if>

    <div class="content mar_20">
        <div class="l_history">
            <div class="his_t">
                <span class="fl">我的收藏</span>
                <span class="fr"><a onclick="deleteAllCollection(${sessionScope.user.id})">清空</a></span>
            </div>
            <ul>
                <c:forEach items="#{sessionScope.collection}" var="collection">
                    <li>
                        <div class="img" id="${collection.product.id}"><a href="#"><img src="../images/${collection.product.fileName}" width="185"
                                                          height="162"/></a></div>
                        <div class="name"><a href="#">${collection.product.name}</a></div>
                        <div class="price">
                            <font>￥<span>${collection.product.price}</span></font> &nbsp; <fmt:formatNumber
                                pattern="0">${collection.product.price / 10}</fmt:formatNumber> R
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="l_list">
            <div class="list_t">
            	<span class="fl list_or">
                	<a href="#" class="now">默认</a>
                    <a href="#">
                    	<span class="fl">销量</span>                        
                        <span class="i_up">销量从低到高显示</span>
                        <span class="i_down">销量从高到低显示</span>                                                     
                    </a>
                    <a href="#">
                    	<span class="fl">价格</span>                        
                        <span class="i_up">价格从低到高显示</span>
                        <span class="i_down">价格从高到低显示</span>     
                    </a>
                    <a href="#">新品</a>
                </span>
                <span class="fr">共发现${page.totalCount}件</span>
            </div>
            <div class="list_c">

                <ul class="cate_list">
                    <c:forEach items="${page.list}" var="product" varStatus="i">
                        <li>
                            <div class="img" id="${product.id}"><a href="#"><img src="../images/${product.fileName}" width="210"
                                                              height="185"/></a></div>
                            <div class="price">
                                <font>￥<span><fmt:formatNumber
                                        pattern="0.00">${product.price}</fmt:formatNumber> </span></font> &nbsp;
                                <fmt:formatNumber pattern="0">${product.price / 10}</fmt:formatNumber>
                            </div>
                            <div class="name"><a href="#">${product.name}</a></div>
                            <div class="carbg">
                                <a href="#" class="ss">收藏</a>
                                <a href="#" class="j_car">加入购物车</a>
                            </div>
                        </li>
                    </c:forEach>

                </ul>

                <div class="pages">
                    <c:if test="${page.pageNum > 1 }">
                        <a href="" onclick="go(${page.pageNum - 1})" class="p_pre">上一页</a>
                    </c:if>
                    <c:forEach begin="1" end="${page.totalPage}" varStatus="i">
                        <c:if test="${i.index == page.pageNum}">
                            <a href="#" class="cur">${i.index}</a>
                        </c:if>
                        <c:if test="${i.index != page.pageNum}">
                            <a href="#" onclick="go(${i.index})">${i.index}</a>
                        </c:if>
                    </c:forEach>
                    <c:if test="${page.pageNum < page.totalPage}">
                        <a href="#" onclick="go(${page.pageNum + 1})" class="p_pre">下一页</a>
                    </c:if>
                </div>


            </div>
        </div>
    </div>

    <!--Begin Footer Begin -->
    <%@include file="foot.jsp" %>
    <!--End Footer End -->
</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
