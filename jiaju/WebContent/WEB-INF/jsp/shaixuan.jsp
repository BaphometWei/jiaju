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
$(function(){
	$("#div a").click(function(){
		var a=$(this).attr("value");
		$(this).parent().parent().attr("value",a)
		var b=$("#style").attr("value");
		var c=$("#function1").attr("value");
		var d=$("#material").attr("value");
		var e=$("#search").val();
		var url=encodeURI("${pageContext.request.contextPath}/sortxp?style="+b+"&function="+c+"&material="+d+"&search="+e+"&xiaoliang=0");
		window.location.href=url;
		return false;
});
	$("button[id='xiaoliang']").click(function(){
		var i=$(this);
		if($(this).attr("value")=="1"){
			$(this).attr("value","0");
			$(this).attr("class","btn btn-default");
			var b=$("#style").attr("value");
			var c=$("#function1").attr("value");
			var d=$("#material").attr("value");
			var e=$("#search").val();
			window.location.href=encodeURI("${pageContext.request.contextPath}/sortxp?style="+b+"&function="+c+"&material="+d+"&search="+e+"&xiaoliang=0");
			
		}
		else {
			var f=i.attr("leixing");
			var b=$("#style").attr("value");
			var c=$("#function1").attr("value");
			var d=$("#material").attr("value");
			var e=$("#search").val();
			window.location.href=encodeURI("${pageContext.request.contextPath}/sortxp?style="+b+"&function="+c+"&material="+d+"&search="+e+"&xiaoliang="+f);
		}
	});
	if($("#hidden").attr("value")==3){
		$(".leixing3").addClass("btn-warning");
		$(".leixing3").attr("value","1");
	}
	if($("#hidden").attr("value")==4){
		$(".leixing4").addClass("btn-warning");
		$(".leixing4").attr("value","1");
	}
	if($("#hidden").attr("value")==2){
		$(".leixing1").addClass("btn-warning");
		$(".leixing1").attr("value","1");
	}
	if($("#hidden").attr("value")==1){
		$(".leixing2").addClass("btn-warning");
		$(".leixing2").attr("value","1");}
		
})
$(function() {
	var b=$("#style").attr("value");
	var c=$("#function1").attr("value");
	var d=$("#material").attr("value");
	var e=$("#search").val();
	var f=$("#hidden").attr("value");
	var start=parseInt($("#start").attr("value"));
	var count=parseInt($("#count").attr("value"));
	var last=parseInt($("#last").attr("value"));
	var total=parseInt($("#total").attr("value"));
	var url=encodeURI("${pageContext.request.contextPath}/sortxp?style="+b+"&function="+c+"&material="+d+"&search="+e+"&xiaoliang="+f);
	if(start==0)
		$(".pagination").append("<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
	else
		$(".pagination").append("<li><a href='"+url+"&start="+(start-count)+"' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
	if(total%count==0)
		var total1=Math.floor(total/count);
	else
		var total1=Math.floor(total/count)+1;
	var start1=start/count;
	if(total1<=5){
		for(var i=1;i<=total1;i++){
			if((start1+1)==i)
				$(".pagination").append("<li class='disabled'><a style='background-color: #e7e6e8;' href='#'>"+i+"</a></li>");
			else
				$(".pagination").append("<li><a href='"+url+"&start="+((i-1)*count)+"'>"+i+"</a></li>");				
		}
	}else{
		if((start1+1)<5){
			for(var i=1;i<=5;i++){
				if((start1+1)==i)
					$(".pagination").append("<li class='disabled'><a style='background-color: #e7e6e8;' href='#'>"+i+"</a></li>");
				else
					$(".pagination").append("<li><a href='"+url+"&start="+((i-1)*count)+"'>"+i+"</a></li>");				
			}
			$(".pagination").append("<li class='disabled'><a>...</a></li>");
		}else{
			$(".pagination").append("<li><a href='"+url+"&start=0'>"+1+"</a></li>");
			$(".pagination").append("<li><a href='"+url+"&start="+count+"'>"+2+"</a></li>");
			$(".pagination").append("<li class='disabled'><a>...</a></li>");
			$(".pagination").append("<li><a href='"+url+"&start="+(start-count)+"'>"+start1+"</a></li>");
			$(".pagination").append("<li class='disabled'><a style='background-color: #e7e6e8;' href='#'>"+(start1+1)+"</a></li>");	
			if(start!=last){
				$(".pagination").append("<li><a href='"+url+"&start="+(start+count)+"' >"+(start1+2)+"</a></li>");
				if(((start1+2)*count)<total)
					$(".pagination").append("<li class='disabled'><a>...</a></li>");	
			}
		}
	}
	if(start==last)
		$(".pagination").append("<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
	else
		$(".pagination").append("<li><a href='"+url+"&start="+(start+count)+"' aria-label=''><span aria-hidden='true'>&raquo;</span></a></li>");
	$(".pagination").append("<li class='disabled'><a style='background-color:#f6f6f6;border-top:none;border-right:none;border-bottom:none;'>总共"+total1+"页</a></li>");
})
</script>
</head>
<body>
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
											<ul class="multi-column-dropdown" id="material" value="${material}">
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
			<div style="padding-left: 20px;">
			<span class="label label-info">风格：${style}</span><span class="label label-info">功能：${function}</span><span class="label label-info">材料：${material}</span>
			<button type="button" id="xiaoliang" class="btn btn-default leixing1" leixing="2" value="0" style="height: 26px;width:60px;line-height: 0.8;outline:none;">销量<i class="glyphicon glyphicon-arrow-up" style="height: 18px;line-height: 0.7;outline:none;" aria-hidden="true"></i></button>
			<button type="button" id="xiaoliang" class="btn btn-default leixing2" leixing="1" value="0" style="height: 26px;width:60px;line-height: 0.8;outline:none;">销量<i class="glyphicon glyphicon-arrow-down" style="height: 18px;line-height: 0.7;outline:none;" aria-hidden="true"></i></button>
			<button type="button" id="xiaoliang" class="btn btn-default leixing3" leixing="3" value="0" style="height: 26px;width:60px;line-height: 0.8;outline:none;">价格<i class="glyphicon glyphicon-arrow-up" style="height: 18px;line-height: 0.7;outline:none;" aria-hidden="true"></i></button>
			<button type="button" id="xiaoliang" class="btn btn-default leixing4" leixing="4" value="0" style="height: 26px;width:60px;line-height: 0.8;outline:none;">价格<i class="glyphicon glyphicon-arrow-down" style="height: 18px;line-height: 0.7;outline:none;" aria-hidden="true"></i></button>
		</div>
		</div>
</div>
<input type="hidden" id="hidden" value="${leixing}"></input>
<input type="hidden" id="last" value="${page.last}" ></input>
<input type="hidden" id="start" value="${page.start}" ></input>
<input type="hidden" id="count" value="${page.count}" ></input>
<input type="hidden" id="total" value="${total}" ></input>
</body>
</html>