<%--
  Created by IntelliJ IDEA.
  User: 28385
  Date: 2019/6/11
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>国际汽配城</title>
    <meta name="keywords" content="汽车">
    <meta name="description" content="汽车电商">

<link rel="stylesheet" href="/static/ztree/css/demo.css" type="text/css">
<link href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="/static/bootstrap-3.3.7-dist/css/bootstrap-colorpicker.css" rel="stylesheet" />
<link href="/static/bootstrap-3.3.7-dist/table/bootstrap-table.min.css"  rel="stylesheet">
<link href="/static/css/common.css" type="text/css" rel="stylesheet">
<link href="/static/css/top.css" type="text/css" rel="stylesheet">
<link href="/static/css/index_mian.css" type="text/css" rel="stylesheet">
<link href="/static/css/header.css" type="text/css" rel="stylesheet">
<%--<link href="/static/css/publiccss.css" type="text/css" rel="stylesheet">--%>
<link href="/static/css/nav.css" type="text/css" rel="stylesheet">
<link href="/static/css/ft_nav.css" type="text/css" rel="stylesheet">
<link href="/static/font-awesome-4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<link href="/static/css/toTop.css" type="text/css" rel="stylesheet">
<link href="/static/ueditor/themes/default/css/ueditor.min.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="/static/ztree/css/zTreeStyle/zTreeStyle.css">


<script src="/static/common/jquery-3.2.1.min.js"></script>
<script src="/static/js/nav.js"> </script>
<script src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="/static/bootstrap-3.3.7-dist/table/bootstrap-table.min.js"></script>
<script src="/static/bootstrap-3.3.7-dist/js/bootstrap-colorpicker.js"></script>
<script src="/static/bootstrap-3.3.7-dist/table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="/static/ueditor/ueditor.config.js"></script>
<script src="/static/ueditor/ueditor.all.js"></script>
<script src="/static/ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="/static/ueditor/ueditor.parse.js"></script>
<script src="/static/js/jquery.ztree.core.js"></script>
<script src="/static/js/jquery.ztree.excheck.js"></script>
<script src="/static/js/jquery.ztree.exedit.js"></script>



    <script>
        $(function () {
            $("div.n_tit").click(function () {
                $("#member_menu ul").each(function(){
                    $(this).hide();
                });
                $(this).next("ul").show();
            });
        });
    </script>

