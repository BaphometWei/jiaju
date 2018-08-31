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
	$(function(){
		$("button").click(function(){
			var leixing=$(this).prev().attr("id");
			var value=$(this).prev().val();
			if(value=="")
				alert("输入内容为空！请重新输入");
			else {
				var r=confirm("确认修改？")
				if(r){
					alert("修改成功！");
					window.location.href="${pageContext.request.contextPath}/updateuser?leixing="+leixing+"&value="+value;
				}
				else 
					alert("已取消！");
			}
		})
	})	
</script>

</head>	
<body>
<%@include file="MasterPage2.jsp"%>
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="${pageContext.request.contextPath}/shouye"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
				<li class="active">个人资料</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- login -->
<div class="login" style="margin-top: -50px;">
		<div class="container">
			<div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s" />
				<form>
					<input style="margin-top:10px;"  disabled="disabled" id="${id}" type="text" required=" " value="${username}"/>
					<input id="pwd" type="password" required=" " value="${pwd}"/>
					<button style="margin-top:10px;" type="button" class="btn btn-danger">修改密码</button>
					<input id="sex" style="margin-top:10px;"  type="text" required=" " value="${sex}"/>
					<button style="margin-top:10px;" type="button" class="btn btn-danger">修改性别</button>
					<input id="phone" style="margin-top:10px;"  type="text" required=" " value="${phone}"/>
					<button style="margin-top:10px;" type="button" class="btn btn-danger">修改联系电话</button>
					<input id="address" style="margin-top:10px;"  type="text" required=" " value="${add}"/>
					<button style="margin-top:10px;" type="button" class="btn btn-danger">修改收货地址</button><br />
					<a>注册时间：${rstime}</a>
				</form>
			</div>
		</div>
	</div>
<!-- //login -->
</body>
</html>