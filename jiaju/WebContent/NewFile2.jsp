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
    <script src="http://echarts.baidu.com/build/dist/echarts-all.js"></script>
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts图表
        var myChart1 = echarts.init(document.getElementById('main1'));
        var option = {
    title : {
        text: '最近一周概览'
    },
    tooltip : {
        trigger: 'item'
    },
    legend: {
        data:['新增会员','成交金额']
    },
    toolbox: {
        show : true,
        feature : {
            dataView : {show: true, readOnly: false},
            saveAsImage : {show: true}
        }
    },
    xAxis : [
       
    ],
    yAxis : [
        {
            type : 'value',
            position: 'right',
            axisLabel : {
                formatter: '{value} 元'
            },
            splitLine : {
                show:false
            }
        },
        {
            type : 'value',
            position: 'left',
            axisLabel : {
                formatter: '{value} 人'
            },
            splitLine : {
                show:false
            }
        }
    ],
    series : [
        
    ]
};

        // 为echarts对象加载数据 
        myChart1.setOption(option); 
        window.addEventListener("resize",function(){
    	myChart1.resize();
		});
        $.ajax({
    		url : '${pageContext.request.contextPath}/TJ',
    		type : 'GET',
    		async:false,
    		dataType : 'json',
    		success : function(data) {
    			myChart1.setOption({
    				xAxis : [
    			        {
    			            type : 'category',
    			            boundaryGap : false,
    			            data : data.date,
    			            splitLine : {
    			                show:false
    			            }
    			        }
    			    ],
    				series: [{
    		            name:'新增会员',
    		            type:'line',
    		            yAxisIndex: 1,
    		            data:data.usernum,
    		            smooth:true,
    		            markLine : {
    		                data : [
    		                    {type : 'average', name: '平均值'}
    		                ]
    		            }
    		        },
    		        {
    		            name:'成交金额',
    		            type:'line',
    		            data:data.sum,
    		            smooth:true,
    		            markLine : {
    		                data : [
    		                    {type : 'average', name: '平均值'}
    		                ]
    		            }
    		        }]
    			});
    		}
    	});
    </script>
</body>
</html>