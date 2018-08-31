<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
  <div id="main" style="height:400px"></div>
    <div id="main1" style="height:400px"></div>
    <!-- ECharts单文件引入 -->
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts图表
        var myChart = echarts.init(document.getElementById('main')); 
        var myChart1 = echarts.init(document.getElementById('main1'));
        var option = {
    title : {
        text: '未来一周气温变化',
        subtext: '纯属虚构'
    },
    tooltip : {
        trigger: 'item'
    },
    legend: {
        data:['最高气温','最低气温']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : ['周一','周二','周三','周四','周五','周六','周日'],
            splitLine : {
                show:false
            }
        }
    ],
    yAxis : [
        {
            type : 'value',
            position: 'right',
            axisLabel : {
                formatter: '{value} 人'
            },
            splitLine : {
                show:false
            }
        },
        {
            type : 'value',
            position: 'left',
            axisLabel : {
                formatter: '{value} 件'
            },
            splitLine : {
                show:false
            }
        }
    ],
    series : [
        {
            name:'最高气温',
            type:'line',
            data:[11, 11, 120, 13, 12, 13, 10],
            smooth:true,
            markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            }
        },
        {
            name:'最低气温',
            type:'line',
            yAxisIndex: 1,
            data:[11, 20, 32, 55, 33, 12, 40],
            smooth:true,
            markPoint : {
                data : [
                    {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                ]
            }
        }
    ]
};

        // 为echarts对象加载数据 
        myChart.setOption(option); 
        myChart1.setOption(option); 
        window.addEventListener("resize",function(){
    	myChart.resize();
    	myChart1.resize();
		});
    </script>
</body>
</html>