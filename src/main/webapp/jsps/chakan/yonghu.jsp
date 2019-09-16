<%--
  Created by IntelliJ IDEA.
  User: 28385
  Date: 2019/8/30
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="/jsps/left.jsp"%>
<div style="width: 1200px;margin: 0 auto;">
    <div class="row" style="margin-top: -1200px;">
        <div class="col-sm-9">
            <div class="zTreeDemoBackground left col-sm-2">
                <ul id="treeDemo" class="ztree"></ul>
            </div>

            <div class="modal fade" id="ssModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">

                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form" id="fId">
                                <input type="hidden" class="form-control" name="id" id="id">
                                <div class="form-group">
                                    <label for="username" class="col-sm-2 control-label">用户名称</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" name="username" id="username"
                                        >
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label for="usercode" class="col-sm-2 control-label">用户账号</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" name="usercode" id="usercode"
                                        >
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">用户密码</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" name="password" id="password"
                                        >
                                    </div>

                                </div>
                                <input type="hidden" class="form-control" id="areaId" name="areaId" >
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" id="aa">关闭
                            </button>
                            <input type="button" id="tiajoa" value="添加">
                            <!--    <button type="button" class="btn btn-primary" id="imageId">
                                   添加
                               </button> -->
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

            <div class="modal fade" id="dierModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel2">

                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" role="form" id="forId">
                                <%--<input type="hidden" class="form-control" name="id" id="id">--%>
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">用户名称</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" name="name" id="name"
                                        >
                                    </div>

                                </div>
                                <input type="hidden" class="form-control" id="pId" name="pId" >
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" id="cc">关闭
                            </button>
                            <input type="button" id="tiaojoa" value="添加">
                            <!--    <button type="button" class="btn btn-primary" id="imageId">
                                   添加
                               </button> -->
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

            <div class="col-xs-7">
                <table id="tab">

                </table>
                <%--<button id="aaaid">添加</button>--%>
                <a href="javascript:aaa()">添加</a>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="table_id">
<style type="text/css">
    .ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
</style>
<script type="text/javascript">
    $(function () {
        var setting = {
            data: {
                simpleData: {
                    enable: true,//使用简单类型
                    idKey:"id",//节点唯一标识
                    pIdKey:"pId",//父节点唯一标识
                    rootPId:0//根节点属性对应的值
                }
            },
            view: {
                showLine: true,//隐藏线
                showIcon:true,	//隐藏图标
                addHoverDom: addHoverDom, //鼠标移入时展示试图
                 removeHoverDom: removeHoverDom,//鼠标移出时隐藏试图
                // selectedMulti: false//是否可以选中多个节点 */
                //使用简单类型树结构
                dblClickExpand: true
            },
            edit: {
                enable: true,//可编辑
                editNameSelectAll: true,
                showRemoveBtn: true,
                showRenameBtn: true

            },

            callback: {
                /* beforeDrag: beforeDrag, */
                /* beforeEditName: beforeEditName, */
                beforeRemove: areaBeforeRemove,//删除之前
                /* beforeRename: true, */
                /* onRemove: true, */
                onRename: xiugaishu,
                //onClick: zTreeOnClick//点击事件*/
                onClick: zTreeOnClick
            },
            async:{
                enable:true,//异步加载
                url:"${pageContext.request.contextPath}/area/findAll",//异步访问路径
                autoParam:["id","name","pId"]//设置请求参数
            }

        };

        //鼠标移出时隐藏试图
        function removeHoverDom(treeId , treeNode){
            $("#addBtn_"+treeNode.tId).unbind().remove();
        };
        function addHoverDom(treeId, treeNode) {
            var sObj = $("#" + treeNode.tId + "_span");//节点的id的值
            if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
            //treeNode。editNameFlag节点是否是可编辑状态
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='add node' onfocus='this.blur();'></span>";
            //li 之后追加span
            sObj.after(addStr);
            var btn = $("#addBtn_"+treeNode.tId);//追加span对象
            if (btn) btn.bind("click", function(){
                addNodes(treeId, treeNode);

            });
        }


        function addNodes(treeId , treeNode){
            $("#pId").val(treeNode.id);
            $("#dierModal").modal('show');
            $("#tiaojoa").click(function(){
                var data = new FormData($("#forId")[0]);
                $.ajax({
                    url:'${pageContext.request.contextPath}/login/addarea',
                    type:'post',
                    data:data,
                    dataType:'json',
                    processData:false,
                    contentType:false,
                    success:function(data){
                        $("#dierModal").modal('hide');
                        alert("添加成功！");
                    }
                });
            })
        }



        function areaBeforeRemove(treeId, treeNode,str) {
            var str ='';
            str = getAllChildrenNodes(treeNode,str);

            str = str +','+ treeNode.id;

            var ids = str.substring(1,str.length);

            var idsArray = ids.split(',');

            if(treeNode.parentId==0){
                alert("根节点不能删除");
                return false;
            }else{
                deleteNodeById(idsArray);
            }

        }
        function getAllChildrenNodes(treeNode,result){
            if(treeNode.isParent){
                var childrenNodes = treeNode.children;
                if(childrenNodes){
                    for(var i = 0; i < childrenNodes.length;i++){
                        result +=','+childrenNodes[i].id;
                        result = getAllChildrenNodes(childrenNodes[i],result);
                    }
                }
            }
            return result;
        }


        function deleteNodeById(idsArray){
            $.ajax({
                type:'post',
                url:'${pageContext.request.contextPath}/area/delete',
                data:{"id":idsArray},
                traditional:true,//传数组需要
                dataType:'json',
                success:function(data){
                    if(data){
                        alert("删除成功");
                        return true;
                        intZtree();
                    }else{
                        alert("删除失败");
                    }
                }
            });
        }


            // $("#areaId").val(treeNode.id);






        function zTreeOnClick(event, treeId, treeNode){
            $("#table_id").val(treeNode.id);
             $("#tab").bootstrapTable("refresh");
             $("#areaId").val(treeNode.id)
        }

        $(function(){
            $.fn.zTree.init($("#treeDemo"),setting);//初始化节点
        });
        function intZtree(){
            $.fn.zTree.init($("#treeDemo"), setting);//初始化节点
        }

    })

    function aaa(){
        $("#ssModal").modal('show');
        $("#tiajoa").click(function(){
            var data = new FormData($("#fId")[0]);
            $.ajax({
                url:'${pageContext.request.contextPath}/login/adduser',
                type:'post',
                data:data,
                dataType:'json',
                processData:false,
                contentType:false,
                success:function(data){
                    $("#ssModal").modal('hide');
                    alert("添加成功！");
                }
            });
        });
    }

    function xiugaishu(event, treeId, treeNode, isCancel){
        var name=treeNode.name;
        // var index = oldname.indexOf("[");//
        // var name = oldname.substring(0,index);//截取
        var id=treeNode.id;
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/area/updatearea',
            data:{name:name,id:id},
            dataType:'json',
            success:function(data){
                if(data){
                    alert("修改成功");
                    intZtree();//刷新
                }else{
                    alert("修改失败");
                }
            },error:function(data){
                alert(data)
                alert("修改失败");
            }
        });
    }


    $("#tab").bootstrapTable({
        url:"${pageContext.request.contextPath}/login/finduser",
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
        queryParams:function(param){//请求参数
                return{
                    areaId:$("#table_id").val()
                }

        },

        columns:[
            {
                field:'username',
                title:'名称'
            },{
                field:'usercode',
                title:'人员'
            },{
                title:'级别',
                formatter:function (value,row,index) {
                    var str =0;
                    return str;
                }
            }
        ]
    });

</script>
</body>
</html>
