<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/style2.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
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

	var url1="${pageContext.request.contextPath}/pjiazai";
	$.getJSON(url1,function(data){

		for(var i=0;i<=data.length;i++){
			var id=data[i].id;
			var pname=data[i].pname;
			var im=data[i].imagename;
			var price=data[i].price;
			var string1="<div class='col_1_of_3 span_1_of_3 simpleCart_shelfItem' style='margin-left: auto;width:25%;'><div class='inner_content clearfix'>";
			var string2="<div class='product_image'><a id='productdetail' href='#' value='"+id+"'><img src='images/"+im+".jpg' class='img-responsive' alt='' /></a>";
			var string3="<a href='' value='"+id+"' class='button item_add item_1'></a><div class='product_container'><div class='cart-left'>";
			var string4="<p class='title'>"+pname+"</p></div><span class='amount item_price'>$"+price+"</span><div class='clearfix'></div>";
			var string5="</div></div><div class='sale-box1'><span class='on_sale1 title_shop'>New</span></div></div></div>";
			$(".content_grid").append(string1+string2+string3+string4+string5);
		}
		});
})
	$(document).on("click",".item_add",function(){
		if($("#jiazai").attr("value")=="null"){
			alert("尚未登录！请登录后再操作");
			return false;
		}
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
		return false;
    });
$(document).on("click","a#productdetail",function(){
	var value=$(this).attr("value");
	window.open("${pageContext.request.contextPath}/product?id="+value);
	return false;
});
</script>
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
<div class="banner">
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
  </ol>
 
  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/jiaju1.jpg" />
    </div>
    <div class="item">
            <img src="images/jiaju4.jpg" />
    </div>
    <div class="item">
            <img src="images/jiaju3.jpg" />
    </div>
 
    <div class="item">
            <img src="images/jiaju2.jpg" />
    </div>
 
  </div>
 
  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
 
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
 
  </a>
 
</div>	
</div>
	<div class="new-collections">
		<div class="container"  style="width:1500px">
			<h3 class="animated wow zoomIn" data-wow-delay=".5s">新品上架</h3>
			<p class="est animated wow zoomIn" data-wow-delay=".5s">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia 
				deserunt mollit anim id est laborum.</p>
			<div class="new-collections-grids" id="jiazai" value="<%=request.getSession().getAttribute("Login")%>">
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
		<div class="container">

			<div class="row">
			<div class="col-md-9" style="width:100%">
				 <div class="content_grid">
				  
			  </div>
			  </div>
			</div>
		 </div>
</body>
</html>