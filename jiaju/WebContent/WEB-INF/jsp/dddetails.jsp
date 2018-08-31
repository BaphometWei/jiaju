<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var value=$("input[type='hidden']").attr("value");
		if(value=="0")
			$("#value").append("<a id='quxiao' style='background:#d9534f;' href='#'>取消订单</a>");
		if(value=="1")
			$("#value").append("<a id='shouhou' style='background:#d9534f;' href='#'>申请售后</a><a id='shouhuo' style='margin-left:3px;background:#f0ad4e;' href='#'>确认收货</a>");
		if(value=="2")
			$("#value").append("<a style='background:#449d44;'>已收货</a>");
		if(value=="3")
			$("#value").append("<a style='background:#5bc0de;'>申请售后中</a>");
		if(value=="4")
			$("#value").append("<a style='background:#5bc0de;'>退货中</a>");
		if(value=="5")
			$("#value").append("<a style='background:#5bc0de;'>退货退款成功</a>");
	})
	$(document).on("click","#quxiao",function(){
		var value=$("#oid:first").text();
		var r=confirm("确认取消订单？");
		if(r){
			window.location.href="${pageContext.request.contextPath}/quxiao?oid="+value;
		}
		return false;
	})
	$(document).on("click","#shouhou",function(){
		var value=$("#oid:first").text();
		var r=confirm("确认申请售后？");
		if(r){
			$.ajax({
				url:'${pageContext.request.contextPath}/shouhou?oid='+value,
				type:'GET',
				dataType:'text',
				success:function(data){
					if(data==1)
						history.go(0);
				}
			})
		}
		return false;
	})
	$(document).on("click","#shouhuo",function(){
		var value=$("#oid:first").text();
		var r=confirm("确认收货？");
		if(r){
			$.ajax({
				url:'${pageContext.request.contextPath}/shouhuo?oid='+value,
				type:'GET',
				dataType:'text',
				success:function(data){
					if(data==1)
						history.go(0);
				}
			})
		}
		return false;
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
				<li><a href="${pageContext.request.contextPath}/ddinfo">订单信息</a></li>
				<li class="active">订单明细</li>
			</ol>
		</div>
	</div>
<div class="checkout">
		<div class="container">
			<div class="checkout-right animated wow slideInUp" data-wow-delay=".5s">
				<table class="timetable_sub">
					<thead>
						<tr>
							<th>订单编号</th>
							<th>Product</th>
							<th>Pname</th>
							<th>Price</th>
							<th>Num</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${os1}" var="o" varStatus="st">
					<c:forEach items="${o.orderDetails}" var="p" varStatus="st1">
					<tr class="rem1">
						<td class="invert" id="oid">${o.id}</td>
						<td class="invert-image" ><a><img style="height:130px;width:180px;"  src="images/${p.product.imagename}.jpg" alt=" " class="img-responsive" /></a></td>
						<td class="invert">${p.product.pname}</td>
						<td class="invert">${p.product.price}</td>
						<td class="invert">${p.num}</td>
						
					</tr>
					</c:forEach>
					</c:forEach>
					</tbody>
					</table>
					</div>
					<input type="hidden" value="${oid.wuliu}" />
					<div style="margin-top:20px;" id="value" class="checkout-right-basket animated wow slideInRight" data-wow-delay=".5s">		
					</div>
					</div>
					</div>
</body>
</html>