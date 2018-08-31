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
		$("#all").click(function(){
			if($(this).prop("checked")){
				$("input[type='checkbox']").prop("checked",true);
			}
			else{
				$("input[type='checkbox']").prop("checked",false);
			}
		});
		$("input[name='Id']").click(function(){
			if($(this).prop("checked")==false)
				$("#all").prop("checked",false);
		});
		$("#delete").click(function(){
			if($("input[type='checkbox']").is(':checked')==true){
				var r=confirm("确认删除？")
				if(r){
				var ids =[];
				$("input[name='Id']:checked").each(function(){ 
        			ids.push($(this).val()); 
        		});
				$.ajax({
					url:'${pageContext.request.contextPath}/deletesc1?ids='+ids,
					type:'GET',
					dataType:'text',
					success:function(data){
						if(data==1){
							alert("商品已从购物车中移除！");
							window.location.href="${pageContext.request.contextPath}/getsxsc";
						}
					}
				})
				}
			}else 
				alert("您尚未选择商品！");
			return false;
		});
	});
	$(document).on("click","a#productdetail",function(){
	var value=$(this).attr("value");
	window.open("${pageContext.request.contextPath}/product?id="+value);
	return false;
});
</script>
<style type="text/css">
	html{ overflow-y:scroll;} 
	html{ overflow-y:scroll; min-height:101%;margin: 0;} 
	html{ overflow:-moz-scrollbars-vertical;} 
	</style>
</head>
	
<body>
<input type="hidden" id="shixiao" value="${shixiao}"></input>
<%@include file="MasterPage2.jsp"%>
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="${pageContext.request.contextPath}/shouye"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
				<li class="active">失效的购物车</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- checkout -->
	<div class="checkout">
		<div class="container">
			<div class="checkout-right animated wow slideInUp" data-wow-delay=".5s">
				<table class="timetable_sub">
					<thead>
						<tr>
							<th><input type="checkbox" group-checkable" id="all"/></th>
							<th>Product</th>
							<th>Quality</th>
							<th>Product Name</th>
							<th>Price</th>
							<th>删除</th>
						</tr>
					</thead>
					<c:forEach items="${users}" var="u" varStatus="st">
					<c:forEach items="${u.shoppingCarts}" var="s" varStatus="st1">
					<tr class="rem1" value="1234">
						<td class="invert"><input value="${s.product.id}" id="id" type="checkbox" class="checkboxes" name="Id" value="" /></td>
						<td class="invert-image"><a id="productdetail" value="${s.product.id}" href="single.html"><img src="images/${s.product.imagename}.jpg" alt=" " class="img-responsive" /></a></td>
						<td class="invert">
							 <div class="quantity"> 
								<div class="quantity-select">                           
									<div class="entry value-minus">&nbsp;</div>
									<div class="value"><input pid="${s.product.id}" id="num" disabled="disabled" style="text-align:center;width:38px;height: 40px;margin-top:-10px;" type="text" value="${s.num}"/></div>
									<div value="${s.product.id}" class="entry value-plus active">&nbsp;</div>
								</div>
							</div>
						</td>
						<td class="invert">${s.product.pname}</td>
						<td class="invert"><span>$</span><span id="price">${s.product.price}</span></td>
						<td class="invert">
							<div class="rem">
								<div class="glyphicon glyphicon-remove" style="cursor:pointer;"></div>
							</div>
						</td>
					</tr>
					</c:forEach>
					</c:forEach>
									<script>
									$('.glyphicon-remove').on('click', function(){
										var r=confirm("确认删除？")
										if(r){
										var pid=$(this).parent().parent().parent().find("#id").attr("value");
										$.ajax({
											url:'${pageContext.request.contextPath}/deletesc?pid='+pid,
											type:'GET',
											dataType:'text',
											success:function(data){
												if(data==1)
													alert("商品已从购物车中移除！");
											}
										})
										$(this).parent().parent().parent().remove();
										}
									});
									</script>
								<!--quantity-->
				</table>
			</div>
			<div class="checkout-left">
				<div class="checkout-right-basket animated wow slideInRight" data-wow-delay=".5s">
					<a id="delete" href="#">删除</a><a style="margin-left: 3px;" href="${pageContext.request.contextPath}/getsc">返回购物车</a>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
</body>
</html>