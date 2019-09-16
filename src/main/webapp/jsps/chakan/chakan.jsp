<%--
  Created by IntelliJ IDEA.
  User: 28385
  Date: 2019/8/29
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="/static/echarts/echarts.min.js"></script>
    <script src="/static/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=bbAnoG6vWDIH4VYWb3IzaL8y"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
    <script type="text/javascript" src="/static/ditu/js/province/shandong.js"></script>
</head>
<body>
<%@include file="/jsps/left.jsp"%>
<div style="width: 1200px;margin: 0 auto;">
    <div class="row" style="margin-top: -1200px;">
        <div class="col-sm-9">
            <div>
                <span><div style="background-color: #2fa0ec;width: 80px;font-size: 20px">查看数据</div></span>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label"><span style="font-size: 20px">开始时间：</span></label>
                <div class="col-sm-3">
                <input  class="form-control" type="date">
                </div>
                <label class="col-sm-2 control-label"><span style="font-size: 20px">结束时间:</span></label>
                <div class="col-sm-3">
                <input  class="form-control" type="date">
                </div>
                <button class="btn btn-danger" id="c">查询</button><button class="btn btn-danger" id="d">导出</button>
            </div>
            <div class="col-sm-4">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" aria-controls="home" data-toggle="tab">统计图</a></li>
                    <li><a href="#profile" aria-controls="profile" data-toggle="tab">详细列表信息</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="home">
                        <%--<div id="container" style="height: 60%;width: 700px"></div>--%>
                            <div id="container" style="height: 100%;width: 700px"></div>
                    </div>
                    <div class="tab-pane" id="profile" style="width: 800px;height: 400px">
                        <table id="aaa"></table>
                        <input type="hidden" id="level" value="${user.level}">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    // var dom = document.getElementById("container");
    // var myChart = echarts.init(dom);
    // var app = {};
    // option = null;
    // option = {
    //     title : {
    //         text: '山东省预保费数据',
    //         subtext: '纯属虚构',
    //         x:'center'
    //     },
    //     tooltip : {
    //         trigger: 'item',
    //         formatter: "{a} <br/>{b} : {c} ({d}%)"
    //     },
    //     legend: {
    //         orient: 'vertical',
    //         left: 'left',
    //         data: ['潍坊','菏泽','济南','青岛','聊城']
    //     },
    //     series : [
    //         {
    //             name: '访问来源',
    //             type: 'pie',
    //             radius : '55%',
    //             center: ['50%', '50%'],
    //             data:[
    //                 {value:335, name:'潍坊'},
    //                 {value:310, name:'菏泽'},
    //                 {value:234, name:'济南'},
    //                 {value:135, name:'青岛'},
    //                 {value:1548, name:'聊城'}
    //             ],
    //             itemStyle: {
    //                 emphasis: {
    //                     shadowBlur: 10,
    //                     shadowOffsetX: 0,
    //                     shadowColor: 'rgba(0, 0, 0, 0.5)'
    //                 }
    //             }
    //         }
    //     ]
    // };
    // ;
    // if (option && typeof option === "object") {
    //     myChart.setOption(option, true);
    // }


    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    myChart.showLoading();

    $.get('/static/ditu/json/province/shandong.json', function (geoJson) {

        myChart.hideLoading();

        echarts.registerMap('HK', geoJson);

        myChart.setOption(option = {
            title: {
                text: '山东 （2011）',
                subtext: '山东省预估保费统计图',
                sublink: 'http://zh.wikipedia.org/wiki/%E9%A6%99%E6%B8%AF%E8%A1%8C%E6%94%BF%E5%8D%80%E5%8A%83#cite_note-12'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{b}<br/>{c} (p / km2)'
            },
            toolbox: {
                show: true,
                orient: 'vertical',
                left: 'right',
                top: 'center',
                feature: {
                    dataView: {readOnly: false},
                    restore: {},
                    saveAsImage: {}
                }
            },
            visualMap: {
                min: 800,
                max: 70000,
                text:['High','Low'],
                realtime: false,
                calculable: true,
                inRange: {
                    color: ['lightskyblue','yellow', 'orangered']
                }
            },
            series: [
                {
                    name: '山东预估保费',
                    type: 'map',
                    mapType: 'HK', // 自定义扩展图表类型
                    itemStyle:{
                        normal:{label:{show:true}},
                        emphasis:{label:{show:true}}
                    },
                    data:[
                        {name: '潍坊', value: 70000},
                        {name: '青岛', value: 15477.48},
                        {name: '聊城', value: 31686.1},
                        {name: '菏泽', value: 6992.6},
                        {name: '枣庄', value: 44045.49},
                        {name: '济宁', value: 40689.64},
                        {name: '烟台', value: 37659.78},
                        {name: '威海', value: 45180.97},
                        {name: '济南', value: 55204.26},
                        {name: '德州', value: 60000},
                        {name: '泰安', value: 4918.26},
                        {name: '临沂', value: 5881.84},
                        {name: '淄博', value: 4178.01}

                    ],
                    // 自定义名称映射
                    nameMap: {
                        'weifang': '潍坊',
                        'qingdao': '青岛',
                        'Islands': '聊城',
                        'Kowloon City': '菏泽',
                        'Kwai Tsing': '枣庄',
                        'Kwun Tong': '济宁',
                        'North': '烟台',
                        'Sai Kung': '威海',
                        'Sha Tin': '济南',
                        'Sham Shui Po': '德州',
                        'Southern': '泰安',
                        'Tai Po': '临沂',
                        'Tsuen Wan': '淄博'

                    }
                }
            ]
        });
    });
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }

    $(function () {
        var level =${user.level}
        $("#aaa").bootstrapTable({
            url:"${pageContext.request.contextPath}/area/findshandong",
            pagination:true,
            sidePagination:"client",
            pageSize:3,
            pageList:[2,3,4,5,6],
            // queryParams:function(param){//请求参数
            //         return{
            //              level:$("#level").val()
            //          }
            //
            //      },
            columns: [
                {
                    field: 'id',
                    title: '编号',
                    formatter:function(value,row,index){
                        return index+1;
                    }
                }, {
                    field: 'name',
                    title: '机构名称',
                    align: 'center'
                }, {
                    field: 'numActual',
                    title: '计划召开桌数',
                    align: 'center',


                },
                {
                    field: 'newClient',
                    title: '新客户',
                    align: 'center',

                },{
                    field: 'oldClient',
                    title: '老客户',
                    align: 'center',

                },{
                    field:"yxClient",
                    title: '意向客户',
                    align: 'center',

                },{
                    field:"money",
                    title: '预估保费(万)',
                    align: 'center',

                }
            ]
        });
    })

    $("#d").click(function () {
        var table = $("#aaa").bootstrapTable('getData',true);//获取表格值

        var limit = $("#aaa").bootstrapTable("getOptions").pageNumber;//页码
        var offset = $("#aaa").bootstrapTable("getOptions").pageSize;//条数

        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/area/daochu',
            data:{
                "limit":limit,
                "offset":offset
            },
            /* data:$("#daochu").serialize(), */
            dataType:'json',
            success:function(data){
                if(data){
                    alert("当前页导出成功，请前往磁盘查看");
                }else{
                    alert("导出失败");
                }
                $("#daochuModel").modal('hide')
            },error:function(data){
                alert(data)
                alert("导出失败");
            }

        });
    })



</script>
<div class="ft_beian Width" style="position: relative; width: 1000px; text-align: center;background-color: #0e8cd4" id="footerstyle">
    <script type="text/javascript">try{ace.settings.check('footerstyle' , 'fixed')}catch(e){}</script>
    <p class="l_f">版权所有：北京工商管理专修学院数据云</p>
    <p class="r_f">qq：xxxxxxxxxx</p>
</div>
</body>
</html>
