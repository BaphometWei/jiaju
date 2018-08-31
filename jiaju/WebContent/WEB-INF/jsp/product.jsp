<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/product/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/product/css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product/css/flexslider.css" type="text/css" media="screen" />
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function () {
	$("#div a").click(function(){
		var a=$(this).attr("value");
		$(this).parent().parent().attr("value",a)
		var b=$("#style").attr("value");
		var c=$("#function1").attr("value");
		var d=$("#material").attr("value");
		var e=$("#search").val();
		window.location.href=encodeURI("${pageContext.request.contextPath}/sortxp?style="+b+"&function="+c+"&material="+d+"&search="+e+"&xiaoliang=0");
		return false;
	});
    })
    $(document).on("click","a.item_add",function(){
							if($(this).attr("value1")=="null")
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
$(document).on("click","a#xiaoliang",function(){
	var value=$(this).attr("value");
	window.open("${pageContext.request.contextPath}/product?id="+value);
	return false;
});
$(document).on("click","a#productdetail",function(){
	var value=$(this).attr("value");
	window.open("${pageContext.request.contextPath}/product?id="+value);
	return false;
});
				
</script>
<title>Insert title here</title>
</head>
<body>
<%if(request.getSession().getAttribute("Login")==null){%>
<%@include file="MasterPage1.jsp" %>
<%}else{%>
<%@include file="MasterPage2.jsp" %>
<%}%>
<div class="header">
<div class="container">
			<div class="logo-nav">
				<div class="logo-nav-left animated wow zoomIn" data-wow-delay=".5s">
					<h1><a>&nbsp;家     具&nbsp;</a></h1>
				</div>
				<div class="logo-nav-left1">
					<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header nav_2">
						<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div> 
					<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
						<ul class="nav navbar-nav">
							<li class="active"><a href="${pageContext.request.contextPath}/shouye" class="act">首页</a></li>	
							
							<li class="active"><a href="${pageContext.request.contextPath}/allproduct" class="act">所有宝贝</a></li>	
							<!-- Mega Menu -->
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">风  格<b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="row">
										<div id="div" class="col-sm-4" style="width:100px;">
											<ul class="multi-column-dropdown" id="style" value="${style}">
												<li><a value="所有" href="#">所有</a></li>
												<li><a value="现代" href="#">现代</a></li>
												<li><a value="后现代" href="#">后现代</a></li>
												<li><a value="欧式古典" href="#">欧式古典</a></li>
												<li><a value="美式" href="#">美式</a></li>
												<li><a value="中式古典" href="#">中式古典</a></li>
												<li><a value="新古典" href="#">新古典</a></li>
												<li><a value="新装饰" href="#">新装饰</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">功  用<b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="row">
										<div id="div" class="col-sm-4" style="width:100px;">
											<ul class="multi-column-dropdown" id="function1" value="${function}">
												<li><a value="所有" href="#">所有</a></li>
												<li><a value="床" href="#">床</a></li>
												<li><a value="茶几" href="#">茶几</a></li>
												<li><a value="桌椅" href="#">桌椅</a></li>
												<li><a value="镜子" href="#">镜子</a></li>
												<li><a value="化妆台" href="#">化妆台</a></li>
												<li><a value="沙发" href="#">沙发</a></li>
												<li><a value="柜" href="#">柜</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">材  质<b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="row">
										<div id="div" class="col-sm-4" style="width:100px;">
											<ul class="multi-column-dropdown" id="material" value="">
												<li><a value="所有" href="#">所有</a></li>
												<li><a value="玉石" href="#">玉石</a></li>
												<li><a value="实木" href="#">实木</a></li>
												<li><a value="软体" href="#">真皮</a></li>
												<li><a value="藤编" href="#">藤竹</a></li>
												<li><a value="金属" href="#">金属</a></li>
												<li><a value="玻璃" href="#">玻璃</a></li>
												<li><a value="陶瓷" href="#">陶瓷</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul>
							</li>
						</ul>
					</div>
					</nav>
				</div>
				<div class="logo-nav-right">
					<div class="search-box">
						<div id="sb-search" class="sb-search" style="width:300px;">
							<form action="${pageContext.request.contextPath}/searchproduct" method="post" enctype="mutipart/form-data">
								<input name="pname" class="sb-search-input" placeholder="Enter your search iterm..." value="${search}" type="text" id="search" />
								<span class="sb-icon-search"><input class="sb-search-submit" type="submit" value="搜索" /></span>
							</form>
						</div>
					</div>
						<!-- search-scripts -->
						<script src="js/classie.js"></script>
						<script src="js/uisearch.js"></script>
							<script>
								new UISearch( document.getElementById( 'sb-search' ) );
							</script>
						<!-- //search-scripts -->
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
</div>
<div class="single" style="border-top-style:inset;">
<div class="container">
<div class="col-md-9">
	<div class="col-md-5 grid">		
		<div class="flexslider">
			  <ul class="slides">
			    <li data-thumb="${pageContext.request.contextPath}/images/${product.imagename}.jpg">
			        <div class="thumb-image" style="width:334px;"> <img src="${pageContext.request.contextPath}/images/${product.imagename}.jpg" data-imagezoom="true" class="img-responsive" /> </div>
			    </li>
			    <li data-thumb="${pageContext.request.contextPath}/images/${product.imagename1}.jpg">
			         <div class="thumb-image" style="width:334px;"> <img src="${pageContext.request.contextPath}/images/${product.imagename1}.jpg" data-imagezoom="true" class="img-responsive" /> </div>
			    </li>
			    <li data-thumb="${pageContext.request.contextPath}/images/${product.imagename2}.jpg">
			       	<div class="thumb-image"  style="width:334px;"> <img src="${pageContext.request.contextPath}/images/${product.imagename2}.jpg" data-imagezoom="true" class="img-responsive" /> </div>
			    </li> 
			  </ul>
		</div>
	</div>	
<div class="col-md-7 single-top-in">
						<div class="single-para simpleCart_shelfItem">
							<h1 style="color: black;">${product.pname}</h1>
							<br />
							<br /><br />
							<br /><br />
							<div class="star-on">
								<ul>
									<li><a style="color:indianred;">质量：<i class="glyphicon glyphicon-star"> </i></a></li>
									<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
									<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
									<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
									<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
								</ul>
							<div class="available">
								<h8 style="color:indianred;">库存 :<span style="color:black;">&nbsp;${product.num}件</span></h8>
								<label  class="add-to item_price">$${product.price}</label>
								<a href="#" value1="<%=request.getSession().getAttribute("Login")%>" value="${product.id}" class="cart item_add" style="background-color: #f0ad4e;">加入购物车</a>
							</div>
							</div>
								<span>标签：<a href="${pageContext.request.contextPath}/sortxp?style=${product.style}&function=&material=&search=&xiaoliang=0">${product.style}</a>&nbsp;<a href="${pageContext.request.contextPath}/sortxp?style=&function=${product.function}&material=&search=&xiaoliang=0">${product.function}</a>&nbsp;<a href="${pageContext.request.contextPath}/sortxp?style=&function=&material=${product.material}&search=&xiaoliang=0">${product.material}</a></span>
						</div>
					</div>
			
			<div class="clearfix"> </div>	
			<div class="content-top1">
			<ul id="myTab" class="nav nav-tabs">
   			<li class="active">
      			<a href="#dota" data-toggle="tab">详情</a>
   			</li>
   			<li><a href="#lol" data-toggle="tab">评论</a></li>
			</ul>
			<div id="myTabContent" class="tab-content">
   				<div class="tab-pane fade in active" id="dota">
      			<img style="margin-bottom: 10px;" src="${pageContext.request.contextPath}/images/${product.imagename1}.jpg" data-imagezoom="true" class="" />
      			<img style="margin-bottom: 10px;" src="${pageContext.request.contextPath}/images/${product.imagename2}.jpg" data-imagezoom="true" class="" />
      			<br /><br />
      			<p>${product.miaoshu}</p>
   				</div>
   			<div class="tab-pane fade" id="lol">
     			 <p>《英雄联盟》（简称lol）是由美国Riot Games开发，中国大陆地区由腾讯游戏运营的网络游戏。</p>
   			</div>
   			</div>
   			<div style="height:200px"></div>
			</div>	
</div>
<!----->
<div class="col-md-3 product-bottom">
				<div class="product-bottom">
						<h3 class="cate">Best Sell</h3>
						<br /><br />
					<c:forEach items="${products}" var="ps" varStatus="st">
					<div class="product-go">
						<div class=" fashion-grid">
							<a id="productdetail" href='' value="${ps.id}"><img class="img-responsive"  src="${pageContext.request.contextPath}/images/${ps.imagename}.jpg" alt="" /></a>	
						</div>
						<div class="fashion-grid1">
							<h6 class="best2"><a id="xiaoliang" href='' value="${ps.id}" href="single.html" >${ps.pname}</a></h6>
							<span class=" price-in1">$${ps.price}</span>
						</div>	
						<div class="clearfix"> </div>
					</div>
					</c:forEach>	
				</div>	
		</div>
		<div class="clearfix"> </div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/css/product/js/imagezoom.js"></script>
<script defer src="${pageContext.request.contextPath}/css/product/js/jquery.flexslider.js"></script>
<script>
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>
<script src="${pageContext.request.contextPath}/css/product/js/jquery.magnific-popup.js" type="text/javascript"></script>
<!---//pop-up-box---->
					 <script>
						$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type: 'inline',
							fixedContentPos: false,
							fixedBgPos: true,
							overflowY: 'auto',
							closeBtnInside: true,
							preloader: false,
							midClick: true,
							removalDelay: 300,
							mainClass: 'my-mfp-zoom-in'
						});															
						});
				</script>	
</body>
</html>