<%--
  Created by IntelliJ IDEA.
  User: 28385
  Date: 2019/8/30
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="/jsps/left.jsp"%>
<div style="width: 1200px;margin: 0 auto;">
    <div class="row" style="margin-top: -1200px;">
        <div class="col-sm-9">
            <div>
            <form class="form-horizontal" id="shandong" enctype="multipart/form-data" method="post">
            <div class="form-group">
                <label class="col-sm-2 control-label">计划名称：</label>
                <div class="col-sm-4">
                    <input class="form-control" type="text" id="name" name="name"></input>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">计划召开桌数：</label>
                <div class="col-sm-4">
                    <input class="form-control" type="text" id="numActual" name="numActual"></input>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">开始时间：</label>
                <div class="col-sm-4">
                    <input class="form-control" type="date" id="startTime" name="startTime"></input>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">结束时间：</label>
                <div class="col-sm-4">
                    <input class="form-control" type="date" id="endTime" name="endTime"></input>
                </div>
            </div>
            </form>
                <div class="row" style="margin: 0 auto;">
                    <div class="col-sm-3 col-sm-offset-2">
                        <button type="button" class="btn btn-danger" id="tijiao">&nbsp;提交&nbsp;</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script type="text/javascript">
    $("#tijiao").click(function () {
        $.ajax({
            url:"/area/addshandong",
            dataType:"json",
            type:"post",
            data:$("#shandong").serialize(),
            success:function(data){
                if(data){
                    alert("添加成功");

                    window.location.href="${pageContext.request.contextPath}/jsps/chakan/shangbao.jsp"
                }else{
                    alert("添加失败");
                    window.location.reload();
                }
            }
        });
    })
</script>
</body>
</html>
