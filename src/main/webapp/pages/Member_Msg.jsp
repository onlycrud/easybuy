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
                    <li><a href="Member_Msg.jsp" class="now">我的留言</a></li>
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
                	<li><a href="Member_Member.jsp">我的会员</a></li>
                    <li><a href="Member_Results.jsp">我的业绩</a></li>
                    <li><a href="Member_Commission.jsp">我的佣金</a></li>
                    <li><a href="Member_Cash.jsp">申请提现</a></li>
                </ul>
            </div>
        </div>
		<div class="m_right">
            <p></p>
            <div class="mem_tit">我的留言</div>
           	<form>
            <table border="0" style="width:880px; margin-top:20px;"  cellspacing="0" cellpadding="0">
              <tr height="45">
                <td width="80" align="right">留言类型 &nbsp; &nbsp;</td>
                <td>                            
                	<label class="r_rad"><input type="checkbox" name="type" checked="checked" /></label><label class="r_txt">留言</label>
                    <label class="r_rad"><input type="checkbox" name="type" /></label><label class="r_txt">投诉</label>
                    <label class="r_rad"><input type="checkbox" name="type" /></label><label class="r_txt">询问</label>
                    <label class="r_rad"><input type="checkbox" name="type" /></label><label class="r_txt">售后</label>
                    <label class="r_rad"><input type="checkbox" name="type" /></label><label class="r_txt">求购</label>
                </td>
              </tr>
              <tr height="45">
                <td align="right">主题 &nbsp; &nbsp;</td>
                <td><input type="text" value="" class="add_ipt" style="width:290px;" /></td>
              </tr>
              <tr valign="top" height="110">
                <td align="right">留言内容 &nbsp; &nbsp;</td>
                <td style="padding-top:5px;"><textarea class="add_txt"></textarea></td>
              </tr>
              <tr height="45">
                <td align="right">上传文件 &nbsp; &nbsp;</td>
                <td><input type="file" /></td>
              </tr>
              <tr height="50">
                <td>&nbsp;</td>
                <td style="line-height:20px;">
                	<font color="#ff4e00">小提示：</font><br />
                    您可以上传以下格式的文件：gif、jpg、png、word、excel、txt、zip、ppt、pdf
                </td>
              </tr>
              <tr height="50" valign="bottom">
                <td>&nbsp;</td>
                <td><input type="submit" value="提交" class="btn_tj" /></td>
              </tr>
            </table>
            </form>







            
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
