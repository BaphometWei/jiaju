<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/lanrenzhijia.css" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<style type="text/css">
html{ overflow-y:scroll;} 
html{ overflow-y:scroll; min-height:101%;margin: 0;} 
html{ overflow:-moz-scrollbars-vertical;} 
</style>
</head>
<body>
<%@include file="MasterPage2.jsp"%>
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="${pageContext.request.contextPath}/shouye"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
				<li class="active">订单信息</li>
			</ol>
		</div>
	</div>
<div class="checkout">
	<div class="container">
		<div id="tablewrapper">
						<div id="tableheader">
							<div class="search">
								<select id="columns" onchange="sorter.search('query')"></select>
								<input type="text" id="query" onkeyup="sorter.search('query')" />
							</div>
							<span class="details">
								<div>Records <span id="startrecord"></span>-<span id="endrecord"></span> of <span id="totalrecords"></span>
								</div>
						<div>
							<a href="javascript:sorter.reset()">reset</a>
						</div>
						</span>
					</div>
					<table cellpadding="0" cellspacing="0" border="0" id="table" class="table table-bordered">
						<thead>
							<tr>
								<th class="nosort" style="text-align: center">
									<h8>订单编号</h8>
								</th>
								<th style="text-align: center">
									<h8>总价</h8>
								</th>
								<th style="text-align: center">
									<h8>地址</h8>
								</th>
								<th style="text-align: center">
									<h8>联系电话</h8>
								</th>
								<th style="text-align: center">
									<h8>购买日期</h8>
								</th>
								<th style="text-align: center">
									<h8>物流</h8>
								</th>
								<th style="text-align: center">
									<h8>明细</h8>
								</th>
							</tr>
						</thead>
						<tbody>
					<c:forEach items="${os}" var="o" varStatus="st1">
					<tr class="rem1">
						<td style="text-align: center" value="${o.id}">${o.id}</td>
						<td style="text-align: center"><span>$</span><span id="sum">${o.sum}</span></td>
						<td style="text-align: center">${o.address}</td>
						<td style="text-align: center">${o.phone}</td>
						<td style="text-align: center">${o.addtime}</td>
						<td style="text-align: center"><a id="color" style="color:#f0ad4e">${o.wuliu}</a></td>
						<td style="text-align: center"><div value="${o.id}" class="glyphicon glyphicon-ok" style="cursor:pointer;"></div></td>
					</tr>
					</c:forEach>
						</tbody>
					</table>
					<div id="tablefooter">
						<div id="tablenav">
							<div>
								<img src="${pageContext.request.contextPath}/css/images/first.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1,true)" />
								<img src="${pageContext.request.contextPath}/css/images/previous.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1)" />
								<img src="${pageContext.request.contextPath}/css/images/next.gif" width="16" height="16" alt="First Page" onclick="sorter.move(1)" />
								<img src="${pageContext.request.contextPath}/css/images/last.gif" width="16" height="16" alt="Last Page" onclick="sorter.move(1,true)" />
							</div>
							<div>
								<select id="pagedropdown"></select>
							</div>
						</div>
						<div id="tablelocation">

							<div class="page">Page <span id="currentpage"></span> of <span id="totalpages"></span></div>
						</div>
					</div>
					
				</div>
				<div>
				<div class="checkout-right animated wow slideInUp" data-wow-delay=".5s" style="display: none;width:86.2%;margin:auto;margin-top: 50px;">
				<table class="timetable_sub">
					<thead>
						<tr>
							<th style="text-align: center">订单编号</th>
							<th style="text-align: center">Product</th>
							<th style="text-align: center">Pname</th>
							<th style="text-align: center">Price</th>
							<th style="text-align: center">Num</th>
						</tr>
					</thead>
					<tbody id="biaoge2">
					</tbody>
					</table>
					<input type="hidden" value="${oid.wuliu}" />
					<div style="margin:auto;margin-top:20px;" id="value" class="checkout-right-basket animated wow slideInRight" data-wow-delay=".5s">
					</div>
					</div>
					</div>
					
	</div>
