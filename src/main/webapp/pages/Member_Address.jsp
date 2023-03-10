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

    <script type="text/javascript" src="../js/select.js"></script>


    <title>尤洪</title>
    <script type="text/javascript">
        $(function () {
            $("#setDefault").click(function () {
                $.get(
                    "setDefaultAddress.do",
                    {"id":${address.id}},
                    function (msg) {
                        alert(msg);
                    }, "text"
                )
            })
        })
    </script>
</head>
<body>
<!--Begin Header Begin-->
<%@include file="top.jsp" %>
<!--End Header End-->
<div class="i_bg bg_color">
    <!--Begin 用户中心 Begin -->
    <div class="m_content">
        <%@include file="m_left.jsp" %>
        <div class="m_right">
            <p></p>
            <div class="mem_tit">收货地址</div>
            <div class="address">
                <div class="a_close"><a href="#"><img src="../images/a_close.png"/></a></div>
                <table border="0" class="add_t" align="center" style="width:98%; margin:10px auto;" cellspacing="0"
                       cellpadding="0">
                    <tr>
                        <td colspan="2" style="font-size:14px; color:#ff4e00;">${address.remark}</td>
                    </tr>
                    <tr>
                        <td align="right" width="80">收货人姓名：</td>
                        <td>${address.user.userName}</td>
                    </tr>
                    <tr>
                        <td align="right">配送区域：</td>
                        <td>${address.address}</td>
                    </tr>
                    <tr>
                        <td align="right">详细地址：</td>
                        <td>${address.address}</td>
                    </tr>
                    <tr>
                        <td align="right">手机：</td>
                        <td>${address.user.mobile}</td>
                    </tr>
                    <tr>
                        <td align="right">电话：</td>
                        <td>${address.user.mobile}</td>
                    </tr>
                    <tr>
                        <td align="right">电子邮箱：</td>
                        <td>${address.user.email}</td>
                    </tr>
                    <tr>
                        <td align="right">标志建筑：</td>
                        <td></td>
                    </tr>
                </table>

                <p align="right">
                    <a href="#" id="setDefault" style="color:#ff4e00;">设为默认</a>&nbsp;
                    &nbsp; &nbsp; &nbsp; <a href="#" style="color:#ff4e00;">编辑</a>&nbsp; &nbsp; &nbsp; &nbsp;
                </p>

            </div>

            <div class="mem_tit">
                <a href="#"><img src="../images/add_ad.gif"/></a>
            </div>
            <table border="0" class="add_tab" style="width:930px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="135" align="right">配送地区</td>
                    <td colspan="3" style="font-family:'宋体';">
                        <select class="jj" name="country" style="background-color:#f6f6f6;">
                            <option value="0" selected="selected">请选择...</option>
                            <option value="1">中国</option>
                            <option value="2">中国</option>
                            <option value="3">中国</option>
                            <option value="4">中国</option>
                        </select>
                        <select class="jj" name="province">
                            <option value="0" selected="selected">请选择...</option>
                            <option value="1">四川</option>
                            <option value="2">重庆</option>
                            <option value="3">北京</option>
                            <option value="4">云南</option>
                        </select>
                        <select class="jj" name="city">
                            <option value="0" selected="selected">请选择...</option>
                            <option value="1">成都</option>
                            <option value="2">宜宾</option>
                            <option value="3">南充</option>
                            <option value="4">绵阳</option>
                        </select>
                        <select class="jj" name="area">
                            <option value="0" selected="selected">请选择...</option>
                            <option value="1">武侯区</option>
                            <option value="2">成华区</option>
                            <option value="3">锦江区</option>
                            <option value="4">青羊区</option>
                        </select>
                        （必填）
                    </td>
                </tr>
                <tr>
                    <td align="right">收货人姓名</td>
                    <td style="font-family:'宋体';"><input type="text" value="姓名" class="add_ipt"/>（必填）</td>
                    <td align="right">电子邮箱</td>
                    <td style="font-family:'宋体';"><input type="text" value="12345678@qq.com" class="add_ipt"/>（必填）</td>
                </tr>
                <tr>
                    <td align="right">详细地址</td>
                    <td style="font-family:'宋体';"><input type="text" value="世外桃源" class="add_ipt"/>（必填）</td>
                    <td align="right">邮政编码</td>
                    <td style="font-family:'宋体';"><input type="text" value="610000" class="add_ipt"/></td>
                </tr>
                <tr>
                    <td align="right">手机</td>
                    <td style="font-family:'宋体';"><input type="text" value="1361234587" class="add_ipt"/>（必填）</td>
                    <td align="right">电话</td>
                    <td style="font-family:'宋体';"><input type="text" value="028-12345678" class="add_ipt"/></td>
                </tr>
                <tr>
                    <td align="right">标志建筑</td>
                    <td style="font-family:'宋体';"><input type="text" value="世外桃源大酒店" class="add_ipt"/></td>
                    <td align="right">最佳送货时间</td>
                    <td style="font-family:'宋体';"><input type="text" value="" class="add_ipt"/></td>
                </tr>
            </table>
            <p align="right">
                <a href="#">删除</a>&nbsp; &nbsp; <a href="#" class="add_b">确认修改</a>
            </p>


        </div>
    </div>
    <!--End 用户中心 End-->
    <!--Begin Footer Begin -->
    <%@include file="foot.jsp" %>
    <!--End Footer End -->
</div>

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
