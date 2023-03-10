<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" href="../css/style.css"/>
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <!--[if IE 6]>
    <script src="../js/iepng.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input, a');
    </script>
    <![endif]-->

    <script type="text/javascript" src="../js/menu.js"></script>

    <script type="text/javascript" src="../js/lrscroll_1.js"></script>


    <script type="text/javascript" src="../js/n_nav.js"></script>

    <link rel="stylesheet" type="text/css" href="../css/ShopShow.css"/>
    <link rel="stylesheet" type="text/css" href="../css/MagicZoom.css"/>
    <script type="text/javascript" src="../js/MagicZoom.js"></script>

    <script type="text/javascript" src="../js/num.js">
        var jq = jQuery.noConflict();
    </script>

    <script type="text/javascript" src="../js/p_tab.js"></script>


    <script type="text/javascript" src="../js/shade.js"></script>
    <script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#addShopping").click(function () {
                var num = $("#num").val();
                ShowDiv_1('MyDiv1', 'fade1');
                $.get("addShopping.do", {"num": num,"productId":${product.id}}, function (result) {
                    // CloseDiv_1('MyDiv1', 'fade1');
                })
            });
            $("#collection_b_sure").click(function () {

                $.get("addCollection.do", {"productId":${product.id}}, function (result) {
                    if (result == "success") {
                        CloseDiv('MyDiv', 'fade');
                        return true;
                    } else {
                        CloseDiv('MyDiv', 'fade');
                        return false
                    }
                })
            })

        })
    </script>
    <title>??????</title>