</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lanrenzhijia.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	});
	var sorter = new TINY.table.sorter('sorter','table',{
		headclass:'head',
		ascclass:'asc',
		descclass:'desc',
		evenclass:'evenrow',
		oddclass:'oddrow',
		evenselclass:'evenselected',
		oddselclass:'oddselected',
		paginate:true,
		size:10,
		colddid:'columns',
		currentid:'currentpage',
		totalid:'totalpages',
		startingrecid:'startrecord',
		endingrecid:'endrecord',
		totalrecid:'totalrecords',
		hoverid:'selectedrow',
		pageddid:'pagedropdown',
		navid:'tablenav',
		columns:[{index:7, format:'%', decimals:1},{index:8, format:'$', decimals:0}],
		init:true
	});
	$('.glyphicon-ok').on('click', function(){
		var oid=$(this).attr("value");
		$("tbody#biaoge2").text("");
		$.ajax({
			url:"${pageContext.request.contextPath}/getoid?oid="+oid,
			type:"GET",
			dataType:"json",
			success:function(data){
				for(var i=0;i<data[0].orderDetails.length;i++){
					var a="<tr class='rem1'><td class='invert' id='oid'>"+data[0].id+"</td><td class='invert-image' ><a>";
					var b="<img style='height:130px;width:180px;'  src='images/"+data[0].orderDetails[i].product.imagename+".jpg' alt=' ' class='img-responsive' /></a></td>";
					var c="<td class='invert'>"+data[0].orderDetails[i].product.pname+"</td>";
					var d="<td class='invert'>$"+data[0].orderDetails[i].product.price+"</td>";
					var e="<td class='invert'>"+data[0].orderDetails[i].num+"</td></tr>";
					$("tbody#biaoge2").append(a+b+c+d+e);
				}
				$("#value").text("");
				if(data[0].wuliu=="0")
					$("#value").append("<a id='quxiao' style='background:#d9534f;' href='#'>取消订单</a>");
				if(data[0].wuliu=="1")
					$("#value").append("<a id='shouhou' style='background:#d9534f;' href='#'>申请售后</a><a id='shouhuo' style='margin-left:3px;background:#f0ad4e;' href='#'>确认收货</a>");
				if(data[0].wuliu=="2")
					$("#value").append("<a style='background:#449d44;'>已收货</a>");
				if(data[0].wuliu=="3")
					$("#value").append("<a style='background:#5bc0de;'>申请售后中</a>");
				if(data[0].wuliu=="4")
					$("#value").append("<a style='background:#5bc0de;'>退货中</a>");
				if(data[0].wuliu=="5")
					$("#value").append("<a style='background:#5bc0de;'>退货退款成功</a>");
				if(data[0].wuliu=="6")
					$("#value").append("<a style='background:#5bc0de;'>订单已取消</a>");
			}
		});
		$(".slideInUp").css("display","block");
	});
	$(document).on("click","#quxiao",function(){
		var value=$("#oid:first").text();
		var r=confirm("确认取消订单？");
		if(r){
			window.location.href="${pageContext.request.contextPath}/quxiao?oid="+value;
		}
		return false;
	});
	$(document).on("click","#shouhou",function(){
		var value=$("#oid:first").text();
		$("#value").append("<br /><br />请选择退货理由：<select id='type' class='form-control' name='type'><option value='七天无理由退货'>七天无理由退货</option><option value='质量问题'>质量问题</option><option value='少件'>少件</option><option value='商品破损'>商品破损</option><option value='卖家发错货'>卖家发错货</option></select><button value='"+value+"' style='margin-top:5px;' id='tijiao' class='btn btn-warning'>提交</button>");
		return false;
	});
	$(document).on("click","#tijiao",function(){
		var value=$("#tijiao").attr("value");
		var reason=$("#type").val();
		$.ajax({
			url:'${pageContext.request.contextPath}/shouhou?oid='+value+'&reason='+reason,
			type:'GET',
			dataType:'text',
			success:function(data){
				if(data==1)
					history.go(0);
			}
		})
	});
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
	});
  	</script>
</body>
</html>