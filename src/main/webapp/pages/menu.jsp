<%--
  Created by IntelliJ IDEA.
  User: 19565
  Date: 2023/1/12
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="menu_bg">
    <div class="menu">
        <!--Begin 商品分类详情 Begin-->
        <div class="nav">
            <div class="nav_t">全部商品分类</div>
            <div class="leftNav none">
                <ul>
                    <c:forEach items="${sessionScope.levelOne}" var="productCategory" varStatus="i">
                        <li>
                            <div class="fj">
                                <span class="n_img"><span></span><img src="../images/nav${i.index + 1}.png" /></span>
                                <span class="fl">${productCategory.name}</span>
                            </div>
                            <div class="zj">
                                <div class="zj_l">
                                    <c:forEach items="${sessionScope.levelTwo}" var="p2" varStatus="i">
                                        <c:if test="${p2.parentId==productCategory.categoryId}">
                                            <div class="zj_l_c">
                                                <h2>${p2.name}</h2>
                                                <c:forEach items="${sessionScope.levelThree}" var="p3" varStatus="i">
                                                    <c:if test="${p3.parentId==p2.categoryId}">
                                                        <a href="searchByCategory.do?id=${p3.categoryId}&pageNum=1">${p3.name}</a>|
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <div class="zj_r">
                                    <a href="#"><img src="../images/n_img1.jpg" width="236" height="200" /></a>
                                    <a href="#"><img src="../images/n_img2.jpg" width="236" height="200" /></a>
                                </div>
                            </div>
                        </li>
                    </c:forEach>

                </ul>
            </div>
        </div>
        <!--End 商品分类详情 End-->
        <ul class="menu_r">
            <li><a href="Index.do">首页</a></li>
            <li><a href="search.do">美食</a></li>
            <li><a href="search.do">生鲜</a></li>
            <li><a href="search.do">家居</a></li>
            <li><a href="search.do">女装</a></li>
            <li><a href="search.do">美妆</a></li>
            <li><a href="search.do">数码</a></li>
            <li><a href="search.do">团购</a></li>
        </ul>
        <div class="m_ad">中秋送好礼！</div>
    </div>
</div>