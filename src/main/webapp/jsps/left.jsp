<%--
  Created by IntelliJ IDEA.
  User: 28385
  Date: 2019/8/28
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/static/css/default.css" rel="stylesheet" />
<link href="/static/css/normalize.css" rel="stylesheet" />

<script type="text/javascript" src="/static/js/prefixfree.min.js"></script>

<html>
<head>
    <%@include file="/jsps/header.jsp"%>
    <%--<%@include file="/jsps/top.jsp"%>--%>
    <style type="text/css">
        * {margin: 0; padding: 0;}
        /*nav styles*/
        .nav ul {
            background: white; border-top: 6px solid hsl(180, 40%, 60%);
            width: 200px; margin: 5em auto;
        }
        .nav ul li {
            list-style-type: none;
            /*relative positioning for list items along with overflow hidden to contain the overflowing ripple*/
            position: relative;
            overflow: hidden;
        }
        .nav ul li a {
            font: normal 14px/28px Montserrat;
            color: hsl(180, 40%, 40%);
            display: block;
            padding: 10px 15px;
            text-decoration: none;
            cursor: pointer; /*since the links are dummy without href values*/
            /*prevent text selection*/
            user-select: none;
            /*static positioned elements appear behind absolutely positioned siblings(.ink in this case) hence we will make the links relatively positioned to bring them above .ink*/
            position: relative;
        }

        /*.ink styles - the elements which will create the ripple effect. The size and position of these elements will be set by the JS code. Initially these elements will be scaled down to 0% and later animated to large fading circles on user click.*/
        .nav .ink {
            display: block;
            position: absolute;
            background: hsl(180, 40%, 80%);
            border-radius: 100%;
            transform: scale(0);
        }
        /*animation effect*/
        .nav .ink.animate {animation: ripple 0.65s linear;}
        @keyframes ripple {
            /*scale the element to 250% to safely cover the entire link and fade it out*/
            100% {opacity: 0; transform: scale(2.5);}
        }
    </style>
</head>
<body>
<div style="width: 1200px;margin: 0 auto; ">
    <div class="row" style="margin-top: 20px;">
        <ul class="breadcrumb" style="text-align: right;height: 60px; background-color: #0e8cd4;line-height:3; font-size:20px">
            <li class="active">欢迎:${user.username}<a href="/login/tuichu">退出</a></li>
        </ul>
        <div class="col-sm-3 ">
            <%--<div class="m_nav">--%>
                <div class="nav">
                    <ul style="margin: 0px;">
                        <li><a href="${pageContext.request.contextPath}/jsps/chakan/chakan.jsp">查看数据</a></li>
                        <c:if test='${user.level ==4}'>
                        <li><a href="${pageContext.request.contextPath}/jsps/chakan/jigou.jsp">机构管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/jsps/chakan/yonghu.jsp">用户管理</a></li>
                        </c:if>
                        <c:if test='${user.level ==0 || user.level==1}'>
                        <li><a href="${pageContext.request.contextPath}/jsps/chakan/yubao.jsp">预报数据</a></li>
                        <li><a href="${pageContext.request.contextPath}/jsps/chakan/shangbao.jsp">上报数据</a></li>
                        </c:if>
                    </ul>
                </div>
            <%--</div>--%>
        </div>
    </div>
</div>
<script type="text/javascript">
    //jQuery time
    var parent, ink, d, x, y;
    $(".nav ul li a").click(function(e){
        parent = $(this).parent();
        //create .ink element if it doesn't exist
        if(parent.find(".ink").length == 0)
            parent.prepend("<span class='ink'></span>");

        ink = parent.find(".ink");
        //incase of quick double clicks stop the previous animation
        ink.removeClass("animate");

        //set size of .ink
        if(!ink.height() && !ink.width())
        {
            //use parent's width or height whichever is larger for the diameter to make a circle which can cover the entire element.
            d = Math.max(parent.outerWidth(), parent.outerHeight());
            ink.css({height: d, width: d});
        }

        //get click coordinates
        //logic = click coordinates relative to page - parent's position relative to page - half of self height/width to make it controllable from the center;
        x = e.pageX - parent.offset().left - ink.width()/2;
        y = e.pageY - parent.offset().top - ink.height()/2;

        //set the position and add class .animate
        ink.css({top: y+'px', left: x+'px'}).addClass("animate");
    })
</script>

</body>
</html>
