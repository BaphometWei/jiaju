<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>后台管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vendor/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vendor/linearicons/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/main.css" />
</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="index.html"><img src="${pageContext.request.contextPath}/css/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo" /></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="${pageContext.request.contextPath}/shouhouorder" class="dropdown-toggle icon-menu">
								<i class="lnr lnr-alarm"></i>
								<span class="badge bg-danger"></span>
							</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-question-circle"></i> <span>帮助</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">Basic Use</a></li>
								<li><a href="#">Working With Data</a></li>
								<li><a href="#">Security</a></li>
								<li><a href="#">Troubleshooting</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="${pageContext.request.contextPath}/css/img/user.png" class="img-circle" alt="Avatar" /> <span>admin</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
								<li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
								<li><a href="#"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul>
						</li>
						<!-- <li>
							<a class="update-pro" href="#downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
						</li> -->
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="${pageContext.request.contextPath}/houtai" class="active"><i class="lnr lnr-home"></i> <span>首页</span></a></li>
						<li>
							<a href="#subPages1" data-toggle="collapse" class="collapsed"><i class="lnr lnr-user"></i> <span>用户管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages1" class="collapse ">
								<ul class="nav">
									<li><a href="${pageContext.request.contextPath}/userguanli" class="">用户信息</a></li>
									<li><a href="${pageContext.request.contextPath}/usertj" class="">用户统计</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>订单管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse ">
								<ul class="nav">
									<li><a href="${pageContext.request.contextPath}/allorder" class="">全部订单</a></li>
									<li><a href="${pageContext.request.contextPath}/weifahuo" class="">未发货订单</a></li>
									<li><a href="${pageContext.request.contextPath}/shouhouorder" class="">申请售后订单</a></li>
									<li><a href="${pageContext.request.contextPath}/tuihuo" class="">退货订单</a></li>
									<li><a href="${pageContext.request.contextPath}/ordertj" class="">订单统计</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="#subPages2" data-toggle="collapse" class="collapsed"><i class="lnr lnr-inbox"></i> <span>商品管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages2" class="collapse">
								<ul class="nav">
									<li><a href="${pageContext.request.contextPath}/productguanli" class="">全部商品</a></li>
									<li><a href="${pageContext.request.contextPath}/addproduct" class="">添加商品</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						
						<div class="panel-body" id="main1" style="height: 400px;">
							
						</div>
					</div>
					<!-- END OVERVIEW -->
					<div class="row">
						<div class="col-md-6">
							<!-- RECENT PURCHASES -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">最近购买</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body no-padding">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Order No.</th>
												<th>UserID</th>
												<th>Amount</th>
												<th>Date &amp; Time</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody >
										</tbody>
									</table>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-md-6"><span class="panel-note"><i class="fa fa-clock-o"></i></span></div>
										<div class="col-md-6 text-right"><a href="${pageContext.request.contextPath}/allorder" class="btn btn-primary">查看所有订单</a></div>
									</div>
								</div>
							</div>
							<!-- END RECENT PURCHASES -->
						</div>
						<div class="col-md-6" style="height: 521px;">
							<!-- MULTI CHARTS -->
							<div class="panel">
								<div class="panel-heading" styl>
									<h3 class="panel-title">待办事项列表</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body">
									<ul class="list-unstyled todo-list" style="margin-top: -40px;">
										<li>
											<label class="control-inline fancy-checkbox">
												<input type="checkbox"><span></span>
											</label>
											<p>
												<span class="title">重启服务器</span>
												<span class="short-description">动态集成以客户端为中心的技术，无需协作资源。</span>
												<span class="date">2018年5月9日</span>
											</p>
											<div class="controls">
												<a href="#"><i class="icon-software icon-software-pencil"></i></a> <a href="#"><i class="icon-arrows icon-arrows-circle-remove"></i></a>
											</div>
										</li>
										<li>
											<label class="control-inline fancy-checkbox">
												<input type="checkbox"><span></span>
											</label>
											<p>
												<span class="title">重启服务器</span>
												<span class="short-description">动态集成以客户端为中心的技术，无需协作资源。</span>
												<span class="date">2018年5月9日</span>
											</p>
											<div class="controls">
												<a href="#"><i class="icon-software icon-software-pencil"></i></a> <a href="#"><i class="icon-arrows icon-arrows-circle-remove"></i></a>
											</div>
										</li>
										<li style="margin-bottom: -20px;">
											<label class="control-inline fancy-checkbox">
												<input type="checkbox"><span></span>
											</label>
											<p>
												<strong>重启服务器</strong>
												<span class="short-description">动态集成以客户端为中心的技术，无需协作资源。</span>
												<span class="date">2018年5月9日</span>
											</p>
											<div class="controls">
												<a href="#"><i class="icon-software icon-software-pencil"></i></a> <a href="#"><i class="icon-arrows icon-arrows-circle-remove"></i></a>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<!-- END MULTI CHARTS -->
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
	</div>
	<!-- ECharts单文件引入 -->
    <script src="http://echarts.baidu.com/build/dist/echarts-all.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
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
        var url1="${pageContext.request.contextPath}/reorder";
    	$.getJSON(url1,function(data){
    		for(var i=0;i<=data.length;i++){
    			var id=data[i].id;
    			var uid=data[i].uid;
    			var sum=data[i].sum;
    			var addtime=data[i].addtime;
    			var wuliu=data[i].wuliu;
    			var string1="<tr><td><a href='#'>"+id+"</a></td>";
    			var string2="<td>"+uid+"</td>";
    			var string3="<td>$"+sum+"</td>";
    			var string4="<td>"+addtime+"</td>";
    			if(wuliu=="已发货")
    				var string5="<td><span class='label label-success'>"+wuliu+"</span></td></tr>";
    			else 
    				var string5="<td><span class='label label-warning'>"+wuliu+"</span></td></tr>";
    			$("tbody").append(string1+string2+string3+string4+string5);
    		}
    		});
    	$(document).ready(function(){
    		$.ajax({
    			url:"${pageContext.request.contextPath}/shouhoumessage",
    			type:"GET",
    			dataType:"text",
    			success:function(data){
    				$(".bg-danger").text(data);
    			}
    		});
    	});
    </script>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/klorofil-common.js"></script>
</body>

</html>