</head>
<body>
<!--Begin Header Begin-->
<%@include file="top.jsp" %>
<!--End Header End-->
<!--Begin Menu Begin-->
<%@ include file="menu.jsp" %>
<!--End Menu End-->
<div class="i_bg">
    <div class="postion">
        <span class="fl">?????? > ???????????? > ?????? > ?????? > ??????????????????</span>
    </div>
    <div class="content">

        <div id="tsShopContainer">
            <div id="tsImgS"><a href="../images/${product.fileName}" title="Images" class="MagicZoom"
                                id="MagicZoom"><img
                    src="../images/${product.fileName}" width="390" height="390"/></a></div>
            <div id="tsPicContainer">
                <div id="tsImgSArrL" onclick="tsScrollArrLeft()"></div>
                <div id="tsImgSCon">
                    <ul>
                        <li onclick="showPic(0)" rel="MagicZoom" class="tsSelectImg"><img
                                src="../images/${product.fileName}" tsImgS="../images/${product.fileName}" width="79"
                                height="79"/></li>
                    </ul>
                </div>
                <div id="tsImgSArrR" onclick="tsScrollArrRight()"></div>
            </div>
            <img class="MagicZoomLoading" width="16" height="16" src="../images/loading.gif" alt="Loading..."/>
        </div>

        <div class="pro_des">
            <div class="des_name">
                <p>${product.name}</p>
                ??????????????????????????????????????????????????????????????????????????????
            </div>
            <div class="des_price">
                ???????????????<b>???${product.price}</b><br/>
                ???????????????<span><fmt:formatNumber pattern="0">${product.price / 10}</fmt:formatNumber> R</span>
            </div>
            <div class="des_choice">
                <span class="fl">???????????????</span>
                <ul>
                    <li class="checked">30ml
                        <div class="ch_img"></div>
                    </li>
                    <li>50ml
                        <div class="ch_img"></div>
                    </li>
                    <li>100ml
                        <div class="ch_img"></div>
                    </li>
                </ul>
            </div>
            <div class="des_choice">
                <span class="fl">???????????????</span>
                <ul>
                    <li>??????
                        <div class="ch_img"></div>
                    </li>
                    <li class="checked">??????
                        <div class="ch_img"></div>
                    </li>
                    <li>??????
                        <div class="ch_img"></div>
                    </li>
                </ul>
            </div>
            <div class="des_share">
                <div class="d_sh">
                    ??????
                    <div class="d_sh_bg">
                        <a href="#"><img src="../images/sh_1.gif"/></a>
                        <a href="#"><img src="../images/sh_2.gif"/></a>
                        <a href="#"><img src="../images/sh_3.gif"/></a>
                        <a href="#"><img src="../images/sh_4.gif"/></a>
                        <a href="#"><img src="../images/sh_5.gif"/></a>
                    </div>
                </div>
                <div class="d_care"><a id="addCollection" onclick="ShowDiv('MyDiv','fade')">????????????</a></div>
            </div>
            <div class="des_join">
                <div class="j_nums">
                    <input id="num" type="text" value="1" name="" class="n_ipt"/>
                    <input type="button" value="" onclick="addUpdate(jq(this));" class="n_btn_1"/>
                    <input type="button" value="" onclick="jianUpdate(jq(this));" class="n_btn_2"/>
                </div>
                <span class="fl"><a id="addShopping"><img
                        src="../images/j_car.png"/></a></span>
            </div>
        </div>

        <div class="s_brand">
            <div class="s_brand_img"><img src="../images/sbrand.jpg" width="188" height="132"/></div>
            <div class="s_brand_c"><a href="#">??????????????????</a></div>
        </div>


    </div>
    <div class="content mar_20">
        <div class="l_history">
            <div class="fav_t">???????????????</div>
            <ul>
                <li>
                    <div class="img"><a href="#"><img src="../images/his_1.jpg" width="185" height="162"/></a></div>
                    <div class="name"><a href="#">Dior/????????????2?????????</a></div>
                    <div class="price">
                        <font>???<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="../images/his_2.jpg" width="185" height="162"/></a></div>
                    <div class="name"><a href="#">Dior/????????????2?????????</a></div>
                    <div class="price">
                        <font>???<span>768.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="../images/his_3.jpg" width="185" height="162"/></a></div>
                    <div class="name"><a href="#">Dior/????????????2?????????</a></div>
                    <div class="price">
                        <font>???<span>680.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="../images/his_4.jpg" width="185" height="162"/></a></div>
                    <div class="name"><a href="#">Dior/????????????2?????????</a></div>
                    <div class="price">
                        <font>???<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="../images/his_5.jpg" width="185" height="162"/></a></div>
                    <div class="name"><a href="#">Dior/????????????2?????????</a></div>
                    <div class="price">
                        <font>???<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
            </ul>
        </div>
        <div class="l_list">
            <div class="des_border">
                <div class="des_tit">
                    <ul>
                        <li class="current">????????????</li>
                    </ul>
                </div>
                <div class="team_list">
                    <div class="img"><a href="#"><img src="../images/mat_1.jpg" width="160" height="140"/></a></div>
                    <div class="name"><a href="#">????????????????????????8?????????</a></div>
                    <div class="price">
                        <div class="checkbox"><input type="checkbox" name="zuhe" checked="checked"/></div>
                        <font>???<span>768.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="../images/jia_b.gif"/></div>
                <div class="team_list">
                    <div class="img"><a href="#"><img src="../images/mat_2.jpg" width="160" height="140"/></a></div>
                    <div class="name"><a href="#">??????????????????????????????50ml</a></div>
                    <div class="price">
                        <div class="checkbox"><input type="checkbox" name="zuhe"/></div>
                        <font>???<span>749.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="../images/jia_b.gif"/></div>
                <div class="team_list">
                    <div class="img"><a href="#"><img src="../images/mat_3.jpg" width="160" height="140"/></a></div>
                    <div class="name"><a href="#">??????????????????????????????50ml</a></div>
                    <div class="price">
                        <div class="checkbox"><input type="checkbox" name="zuhe" checked="checked"/></div>
                        <font>???<span>749.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="../images/equl.gif"/></div>
                <div class="team_sum">
                    ???????????????<span>1517</span><br/>
                    <input type="text" value="1" class="sum_ipt"/><br/>
                    <a href="#"><img src="../images/z_buy.gif"/></a>
                </div>

            </div>
            <div class="des_border">
                <div class="des_tit">
                    <ul>
                        <li class="current"><a href="#p_attribute">????????????</a></li>
                        <li><a href="#p_details">????????????</a></li>
                        <li><a href="#p_comment">????????????</a></li>
                    </ul>
                </div>
                <div class="des_con" id="p_attribute">

                    <table border="0" align="center" style="width:100%; font-family:'??????'; margin:10px auto;"
                           cellspacing="0" cellpadding="0">
                        <tr>
                            <td>???????????????????????????</td>
                            <td>???????????????1546211</td>
                            <td>????????? ?????????Dior???</td>
                            <td>???????????????2015-09-06 09:19:09</td>
                        </tr>
                        <tr>
                            <td>???????????????160.00g</td>
                            <td>?????????????????????</td>
                            <td>????????????????????????????????????/??????EDT</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>?????????1ml-15ml</td>
                            <td>????????????????????????Q????????????????????????</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>


                </div>
            </div>

            <div class="des_border" id="p_details">
                <div class="des_t">????????????</div>
                <div class="des_con">
                    <table border="0" align="center" style="width:745px; font-size:14px; font-family:'??????';"
                           cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="265"><img src="../images/de1.jpg" width="206" height="412"/></td>
                            <td>
                                <b>??????????????????(Q???)</b><br/>
                                ?????????????????????5ml<br/>
                                ???????????????????????????<br/>
                                ??????????????????????????????????????????<br/>
                                ???????????????????????????<br/>
                                ?????????????????????????????? ?????????<br/>
                                ????????????????????????????????????<br/>
                                ??????????????????????????????????????????????????????????????????????????????????????????<br/>
                            </td>
                        </tr>
                    </table>

                    <p align="center">
                        <img src="../images/de2.jpg" width="746" height="425"/><br/><br/>
                        <img src="../images/de3.jpg" width="750" height="417"/><br/><br/>
                        <img src="../images/de4.jpg" width="750" height="409"/><br/><br/>
                        <img src="../images/de5.jpg" width="750" height="409"/>
                    </p>

                </div>
            </div>

            <div class="des_border" id="p_comment">
                <div class="des_t">????????????</div>

                <table border="0" class="jud_tab" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="175" class="jud_per">
                            <p>80.0%</p>?????????
                        </td>
                        <td width="300">
                            <table border="0" style="width:100%;" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="90">??????<font color="#999999">???80%???</font></td>
                                    <td><img src="../images/pl.gif" align="absmiddle"/></td>
                                </tr>
                                <tr>
                                    <td>??????<font color="#999999">???20%???</font></td>
                                    <td><img src="../images/pl.gif" align="absmiddle"/></td>
                                </tr>
                                <tr>
                                    <td>??????<font color="#999999">???0%???</font></td>
                                    <td><img src="../images/pl.gif" align="absmiddle"/></td>
                                </tr>
                            </table>
                        </td>
                        <td width="185" class="jud_bg">
                            ?????????????????????????????????????????????50ml????????????????????????????????????????????????????????????
                        </td>
                        <td class="jud_bg">????????????????????????????????????<br/><a href="#"><img src="../images/btn_jud.gif"/></a></td>
                    </tr>
                </table>


                <table border="0" class="jud_list" style="width:100%; margin-top:30px;" cellspacing="0" cellpadding="0">
                    <tr valign="top">
                        <td width="160"><img src="../images/peo1.jpg" width="20" height="20" align="absmiddle"/>&nbsp;????????????
                        </td>
                        <td width="180">
                            ???????????????<font color="#999999">??????</font> <br/>
                            ?????????<font color="#999999">50ml</font>
                        </td>
                        <td>
                            ???????????????????????????????????????????????? <br/>
                            <font color="#999999">2015-09-24</font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td width="160"><img src="../images/peo2.jpg" width="20" height="20" align="absmiddle"/>&nbsp;??????????????????
                        </td>
                        <td width="180">
                            ???????????????<font color="#999999">??????</font> <br/>
                            ?????????<font color="#999999">50ml</font>
                        </td>
                        <td>
                            ???????????????????????????????????? <br/>
                            <font color="#999999">2015-09-24</font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td width="160"><img src="../images/peo3.jpg" width="20" height="20" align="absmiddle"/>&nbsp;????????????
                        </td>
                        <td width="180">
                            ???????????????<font color="#999999">??????</font> <br/>
                            ?????????<font color="#999999">50ml</font>
                        </td>
                        <td>
                            ??????????????????<br/>
                            <font color="#999999">2015-09-24</font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td width="160"><img src="../images/peo4.jpg" width="20" height="20" align="absmiddle"/>&nbsp;???*****???
                            <br/><font color="#999999">??????????????????</font></td>
                        <td width="180">
                            ???????????????<font color="#999999">??????</font> <br/>
                            ?????????<font color="#999999">50ml</font>
                        </td>
                        <td>
                            ??????????????????????????????<br/>
                            <font color="#999999">2015-09-24</font>
                        </td>
                    </tr>
                </table>


                <div class="pages">
                    <a href="#" class="p_pre">?????????</a><a href="#" class="cur">1</a><a href="#">2</a><a
                        href="#">3</a>...<a href="#">20</a><a href="#" class="p_pre">?????????</a>
                </div>

            </div>


        </div>
    </div>


    <!--Begin ?????????-???????????? Begin-->
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img
                        src="../images/close.gif"/></span>
            </div>
            <div class="notice_c">

                <table border="0" align="center" style="margin-top:;" cellspacing="0" cellpadding="0">
                    <tr valign="top">
                        <td width="40"><img src="../images/suc.png"/></td>
                        <td>
                            <span style="color:#3e3e3e; font-size:18px; font-weight:bold;">???????????????????????????</span><br/>
                            <a href="#">?????????????????? >></a>
                        </td>
                    </tr>
                    <tr height="50" valign="bottom">
                        <td>&nbsp;</td>
                        <td><a href="#" class="b_sure" id="collection_b_sure">??????</a></td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
    <!--End ?????????-???????????? End-->


    <!--Begin ?????????-??????????????? Begin-->
    <div id="fade1" class="black_overlay"></div>
    <div id="MyDiv1" class="white_content">
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv_1('MyDiv1','fade1')"><img
                        src="../images/close.gif"/></span>
            </div>
            <div class="notice_c">

                <table border="0" align="center" style="margin-top:;" cellspacing="0" cellpadding="0">
                    <tr valign="top">
                        <td width="40"><img src="../images/suc.png"/></td>
                        <td>
                            <span style="color:#3e3e3e; font-size:18px; font-weight:bold;">?????????????????????????????????</span><br/>
                            ???????????????${sessionScope.user.shoppings.size()}????????? &nbsp; &nbsp;
                        </td>
                    </tr>
                    <tr height="50" valign="bottom">
                        <td>&nbsp;</td>
                        <td><a href="showBuyCar.do" class="b_sure" id="shopping_b_sure">??????????????????</a><a href="Index.do"
                                                                                                     class="b_buy">????????????</a>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
    <!--End ?????????-??????????????? End-->


    <!--Begin Footer Begin -->
    <%@include file="foot.jsp" %>
    <!--End Footer End -->
</div>

</body>

<script src="../js/ShopShow.js"></script>

<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>
