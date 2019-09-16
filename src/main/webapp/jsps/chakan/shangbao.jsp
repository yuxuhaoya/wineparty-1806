<%--
  Created by IntelliJ IDEA.
  User: 28385
  Date: 2019/9/2
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/jsps/header.jsp"%>
    <title>Title</title>
    <link href="/static/国际汽配城_files/userinfo.css" type="text/css" rel="stylesheet">
    <%--<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=bbAnoG6vWDIH4VYWb3IzaL8y"></script>--%>
    <%--<script src="/static/ueditor/ueditor.config.js"></script>--%>
    <%--<script src="/static/ueditor/ueditor.all.js"></script>--%>
    <%--<script src="/static/ueditor/lang/zh-cn/zh-cn.js"></script>--%>
    <%--<script src="/static/ueditor/ueditor.parse.js"></script>--%>
    <style type="text/css">


        .item {
            width: 100px;
            height: 100px;
            float: left;
            position: relative;
            margin: 0px;
        }
        .addImg {
            width: 100px;
            height: 100px;
            position: absolute;
            left: 0;
            top: 0;
            z-index: 2;
            cursor: pointer;
        }
        .preview,.preBlock{
            position: absolute;
            display: block;
            width: 100px;
            height: 100px;
            left: 0;
            top: 0;
        }
        .delete {
            width: 30px;
            position: absolute;
            right: -30px;
            top: -15px;
            cursor: pointer;
            display: none;
        }
        .preBlock img {
            display: block;
            width: 100px;
            height: 100px;
        }
        .upload_input{
            display: block;
            width: 0;
            height: 0;
            -webkit-opacity: 0.0;
            /* Netscape and Older than Firefox 0.9 */
            -moz-opacity: 0.0;
            /* Safari 1.x (pre WebKit!) 老式khtml内核的Safari浏览器*/
            -khtml-opacity: 0.0;
            /* IE9 + etc...modern browsers */
            opacity: .0;
            /* IE 4-9 */
            filter:alpha(opacity=0);
            /*This works in IE 8 & 9 too*/
            -ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
            /*IE4-IE9*/
            filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
        }
    </style>
