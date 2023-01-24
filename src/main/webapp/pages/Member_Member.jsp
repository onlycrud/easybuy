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
</head>
<body>  
<!--Begin Header Begin-->
<%@include file="top.jsp"%>
<!--End Header End--> 
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
	<div class="m_content">
   		<div class="m_left">
        	<div class="left_n">管理中心</div>
            <div class="left_m">
            	<div class="left_m_t t_bg1">订单中心</div>
                <ul>
                	<li><a href="Member_Order.jsp">我的订单</a></li>
                    <li><a href="Member_Address.jsp">收货地址</a></li>
                    <li><a href="#">缺货登记</a></li>
                    <li><a href="#">跟踪订单</a></li>
                </ul>
            </div>
            <div class="left_m">
            	<div class="left_m_t t_bg2">会员中心</div>
                <ul>
                	<li><a href="Member_User.jsp">用户信息</a></li>
                    <li><a href="Member_Collect.jsp">我的收藏</a></li>
                    <li><a href="Member_Msg.jsp">我的留言</a></li>
                    <li><a href="Member_Links.jsp">推广链接</a></li>
                    <li><a href="#">我的评论</a></li>
                </ul>
            </div>
            <div class="left_m">
            	<div class="left_m_t t_bg3">账户中心</div>
                <ul>
                	<li><a href="Member_Safe.jsp">账户安全</a></li>
                    <li><a href="Member_Packet.jsp">我的红包</a></li>
                    <li><a href="Member_Money.jsp">资金管理</a></li>
                </ul>
            </div>
            <div class="left_m">
            	<div class="left_m_t t_bg4">分销中心</div>
                <ul>
                	<li><a href="Member_Member.jsp" class="now">我的会员</a></li>
                    <li><a href="Member_Results.jsp">我的业绩</a></li>
                    <li><a href="Member_Commission.jsp">我的佣金</a></li>
                    <li><a href="Member_Cash.jsp">申请提现</a></li>
                </ul>
            </div>
        </div>
		<div class="m_right">
            <p></p>		
            
			<div class="mem_tit">
            	我的会员<span class="m_num">共 588人</span>
            </div>
            <ul class="members">
            	<li>
                	<div class="nums">（106）</div>
                    <div class="m_type"><a href="Member_Member_List.jsp">一级会员</a></div>
                </li>
                <li>
                	<div class="nums">（86）</div>
                    <div class="m_type"><a href="#">二级会员</a></div>
                </li>
                <li>
                	<div class="nums">（106）</div>
                    <div class="m_type"><a href="#">三级会员</a></div>
                </li>
                <li>
                	<div class="nums">（106）</div>
                    <div class="m_type"><a href="#">四级会员</a></div>
                </li>
                <li>
                	<div class="nums">（106）</div>
                    <div class="m_type"><a href="#">五级会员</a></div>
                </li>
            </ul>
			


            
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
