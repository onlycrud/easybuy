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

    <script type="text/javascript" src="../js/select.js"></script>


    <title>尤洪</title>
    <script type="text/javascript" src="../js/jquery-1.11.1.min_044d0927.js"></script>

</head>
<body>
<!--Begin Header Begin-->
<%@include file="top.jsp"%>
<!--End Header End-->
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
    <div class="m_content">
        <%@include file="m_left.jsp"%>
        <div class="m_right">
            <p></p>
            <div class="mem_tit">全部新闻</div>
            <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">

                <tr>
                    <td width="50%"><a href="showNews.do?id=">文章标题</a></td>
                    <td width="50%">创建时间</td>
                </tr>
                <c:forEach items="${page.list}" var="news" >
                    <tr>
                        <td width="50%"><a href="showNews.do?id=${news.id}">${news.title}</a></td>
                        <td width="50%"><fmt:formatDate value="${news.createTime}" pattern="yyyy-MM-dd"></fmt:formatDate> </td>
                    </tr>
                </c:forEach>

            </table>


            <div class="pages">
                <c:if test="${page.pageNum > 1 }">
                    <a href="allNews.do?pageNum=${page.pageNum-1}" class="p_pre">上一页</a>
                </c:if>
                <c:forEach begin="1" end="${page.totalPage}" varStatus="i">
                    <c:if test="${i == page.pageNum}">
                        <a href="#" class="cur">${i}</a>
                    </c:if>
                    <c:if test="${i != page.pageNum}">
                        <a href="allNews.do?pageNum=${i}" >${i}</a>
                    </c:if>
                </c:forEach>
                <c:if test="${page.pageNum < page.totalPage}">
                    <a href="allNews.do?pageNum=${page.pageNum+1}" class="p_pre">下一页</a>
                </c:if>
            </div>



        </div>
    </div>
    <!--End 用户中心 End-->
    <!--Begin Footer Begin -->
    <%@include file="foot.jsp"%>
    <!--End Footer End -->
</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
