<%--
  Created by IntelliJ IDEA.
  User: 28385
  Date: 2019/8/28
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/jsps/header.jsp"%>
    <title>酒会管理系统</title>
    <style>
        #loginForm input {
            height: 40px;
            line-height: 40px;
        }
        .input-group-addon {
            font-size: 6px;
        }
        .login_bg {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 700px;
            background: url(/static/image/login/111111.jpg);
            background-size: 100%;
        }
        .w_bg{
            height:475px;
            position:relative;
        }
        /*.c_car{*/
            /*margin: 0 auto;*/
            /*width: 1500px;*/
        /*}*/
        .d_form{
            width: 400px;
            height: 300px;
            background-color: transparent;
            position: absolute;
            right: 100px;
            top: 200px;
            padding: 10px 80px;
        }
        .forgetpsw {
            color: #035EC9;
            float: left;
            margin-right: 10px;
            font-weight: lighter;
            font-size: 12px;
        }
        .user_regist {
            float: right;
            color: #035EC9;
            margin-right: 15px;
        }
        #loginForm .form-group {
            margin-bottom:0px;
        }
    </style>
</head>
<body>
<div class="w_bg">
    <div class="login_bg">
        <%--<div class="c_car"><img src="/static/image/login/111111.jpg"></div>--%>
        <div class="d_form">
            <form class="form-horizontal" id="loginForm" method="post" action="/user/loginUser">
                <div class="form-group"><!--  has-success has-feedback-->
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-mobile" aria-hidden="true"></i>
                        </span>
                        <input type="text" class="form-control" id="usercode" name="usercode">
                    </div>
                    <span class="help-block">&nbsp;</span>
                </div>
                <div class="form-group ">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                        <input type="password" class="form-control" id="password" name="password">

                    </div>
                    <span class="help-block">&nbsp;</span>
                </div>
            </form>
            <span style="display: block;height: 30px;"><a href="/jsps/beichen/changePassword.jsp" class="forgetpsw">忘记登录密码?</a><a href="/jsps/beichen/register.jsp" class="user_regist">免费注册</a></span>
            <span style="display: block"><input type="button" id="login_btn" class="btn btn-primary" style="width: 100%" value="登&nbsp;&nbsp;陆"></input></span>

        </div>
    </div>
</div>
<%--<div >--%>
    <%--<img src="/static/image/login/111111.jpg" width="168" height="63">--%>
<%--</div>--%>
<%--<div style="position:relative">--%>
    <%--<div style="position:absolute; right: 10%; top:10%;width:25%;background-color: white;height:330px;">--%>
        <%--<!-- 登录框开始 -->--%>
        <%--<span id="title">请登录</span>--%>
        <%--<span id="alert">${msg}</span>--%>
        <%--<form id="ff" method="post">--%>
            <%--<div>--%>
                <%--<label>账户:</label>--%>
                <%--<input class="easyui-validatebox" type="text" name="usercode" data-options="required:true" />--%>
            <%--</div>--%>
            <%--<div>--%>
                <%--<label>密码:</label>--%>
                <%--<input class="easyui-validatebox" type="text" name="password" data-options="required:true" />--%>
            <%--</div>--%>
            <%--<div style="text-align:center;padding:5px 0">--%>
                <%--<input style="width: 50px" class="easyui-linkbutton" type="submit" value="提交"/>--%>
                <%--<input style="width: 50px" class="easyui-linkbutton" type="submit" value="取消"/>--%>
            <%--</div>--%>

        <%--</form>--%>
        <%--<!-- 登录框结束 -->--%>
    <%--</div>--%>


    <%--<div align="center">CopyRignt 2016 太平洋保险河北分公司</div>--%>
<%--</div>--%>
<script type="text/javascript">
    $(function () {
        $("#login_btn").click(function () {
        var usercode =$("#usercode").val();
        if(usercode==null ||usercode==''){
            alert("账号不能为空");
            return;
        }
        var password =$("#password").val();
        if(password==null ||password==''){
            alert("密码不能为空");
            return;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/login/findlogin",
            type:"post",
            data:{"usercode": usercode, "password": password},
            dataType:'json',
            success: function (data){
                if (data){
                    alert("登录成功");
                        window.location.href="${pageContext.request.contextPath}/jsps/chakan/chakan.jsp"


                }else {
                    alert("登录失败");
                }
            }

        });
        });
    })

</script>
</body>
</html>
