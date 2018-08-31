<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/style2.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).on("click",".item_add",function(){
	if($("#jiazai").attr("value")=="null")
		alert("尚未登录！请登录后再操作");
	else{
    var pid=$(this).attr("value");
    var b=0;
    $.ajax({
		url:'${pageContext.request.contextPath}/getpnum?pid='+pid,
		type:"GET",
		async: false,
		dataType:"text",
		success:function(data){
			b=data;
		}
	});
    if(parseInt(b)>0){
	$.ajax({
		url:'${pageContext.request.contextPath}/addsc?pid='+pid,
		type:'GET',
		dataType:'text',
		success:function(data){
			if(data==1)
				alert("加入购物车成功！");
			if(data==0)
				alert("已在购物车内！");
		}
	});
    }else{
    	alert("该商品暂时无货！");
    }
	}
	return false;
});
$(document).on("click","a#productdetail",function(){
	var value=$(this).attr("value");
	window.open("${pageContext.request.contextPath}/product?id="+value);
	return false;
});
$(function(){
	var start=$("#start").attr("value");
	var chk_value =[];
	$("input#sum").each(function(){
		chk_value.push($(this).attr("value")); 
	});
	var i=start;
		$("div.simpleCart_shelfItem").each(function(){
			$(this).append("<span class='item_price' style='font-size:xx-small;float:right;margin-top:0px;margin-right:15px;'>月销量:"+chk_value[i++]+"</span>")
		})
})
</script>
<style type="text/css">
	html{ overflow-y:scroll;} 
	html{ overflow-y:scroll; min-height:101%;margin: 0;} 
	html{ overflow:-moz-scrollbars-vertical;} 
	</style>
</head>
<body>
<%if(request.getSession().getAttribute("Login")==null){%>
<%@include file="MasterPage1.jsp" %>
<%}else{%>
<%@include file="MasterPage2.jsp" %>
<%}%>
<%@include file="shaixuan.jsp"%>

<br /><br />
<div class="new-collections">
		<div class="container"  style="width:1200px;margin-top: -100px;">
			<div class="new-collections-grids" id="jiazai" value="<%=request.getSession().getAttribute("Login")%>">
			</div>
		</div>
		<div class="container">

			<div class="row">
			<div class="col-md-9" style="width:100%">
				 <div class="content_grid">
					<c:forEach items="${ps}" var="c" varStatus="st">
					<div class='col_1_of_3 span_1_of_3 simpleCart_shelfItem' style='margin-left: auto;width:25%;'><div class='inner_content clearfix'>
				   <div class='product_image'><a id="productdetail" href='' value='${c.id}'><img src="${pageContext.request.contextPath}/images/${c.imagename}.jpg" class='img-responsive' alt='' /></a>
				   <a href='' class='button item_add item_1' value='${c.id}'></a><div class='product_container'><div class='cart-left'>
				   <p class='title'>${c.pname}</p></div><span class='amount item_price'>$${c.price}</span><div class='clearfix'></div>
				   </div></div></div></div>
				    </c:forEach>
				   <div class="clearfix"></div>
			  </div>
			  </div>
			</div>
		 </div>
		 <c:forEach items="${sum}" var="s" varStatus="st">
		 <input type="hidden" id="sum" value='${s}'></input>
		 </c:forEach>
		 <nav style="text-align:center;">
  <ul class="pagination pagination-lg">
  </ul>
</nav>
</div>
</body>
</html>