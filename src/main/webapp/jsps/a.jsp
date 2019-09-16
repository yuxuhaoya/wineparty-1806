<%--
  Created by IntelliJ IDEA.
  User: 28385
  Date: 2019/8/28
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="container" style="height: 100%"></div>
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
<script type="text/javascript">
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
                subtext: '人口密度数据来自Wikipedia',
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
                max: 50000,
                text:['High','Low'],
                realtime: false,
                calculable: true,
                inRange: {
                    color: ['lightskyblue','yellow', 'orangered']
                }
            },
            series: [
                {
                    name: '山东人口密度',
                    type: 'map',
                    mapType: 'HK', // 自定义扩展图表类型
                    itemStyle:{
                        normal:{label:{show:true}},
                        emphasis:{label:{show:true}}
                    },
                    data:[
                        {name: '潍坊', value: 20057.34},
                        {name: '青岛', value: 15477.48},
                        {name: '聊城', value: 31686.1},
                        {name: '菏泽', value: 6992.6},
                        {name: '枣庄', value: 44045.49},
                        {name: '济宁', value: 40689.64},
                        {name: '烟台', value: 37659.78},
                        {name: '威海', value: 45180.97},
                        {name: '济南', value: 55204.26},
                        {name: '德州', value: 21900.9},
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
</script>
</body>
</html>
