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
    <script type="text/javascript" src="../js/jquery-1.11.1.min_044d0927.js"></script>
    <script type="text/javascript" src="../js/jquery.bxslider_e88acd1b.js"></script>

    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="../js/menu.js"></script>

    <script type="text/javascript" src="../js/select.js"></script>

    <script type="text/javascript" src="../js/lrscroll.js"></script>

    <script type="text/javascript" src="../js/iban.js"></script>
    <script type="text/javascript" src="../js/fban.js"></script>
    <script type="text/javascript" src="../js/f_ban.js"></script>
    <script type="text/javascript" src="../js/mban.js"></script>
    <script type="text/javascript" src="../js/bban.js"></script>
    <script type="text/javascript" src="../js/hban.js"></script>
    <script type="text/javascript" src="../js/tban.js"></script>

    <script type="text/javascript" src="../js/lrscroll_1.js"></script>


    <title>尤洪</title>
    <script type="text/javascript">
        $(function () {

            $("#submit").click(function () {
                $("#msg").html("");
                var loginName = $("#loginName").val();
                if (loginName == null || loginName == '') {
                    $("#msg").html("用户名不能为空！");
                    return false;
                }
                $.post("findUser.do", {"loginName": loginName}, function (result) {
                    if (result == "true") {
                        $("#msg").html("该用户名已被占用！");
                        return false ;
                    }
                }, "text");

                var userName = $("#userName").val();
                if (userName == null || userName == '') {
                    $("#msg").html("姓名不能为空！");
                    return false ;
                }

                var password = $("#password").val();
                if (password == null || password == '') {
                    $("#msg").html("密码不能为空！");
                    return false;
                }

                var rePassword = $("#rePassword").val();
                if (rePassword == null || rePassword == '' || rePassword != password) {
                    $("#msg").html("两次密码输入不一致！");
                    return false;
                }

                var email = $("#email").val();
                if (email == null || email == '') {
                    $("#msg").html("邮箱地址不能为空！");
                    return false;
                }

                var mobile = $("#mobile").val();
                if (mobile == null || mobile == '') {
                    $("#msg").html("手机号码不能为空！");
                    return false ;
                }
                var agree = $("#agree").prop("checked");
                if (agree == false) {
                    alert("请先阅读并勾选用户协议！");
                    return false;
                }
                var msg = $("#msg").html();
                if (msg != "") {
                    // alert(123);
                    return false;
                }
                return true ;

            });

        })
    </script>
</head>
<body>
<!--Begin Header Begin-->
<div class="soubg">
    <div class="sou">
        <span class="fr">
        	<span class="fl">你好，请<a href="TestLogin.do">登录</a>&nbsp; <a href="TestRegister.do" style="color:#ff4e00;">免费注册</a>&nbsp; </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="../images/s_tel.png" align="absmiddle"/></a></span>
        </span>
    </div>
</div>
<!--End Header End-->
<!--Begin Login Begin-->
<div class="log_bg">
    <div class="top">
        <div class="logo"><a href="Index.do"><img src="../images/logo.png"/></a></div>
    </div>
    <div class="regist">
        <div class="log_img"><img src="../images/l_img.png" width="611" height="425"/></div>
        <div class="reg_c">
            <form id="form" action="Register.do" method="post">
                <table border="0" style="width:420px; font-size:14px; margin-top:20px;" cellspacing="0" cellpadding="0">
                    <tr height="50" valign="top">
                        <td width="95">&nbsp;</td>
                        <td>
                            <span class="fl" style="font-size:24px;">注册</span>
                            <span class="fr">已有商城账号，<a href="TestLogin.do" style="color:#ff4e00;">我要登录</a></span>
                        </td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;用户名 &nbsp;</td>
                        <td><input type="text" value="" id="loginName" name="loginName" class="l_user"/></td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;姓名 &nbsp;</td>
                        <td><input type="text" value="" id="userName" name="userName" class="l_user"/></td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;密码 &nbsp;</td>
                        <td><input type="password" value="" id="password" name="password" class="l_pwd"/></td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码 &nbsp;</td>
                        <td><input type="password" value="" id="rePassword" class="l_pwd"/></td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;邮箱 &nbsp;</td>
                        <td><input type="text" value="" id="email" name="email" class="l_email"/></td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;手机 &nbsp;</td>
                        <td><input type="text" value="" id="mobile" name="mobile" class="l_tel"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><span id="msg"></span></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
                    	<label class="r_rad"><input type="checkbox" id="agree" name="agree"/></label><label
                            class="r_txt">我已阅读并接受《用户协议》</label>
                    </span>
                        </td>
                    </tr>
                    <tr height="60">
                        <td>&nbsp;</td>
                        <td><input type="submit" value="立即注册" id="submit" class="log_btn"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<!--End Login End-->
<!--Begin Footer Begin-->
<div class="btmbg">
    <div class="btm">
        备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical
        Support: Dgg Group <br/>
        <img src="../images/b_1.gif" width="98" height="33"/><img src="../images/b_2.gif" width="98" height="33"/><img
            src="../images/b_3.gif" width="98" height="33"/><img src="../images/b_4.gif" width="98" height="33"/><img
            src="../images/b_5.gif" width="98" height="33"/><img src="../images/b_6.gif" width="98" height="33"/>
    </div>
</div>
<!--End Footer End -->

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
