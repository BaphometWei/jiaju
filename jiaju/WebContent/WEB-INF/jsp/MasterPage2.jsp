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
<link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet" /> 
</head>	
<body>
		<div class="container" style="width:100%;">
			<div class="header-grid">
				<div class="header-grid-left animated wow slideInLeft" data-wow-delay=".5s" style="float: right;">
					<ul>
						<li><i class="glyphicon glyphicon-user" aria-hidden="true"></i><%=request.getSession().getAttribute("Login")%></li>
						<li><i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i><a href="${pageContext.request.contextPath}/getsc">购物车</a></li>
						<li><i class="glyphicon glyphicon-tags" aria-hidden="true"></i><a href="${pageContext.request.contextPath}/ddinfo">订单信息</a></li>
						<li><i class="glyphicon glyphicon-info-sign" aria-hidden="true"></i><a href="${pageContext.request.contextPath}/huoqu">个人资料</a></li>
						<li><i class="glyphicon glyphicon-log-out" aria-hidden="true"></i><a href="${pageContext.request.contextPath}/zhuxiao">注销</a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</body>
</html>
