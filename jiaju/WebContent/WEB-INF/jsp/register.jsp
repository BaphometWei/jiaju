<?xml version="1.0" encoding="UTF-8" ?>
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
<script type="text/javascript">
function panduan(){
	if($("#pwd").val()==$("#pwd2").val()){
		var username=$("#username").val();
		$.ajax({
			url:'${pageContext.request.contextPath}/register3?username='+username,
			type:'GET',
			dataType:'text',
			success:function(data){
				if(data==0){
					$("#xiaoyan").text("用户名已存在！");
				}
				else{
					alert("注册成功！");
					$("#form").submit();
				}
			}
		});
	}
	else
		alert("2次输入密码不一致！");
			
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
				<li class="active">注册</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- register -->
	<div class="register">
		<div class="container">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">注   册</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia 
				deserunt mollit anim id est laborum.</p>
			<div class="login-form-grids">
				<form id="form" class="animated wow slideInUp" data-wow-delay=".5s" action="${pageContext.request.contextPath}/register">
					<input id="username" name="username" type="text" placeholder="Email Address" required=" " />
					<a id="xiaoyan" style="color:red;"></a>
					<input id="pwd" name="pwd" type="password" placeholder="Password" required=" " />
					<input id="pwd2" type="password" placeholder="Password Confirmation" required=" " />
<!-- 					<div class="register-check-box"> -->
<!-- 						<div class="check"> -->
<!-- 							<label class="checkbox"><input type="checkbox" name="checkbox"><i> </i>I accept the terms and conditions</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<input type="button" value="注册" onclick="panduan()" />
				</form>
			</div>
		</div>
	</div>
<!-- //register -->
</body>
</html>