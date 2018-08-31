<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>后台管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/lanrenzhijia.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vendor/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vendor/linearicons/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/main.css" />
	<style type="text/css">
	html{ overflow-y:scroll;} 
	html{ overflow-y:scroll; min-height:101%;margin: 0;} 
	html{ overflow:-moz-scrollbars-vertical;} 
	</style>
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
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-user"></i><span>admin</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
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
						<li><a href="${pageContext.request.contextPath}/houtai" class=""><i class="lnr lnr-home"></i> <span>首页</span></a></li>
						<li>
							<a href="#subPages1" data-toggle="collapse" class="collapsed"><i class="lnr lnr-user"></i> <span>用户管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages1" class="collapse">
								<ul class="nav">
									<li><a href="${pageContext.request.contextPath}/userguanli" class="">用户信息</a></li>
									<li><a href="${pageContext.request.contextPath}/usertj" class="">用户统计</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="#subPages" data-toggle="collapse" class="active"><i class="lnr lnr-file-empty"></i> <span>订单管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse in">
								<ul class="nav">
									<li><a href="${pageContext.request.contextPath}/allorder" class="">全部订单</a></li>
									<li><a href="${pageContext.request.contextPath}/weifahuo" class="">未发货订单</a></li>
									<li><a href="${pageContext.request.contextPath}/shouhouorder" class="">申请售后订单</a></li>
									<li><a href="${pageContext.request.contextPath}/tuihuo" class="active">退货订单</a></li>
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
		<div class="main">
				<div class="main-content">
				<div class="container-fluid">
					<div class="panel panel-profile">
						<div class="clearfix"  style="min-height: 495px;">
							<!-- LEFT COLUMN -->
							<div class="profile-left" style="background-color: #fff;">
					<div id="tablewrapper" style="min-height: 495px;">
						<div id="tableheader" style="margin-top: 10px;">
							<div class="search">
								<select id="columns" onchange="sorter.search('query')"></select>
								<input type="text" id="query" onkeyup="sorter.search('query')" />
							</div>
							<span class="details">
								<div>Records <span id="startrecord"></span>-<span id="endrecord"></span> of <span id="totalrecords"></span></div>
						<div>
							<a href="javascript:sorter.reset()">reset</a>
						</div>
						</span>
					</div>
					<table cellpadding="0" cellspacing="0" border="0" id="table" class="table table-bordered">
						<thead>
							<tr>
								<th class="nosort" style="border-bottom: none;text-align: center">
									<h8>订单编号</h8>
								</th>
								<th style="border-bottom: none;text-align: center">
									<h8>用户id</h8>
								</th>
								<th style="border-bottom: none;text-align: center">
									<h8>金额</h8>
								</th>
								<th style="border-bottom: none;text-align: center">
									<h8>地址</h8>
								</th>
								<th style="border-bottom: none;text-align: center">
									<h8>联系电话</h8>
								</th>
								<th style="border-bottom: none;text-align: center">
									<h8>提交时间</h8>
								</th>
								<th style="border-bottom: none;text-align: center">
									<h8>状态</h8>
								</th>
								<th style="border-bottom: none;text-align: center">
									<h8>明细</h8>
								</th>
								<th style="border-bottom: none;text-align: center">
									<h8>确认收货</h8>
								</th>
							</tr>
						</thead>
						<tbody>
			<c:forEach items="${os}" var="o" varStatus="st">
            	<tr>
                    <td style="text-align: center">${o.id}</td>
                    <td style="text-align: center"><a value="${o.uid}" id="uid" style="text-align: center;cursor:pointer;">${o.uid}</a></td>
                    <td style="text-align: center">$${o.sum}</td>
                    <td style="text-align: center">${o.address}</td>
                    <td style="text-align: center">${o.phone}</td>
                    <td style="text-align: center">${o.addtime}</td>
                    <td style="text-align: center">${o.wuliu}</td>
                    <td style="text-align: center"><div value="${o.id}" value1="${o.uid}" class="glyphicon glyphicon-ok" style="text-align: center;cursor:pointer;"></div></td>
                	<td style="text-align: center"><div value="${o.id}" value1="${o.uid}" class="glyphicon glyphicon-check" style="text-align: center;cursor:pointer;"></div></td>
                </tr>
            </c:forEach>
						</tbody>
					</table>
					<div id="tablefooter">
						<div id="tablenav">
							<div>
								<img src="${pageContext.request.contextPath}/css/images/first.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1,true)" />
								<img src="${pageContext.request.contextPath}/css/images/previous.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1)" />
								<img src="${pageContext.request.contextPath}/css/images/next.gif" width="16" height="16" alt="First Page" onclick="sorter.move(1)" />
								<img src="${pageContext.request.contextPath}/css/images/last.gif" width="16" height="16" alt="Last Page" onclick="sorter.move(1,true)" />
							</div>
							<div>
								<select id="pagedropdown"></select>
							</div>
						</div>
						<div id="tablelocation">

							<div class="page">Page <span id="currentpage"></span> of <span id="totalpages"></span></div>
						</div>
					</div>
					
				</div>
				<div id="detail" style="margin-top:10px;margin-right: 3px;box-shadow:0px 0px 5px #fff;">
							<!-- TABLE HOVER -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">订单详情</h3>
								</div>
								<div class="panel-body">
									<table class="table table-hover">
										<thead>
											<tr style="background-color:#D8703F">
												<th style="text-align: center">订单编号</th>
												<th style="text-align: center">Product</th>
												<th style="text-align: center">Pname</th>
												<th style="text-align: center">Price</th>
												<th style="text-align: center">Num</th>
											</tr>
										</thead>
										<tbody id="detail">
										</tbody>
									</table>
								</div>
							</div>
							<!-- END TABLE HOVER -->
						</div>
				</div>
				<div class="profile-right">
								<!-- PROFILE HEADER -->
								<div class="profile-header">
								</div>
								<!-- END PROFILE HEADER -->
								<!-- PROFILE DETAIL -->
								<div class="profile-detail" style="background-color: #F8F8F8;margin-top: -30px;">
									<div class="profile-info" style="padding-top:20px;">
										<h4 class="heading" style="background-color:#D8703F;vertical-align:middle;text-align:center;padding-top: 8px;">用户详细信息</h4>
										<ul class="list-unstyled list-justify">
											<li>用户id <span id="id"></span></li>
											<li>用户名 <span id="username"></span></li>
											<li>性别 <span id="sex"></span></li>
											<li>联系电话 <span id="phone"></span></li>
											<li>地址 <span id="address"></span></li>
											<li>注册时间 <span id="rstime"></span></li>
										</ul>
									</div>
									<div class="profile-info">
										<h4 class="heading">关于</h4>
										<p>Interactively fashion excellent information after distinctive outsourcing.</p>
									</div>
								</div>
								<!-- END PROFILE DETAIL -->
								
							</div>
				</div>
				</div>
				</div>
			</div>
		</div>
		</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lanrenzhijia.js"></script>
	<script type="text/javascript">
	var sorter = new TINY.table.sorter('sorter','table',{
		headclass:'head',
		ascclass:'asc',
		descclass:'desc',
		evenclass:'evenrow',
		oddclass:'oddrow',
		evenselclass:'evenselected',
		oddselclass:'oddselected',
		paginate:true,
		size:9,
		colddid:'columns',
		currentid:'currentpage',
		totalid:'totalpages',
		startingrecid:'startrecord',
		endingrecid:'endrecord',
		totalrecid:'totalrecords',
		hoverid:'selectedrow',
		pageddid:'pagedropdown',
		navid:'tablenav',
		columns:[{index:7, format:'%', decimals:1},{index:8, format:'$', decimals:0}],
		init:true
	});
  	</script>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/klorofil-common.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("div#detail").hide();
		$(".profile-detail").hide();
		$.ajax({
			url:"${pageContext.request.contextPath}/shouhoumessage",
			type:"GET",
			dataType:"text",
			success:function(data){
				$(".bg-danger").text(data);
			}
		});
	});
	$('.glyphicon-ok').on('click', function(){
		var oid=$(this).attr("value");
		var userid=$(this).attr("value1");
		$("tbody#detail").html("");
		$.ajax({
			url:"${pageContext.request.contextPath}/getid?id="+userid,
			type:"GET",
			dataType:"json",
			success:function(data){
				$("#id").text(data.id);
				$("#username").text(data.username);
				$("#sex").text(data.sex);
				$("#phone").text(data.phone);
				$("#address").text(data.address);
				$("#rstime").text(data.rstime);
			}
		});
		$.ajax({
			url:"${pageContext.request.contextPath}/getoid?oid="+oid,
			type:"GET",
			dataType:"json",
			success:function(data){
				for(var i=0;i<data[0].orderDetails.length;i++){
					var a="<tr><td style='vertical-align: middle;text-align: center;'>"+data[0].id+"</td><td style='text-align: center;vertical-align:middle;'>";
					var b="<img style='height:130px;width:180px;margin:0 auto;display:block;'  src='images/"+data[0].orderDetails[i].product.imagename+".jpg' alt=' ' class='img-responsive' /></td>";
					var c="<td style='vertical-align: middle;text-align: center;'>"+data[0].orderDetails[i].product.pname+"</td>";
					var d="<td style='vertical-align: middle;text-align: center;'>"+data[0].orderDetails[i].product.price+"</td>";
					var e="<td style='vertical-align: middle;text-align: center;'>"+data[0].orderDetails[i].num+"</td></tr>";
					$("tbody#detail").append(a+b+c+d+e);
				}	
			}
		});
		$("div#detail").show();
		$(".profile-detail").show();
	});
	$(".glyphicon-check").on('click', function(){
		var oid=$(this).attr("value");
		$.ajax({
			url:"${pageContext.request.contextPath}/tuihuoss?oid="+oid,
			type:"GET",
			dataType:'text',
			success:function(data){
				if(data==1)
					history.go(0);
			}
		})
	});
	</script>
</body>
</html>