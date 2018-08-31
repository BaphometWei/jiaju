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
				var chk_value =[];
				var nums=[];
				$("input[type='checkbox']").prop("checked",true);
				$("input[name='Id']:checked").each(function(){ 
	        		chk_value.push($(this).val()); 
	        		nums.push($(this).parent().parent().find("#num").val());
	        	});
				$.ajax({
					url:'${pageContext.request.contextPath}/getsc1?checks='+chk_value+"&nums="+nums,
					type:'GET',
					dataType:'text',
					success:function(data){
						$("#zongjia").text(data);
					}
				})
			}
			else{
				$("input[type='checkbox']").prop("checked",false);
				$("#zongjia").text("0");
			}
		});
		$("input[name='Id']").click(function(){
			if($(this).prop("checked")==false)
				$("#all").prop("checked",false);
			var chk_value =[];
			var nums=[];
			var price=$("#zongjia").text();
			$("input[name='Id']:checked").each(function(){ 
        		chk_value.push($(this).val()); 
        		nums.push($(this).parent().parent().find("#num").val());
        	});
			$.ajax({
				url:'${pageContext.request.contextPath}/selectsc?checks='+chk_value+"&nums="+nums,
				type:"GET",
				dataType:"text",
				success:function(data){
					$("#zongjia").text(data);
				}
			});
		});
		$("input#num").blur(function(){
		    var num=$(this).val();
		    var pid=$(this).parent().parent().parent().parent().parent().children().children().attr("value");
		    var price=$(this).parent().parent().parent().parent().parent().find("#price").html();
		    var b=0,c=0;
		    $.ajax({
				url:'${pageContext.request.contextPath}/getpnum?pid='+pid,
				type:"GET",
				async: false,
				dataType:"text",
				success:function(data){
					b=data;
				}
			});
		    if(parseInt(num)>parseInt(b)||parseInt(num)<1){
		    	alert("请填写1-"+b+"的数字");
		    	$(this).val("1");
		    	if($(this).parent().parent().parent().parent().parent().children().children().prop("checked")==true){
		    		var chk_value =[];
					var nums=[];
					$("input[name='Id']:checked").each(function(){ 
		        		chk_value.push($(this).val()); 
		        		nums.push($(this).parent().parent().find("#num").val());
		        	});
					$.ajax({
						url:'${pageContext.request.contextPath}/selectsc?checks='+chk_value+"&nums="+nums,
						type:"GET",
						dataType:"text",
						success:function(data){
							$("#zongjia").text(data);
						}
					});
		    	}
		    	return;
		    }else{
		    	if($(this).parent().parent().parent().parent().parent().children().children().prop("checked")==true){
		    		var chk_value =[];
					var nums=[];
					$("input[name='Id']:checked").each(function(){ 
		        		chk_value.push($(this).val()); 
		        		nums.push($(this).parent().parent().find("#num").val());
		        	});
					$.ajax({
						url:'${pageContext.request.contextPath}/selectsc?checks='+chk_value+"&nums="+nums,
						type:"GET",
						dataType:"text",
						success:function(data){
							$("#zongjia").text(data);
						}
					});
		    }else{
		    	}
		    }
		  });
		$("#gouwu").click(function(){
			var ap;
			$.ajax({
				url:'${pageContext.request.contextPath}/judgeap',
				type:'GET',
				async: false,
				dataType:'text',
				success:function(data){
					if(data==0)
						ap="0";
				}
			});
			if(ap=="0"){
				alert("请填写你的详细地址和联系电话！");
				window.location.href="${pageContext.request.contextPath}/huoqu";
			}else{
			if($("input[type='checkbox']").is(':checked')==true){
				var r=confirm("确认购买？")
				if(r){
				var ids =[];
				var nums=[];
				var price=$("#zongjia").text();
				$("input[name='Id']:checked").each(function(){ 
        			ids.push($(this).val()); 
        			nums.push($(this).parent().parent().find("#num").val());
        		});
				$.ajax({
					url:'${pageContext.request.contextPath}/jiesuan?ids='+ids+'&nums='+nums+'&price='+price,
					type:'GET',
					dataType:'text',
					success:function(data){
						if(data==1){
							alert("购买成功！");
							window.location.href="${pageContext.request.contextPath}/getsc";
						}
					}
				})
			}
			}else 
				alert("您尚未选择商品！");
		}
			return false;
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
							window.location.href="${pageContext.request.contextPath}/getsc";
						}
					}
				})
				}
			}else 
				alert("您尚未选择商品！");
			return false;
		});
		if($("input#shixiao").attr("value")=="1")
			$(".checkout-right-basket").append("<a id='shixiao' href='${pageContext.request.contextPath}/getsxsc'>&ensp;已失效的购物车&thinsp;&thinsp;</a>");
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
				<li class="active">购物车</li>
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
							<th>购买</th>
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
									<div class="value"><input pid="${s.product.id}" id="num" style="text-align:center;width:38px;height: 40px;margin-top:-10px;" type="text" value="${s.num}"/></div>
									<div value="${s.product.id}" class="entry value-plus active">&nbsp;</div>
								</div>
							</div>
						</td>
						<td class="invert">${s.product.pname}</td>
						<td class="invert"><span>$</span><span id="price">${s.product.price}</span></td>
						<td class="invert"><div class="glyphicon glyphicon-ok" style="cursor:pointer;"></div></td>
						<td class="invert">
							<div class="rem">
								<div class="glyphicon glyphicon-remove" style="cursor:pointer;"></div>
							</div>
						</td>
					</tr>
					</c:forEach>
					</c:forEach>
									<script>
									$('.glyphicon-ok').on('click', function(){
										var ap;
										$.ajax({
											url:'${pageContext.request.contextPath}/judgeap',
											type:'GET',
											async: false,
											dataType:'text',
											success:function(data){
												if(data==0)
													ap="0";
											}
										});
										if(ap=="0"){
											alert("请填写你的详细地址和联系电话！");
											window.location.href="${pageContext.request.contextPath}/huoqu";
										}else{
											var r=confirm("确认购买？")
											if(r){
											var pid=$(this).parent().parent().find("#id").attr("value");
											var num=$(this).parent().parent().find("#num").val();
											var price=$(this).parent().parent().find("#price").text();
											$.ajax({
												url:'${pageContext.request.contextPath}/addOrder?pid='+pid+'&num='+num+'&price='+price,
												type:'GET',
												dataType:'text',
												success:function(data){
													if(data==1)
														alert("购买成功！");
												}
											})
											$(this).parent().parent().remove();
											}
										}
									});
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
									$('.value-plus').on('click', function(){
										var divUpd = $(this).prev().children(), newVal = parseInt(divUpd.val(), 10)+1;
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
										if(newVal<=parseInt(b)){
										divUpd.val(newVal);
										if($(this).parent().parent().parent().parent().find("#id").prop("checked")==true){
 											var sum=parseInt($("#zongjia").text())+parseInt($(this).parent().parent().parent().parent().find("#price").text());
 											$("#zongjia").html(sum.toString());
										}	
										}
									});

									$('.value-minus').on('click', function(){
										var divUpd = $(this).next().children(), newVal = parseInt(divUpd.val(), 10)-1;
										if(newVal>=1) {
											divUpd.val(newVal);
										if($(this).parent().parent().parent().parent().find("#id").prop("checked")==true){
 											var sum=parseInt($("#zongjia").text())-parseInt($(this).parent().parent().parent().parent().find("#price").text());
 											$("#zongjia").html(sum.toString());
										}
										}
									});
									</script>
								<!--quantity-->
				</table>
			</div>
			<div class="checkout-left">	
				<div class="checkout-left-basket animated wow slideInLeft" data-wow-delay=".5s">
					<h4>Continue to basket</h4>
					<ul>
						<li>总价 <i>-</i><span>$</span><span id="zongjia">0</span></li>
					</ul>
				</div>
				<div class="checkout-right-basket animated wow slideInRight" data-wow-delay=".5s">
					<a id="gouwu" href="#">结算</a><a style="margin-left: 3px;" id="delete" href="#">删除</a><br /><br />
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
</body>
</html>