</head>
<body>
<%@include file="/jsps/left.jsp"%>
<div style="width: 1200px;margin: 0 auto;">
    <div class="row" style="margin-top: -1200px;">
        <div class="col-sm-9">
            <div id="diyiye">
                <table id="sdtab">
                    
                </table>
            </div>
            <div id="dierye">
                <form id="asasasa">
                    <%--<input type="hidden" id="id" name="id" value="${list.id}">--%>
                <div class="form-group">
                    <label class="col-sm-2 control-label">计划名称：</label>
                    <div class="col-sm-4">
                        <%--<span>${list.name}</span>--%>
                        <input type="text" id="name" value="" readonly="readonly">
                    </div>
                </div>
                <%--<div class="form-group">--%>
                    <%--<label class="col-sm-2 control-label">实际桌数：</label>--%>
                    <%--<div class="col-sm-4">--%>
                        <%--<input class="form-control" type="text" id="name" name="name"></input>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <div class="form-group">
                    <label class="col-sm-2 control-label">新客户：</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="text" id="newClient" name="newClient"></input>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">旧客户：</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="text" id="oldClient" name="oldClient"></input>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">意向客户：</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="text" id="yxClient" name="yxClient"></input>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">保费：</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="text" id="money" name="money"></input>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">活动时间：</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="date" id="createtime" name="createtime"></input>
                    </div>
                </div>
                    <div class="row" style="margin: 0 auto;">
                        <div class="col-sm-3 col-sm-offset-2">
                            <button type="button" class="btn btn-danger" id="xiugai">&nbsp;提交&nbsp;</button>
                        </div>
                    </div>
                </form>
            </div>
            <div id="disanye">
                <div class="col-sm-offset-4">
                    <div class="item"  style=" margin-left:35px;">
                        <img class="icon addImg" onclick="clickImg(this);" src="/static/image/store/addImg.png">
                        <input name="url" type="file" class="upload_input" onchange="change(this)">
                        <div class="preBlock">
                            <img id="storeSlide1" class="preview" alt="" name="pic" width="190" height="190">
                        </div>
                        <img class="delete" onclick="deleteImg(this)" src="/static/image/store/delete.png">
                    </div>
                    <div class="form-group" style="margin-top: 30px;">
                        <label class="col-sm-offset-3 control-label">
                            <input type="button" class="btn btn-danger" value="上传"  onclick="uploadImage()"/>
                        </label>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $("#dierye").hide();
        $("#disanye").hide();
        $("#sdtab").bootstrapTable({
            url:"${pageContext.request.contextPath}/area/findshandong",
            pagination:true,//开启分页
            /* sidePagination:"client", */
            pageNumber:1,//请求从第几页开始
            pageSize:3,//默认一页几条
            pageList:[3,5,10],//选择想要的每页条数
            /* sortName:"id",//排序字段
            sortOrder:"desc",//排序方式 */
            sidePagination:'client', //使用服务器分页
            method:'post',//提交方式
            //发送的服务器的数据编码类型，设置from表单传输编码
            contentType:"application/x-www-form-urlencoded; charset=UTF-8",
            striped:true,//斑马线
            cache:false,//禁用缓存
            /* search:true,//开启搜索 */
            strictSearch:true,
            showColumns:true,
            showRefresh:true,
            // queryParams:function(param){//请求参数
            //     return{
            //         areaId:$("#table_id").val()
            //     }
            //
            // },

            columns:[
                {
                    field:'name',
                    title:'计划名称'
                },{
                    field:'numActual',
                    title:'计划召开桌数'
                },{
                    field:"startTime",
                    title:'开始时间',

                },{
                    field:'endTime',
                    title:'结束时间'
                },{
                    title: "操作",
                    formatter:function(value,row,index){
                        if(row.audit == 1){
                            var str="<button class='btn btn-primary' onclick='upd("+row.id+")' disabled>上报数据</button>";
                        }else{
                            var str="<button class='btn btn-primary' onclick='upd("+row.id+")'>上报数据</button>";
                        }

                        return str;
                    }

                }
            ]
        });
    })
    function upd(id) {
        $.ajax({
            url:"/area/findsd",
            dataType:"json",
            type:"post",
            data:{id:id},
            success:function(data){
                $("#name").val(data.name);
            }
        });
        $("#dierye").show();
        $("#diyiye").hide();
        $("#disanye").hide();

        $("#xiugai").click(function () {
            $.ajax({
                url:"/area/updshandong",
                dataType:"json",
                type:"post",
                data:$("#asasasa").serialize(),
                success:function(data){
                    if(data){
                        alert("修改成功");
                        $("#dierye").hide();
                        $("#diyiye").hide();
                        $("#disanye").show();
                    }else{
                        alert("添加失败失败");
                        window.location.reload();
                    }
                }
            });
        })
    }



    var clickImg = function(obj){
        $(obj).parent().find('.upload_input').click();
    }

    var deleteImg = function(obj){
        $(obj).parent().find('input').val('');
        $(obj).parent().find('img.preview').attr("src","");
        //IE9以下
        $(obj).parent().find('img.preview').css("filter","");
        $(obj).hide();
        $(obj).parent().find('.addImg').show();
    }
    function change(file) {
        //预览
        var pic = $(file).parent().find(".preview");
        //添加按钮
        var addImg = $(file).parent().find(".addImg");
        //删除按钮
        var deleteImg = $(file).parent().find(".delete");

        var ext=file.value.substring(file.value.lastIndexOf(".")+1).toLowerCase();

        // gif在IE浏览器暂时无法显示
        if(ext!='png'&&ext!='jpg'&&ext!='jpeg'){
            if (ext != '') {
                alert("图片的格式必须为png或者jpg或者jpeg格式！");
            }
            return;
        }
        //判断IE版本
        var isIE = navigator.userAgent.match(/MSIE/)!= null,
            isIE6 = navigator.userAgent.match(/MSIE 6.0/)!= null;
        isIE10 = navigator.userAgent.match(/MSIE 10.0/)!= null;
        if(isIE && !isIE10) {
            file.select();
            var reallocalpath = document.selection.createRange().text;
            // IE6浏览器设置img的src为本地路径可以直接显示图片
            if (isIE6) {
                pic.attr("src",reallocalpath);
            }else{
                // 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
                pic.css("filter","progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src=\"" + reallocalpath + "\")");
                // 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
                pic.attr('src','data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==');
            }
            addImg.hide();
            deleteImg.show();
        }else {
            html5Reader(file,pic,addImg,deleteImg);
        }
    }

    function html5Reader(file,pic,addImg,deleteImg){
        var file = file.files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function(e){
            pic.attr("src",this.result);
        }
        addImg.hide();
        deleteImg.show();
    }

    /* 使用二进制方式处理dataUrl */
    function processData(dataUrl) {
        var binaryString = window.atob(dataUrl.split(',')[1]);
        var arrayBuffer = new ArrayBuffer(binaryString.length);
        var intArray = new Uint8Array(arrayBuffer);
        for (var i = 0, j = binaryString.length; i < j; i++) {
            intArray[i] = binaryString.charCodeAt(i);
        }

        var data = [intArray],
            blob;

        try {
            blob = new Blob(data);
        } catch (e) {
            window.BlobBuilder = window.BlobBuilder ||
                window.WebKitBlobBuilder ||
                window.MozBlobBuilder ||
                window.MSBlobBuilder;
            if (e.name === 'TypeError' && window.BlobBuilder) {
                var builder = new BlobBuilder();
                builder.append(arrayBuffer);
                blob = builder.getBlob(imgType); // imgType为上传文件类型，即 file.type
            } else {
                console.log('版本过低，不支持上传图片');
            }
        }
        return blob;
    }
    function uploadImage(){
        //1.获取图片的数据
        var dataUrl=$("#storeSlide1").attr("src");
        //2.把二进制的图片数据转为Blob对象
        var blob = processData(dataUrl);
        var formData = new FormData();
        formData.append('storeImg', blob);
        $.ajax({
            url:"${pageContext.request.contextPath}/area/addphoto",
            method: "post",
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                alert(data.status)
                if(data.status){
                    alert("上传成功");
                    // window.location.reload();
                    // $("input[name=goodsMainPhotoId]").val(data.id);
                    window.location.href="${pageContext.request.contextPath}/jsps/chakan/chakan.jsp"
                }else{
                    alert("上传失败");
                }
            },
            error: function () {
                console.log('Upload error');
            }
        });
    }

</script>




</body>
</html>
