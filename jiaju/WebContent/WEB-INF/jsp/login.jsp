<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
function panduan(){
	var flag = true;
	var username=$("#username").val();
	var pwd=$("#pwd").val();
	$.ajax({
		url:'${pageContext.request.contextPath}/panduan?username='+username+'&pwd='+pwd,
		type:'GET',
		async:false,//设置同步方式，非异步！  
        cache:false,//严格禁止缓存
		dataType:'text',
		success:function(data){
			if(data==0){
				alert("用户名或密码错误！");
				flag=false;	
			}
		}
	});
	if(!flag)
		return flag;
	}
	
</script>

</head>	
<body>
<%@include file="MasterPage1.jsp"%>
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="${pageContext.request.contextPath}/shouye"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
				<li class="active">登录</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- login -->
	<div class="login">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">登    录</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia 
				deserunt mollit anim id est laborum.</p>
			<div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
				<form action="${pageContext.request.contextPath}/login" method="post" onsubmit="return panduan()">
					<input id="username" name="username" type="text" placeholder="Email Address" required=" " />
					<input id="pwd" name="pwd" type="password" placeholder="Password" required=" " />
					<div class="forgot">
						<a href="#">忘记密码?</a>
					</div>
					<input type="submit" value="Login" />
				</form>
			</div>
			<h4 class="animated wow slideInUp" data-wow-delay=".5s">For New People</h4>
			<p class="animated wow slideInUp" data-wow-delay=".5s"><a href="register.html">注册</a> (Or) 返回 <a href="index.html">首页<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
		</div>
	</div>
<!-- //login -->
</body>
</html>