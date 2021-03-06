<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>后台管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/lanrenzhijia.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vendor/bootstrap/css/bootstrap.min.css" />
	<link href="${pageContext.request.contextPath}/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vendor/linearicons/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/simditor.css" />
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/filein.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/module.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/hotkeys.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/simditor.min.js"></script>
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
						<li><a href="${pageContext.request.contextPath}/houtai" class=""><i class="lnr lnr-home"></i> <span>首页</span></a></li>
						<li>
							<a href="#subPages1" data-toggle="collapse" class="collapsed"><i class="lnr lnr-user"></i> <span>用户管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages1" class="collapse ">
								<ul class="nav">
									<li><a href="${pageContext.request.contextPath}/userguanli" class="">用户列表</a></li>
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
							<a href="#subPages2" data-toggle="collapse" class="active"><i class="lnr lnr-inbox"></i> <span>商品管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages2" class="collapse in">
								<ul class="nav">
									<li><a href="${pageContext.request.contextPath}/productguanli" class="">全部商品</a></li>
									<li><a href="${pageContext.request.contextPath}/addproduct" class="active">添加商品</a></li>
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
			<div class="main-content" id="main2">
				<div class="container-fluid" style="margin-bottom: 30px;">
					<!-- OVERVIEW -->
					<div class="panel panel-headline" style="margin:0 auto;width:100%;min-height: 1050px;">
					<div style="width:70%;margin: 0 auto;">
					<form id="form1" action="${pageContext.request.contextPath}/upload" method="post" class="form-horizontal" style="margin-top:20px;margin-bottom: 20px;" enctype="multipart/form-data">
					<fieldset>
					<legend style="color: #f0ad4e;">添加</legend>
	<div class="form-group">
		<label class="col-sm-2 control-label">商品名称：</label>
		<div class="col-sm-10" id="pname1">
			<input class="form-control" id="pname" name="pname" type="text"  value="" />
		</div>
	</div>
	<div class="form-group">
			<label for="disabledSelect"  class="col-sm-2 control-label">风格：
			</label>
			<div class="col-sm-10" id="style1">
				<select name="style" id="style" class="form-control">
					<option></option>
					<option>现代</option>
					<option>后现代</option>
					<option>欧式古典</option>
					<option>美式</option>
					<option>中式古典</option>
					<option>新古典</option>
					<option>新装饰</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="disabledSelect"  class="col-sm-2 control-label">功用：
			</label>
			<div class="col-sm-10" id="function1">
				<select name="function" id="function" class="form-control">
					<option></option>
					<option>床</option>
					<option>茶几</option>
					<option>桌椅</option>
					<option>镜子</option>
					<option>化妆台</option>
					<option>沙发</option>
					<option>柜</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="disabledSelect"  class="col-sm-2 control-label">材质：
			</label>
			<div class="col-sm-10" id="material1">
				<select name="material" id="material" class="form-control">
					<option></option>
					<option>玉石</option>
					<option>实木</option>
					<option>真皮</option>
					<option>金属</option>
					<option>玻璃</option>
					<option>陶瓷</option>
					<option>藤竹</option>
				</select>
			</div>
		</div>
		<div class="form-group">
		<label class="col-sm-2 control-label">商品价格：</label>
		<div class="col-sm-10" id="price1">
			<input class="form-control" id="price" name="price" type="text"  value="" />
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">商品数量：</label>
		<div class="col-sm-10" id="num1">
			<input class="form-control" id="num" name="num" type="text"  value="" />
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">上传三张图片：</label>
		<div class="col-sm-10" id="allimage">
			<input id="file-0"  class="file" type="file" multiple data-max-file-count="3" name="file" accept="image/*">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">描述详情：</label>
		<div class="col-sm-10">
			<textarea id="editor" name="miaoshu" autofocus></textarea>
		</div>
	</div>
	<div class="form-group">
	<label class="col-sm-2 control-label"></label>
	<div class="col-sm-10">
			<button type="button" onclick="check();" class="btn btn-warning" style="float:center;">提交</button>
		</div>
	</div>
		</fieldset>
</form>
<br />
</div>
					</div>
					<!-- END OVERVIEW -->
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/klorofil-common.js"></script>
	<script type="text/javascript">
	var editor = new Simditor({
  	textarea: $('#editor')
  	//optional options
	});
	function check(){
		var str = document.getElementById("file-0").files.length;
		if($("#pname").val()==""){
			$("#pname1").append("<span class='btn btn-danger'>商品名称不能为空</span>");
			return false;
		}
		if($("#price").val()==""){
			$("#price1").append("<span class='btn btn-danger'>商品价格不能为空</span>");
			return false;
		}
		if($("#num").val()==""){
			$("#num1").append("<span class='btn btn-danger'>商品数量不能为空</span>");
			return false;
		}
		if(str<3){
			$("#allimage").append("<span class='btn btn-danger'>请上传三张图片</span>");
			return false;
		}
		$("#form1").submit();
	}
	</script>
</body>
</html>