<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>后台管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/lanrenzhijia.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vendor/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vendor/linearicons/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css/main.css" />
</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="index.html"><img src="${pageContext.request.contextPath}/css/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo" /></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="${pageContext.request.contextPath}/shouhouorder" class="dropdown-toggle icon-menu">
								<i class="lnr lnr-alarm"></i>
								<span class="badge bg-danger"></span>
							</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-question-circle"></i> <span>帮助</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">Basic Use</a></li>
								<li><a href="#">Working With Data</a></li>
								<li><a href="#">Security</a></li>
								<li><a href="#">Troubleshooting</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-user"></i><span>admin</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
								<li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
								<li><a href="#"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul>
						</li>
						<!-- <li>
							<a class="update-pro" href="#downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
						</li> -->
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="${pageContext.request.contextPath}/houtai" class=""><i class="lnr lnr-home"></i> <span>首页</span></a></li>
						<li>
							<a href="#subPages1" data-toggle="collapse" class="active"><i class="lnr lnr-user"></i> <span>用户管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages1" class="collapse in">
								<ul class="nav">
									<li><a href="${pageContext.request.contextPath}/userguanli" class="active">用户信息</a></li>
									<li><a href="${pageContext.request.contextPath}/usertj" class="">用户统计</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>订单管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse ">
								<ul class="nav">
									<li><a href="${pageContext.request.contextPath}/allorder" class="">全部订单</a></li>
									<li><a href="${pageContext.request.contextPath}/weifahuo" class="">未发货订单</a></li>
									<li><a href="${pageContext.request.contextPath}/shouhouorder" class="">申请售后订单</a></li>
									<li><a href="${pageContext.request.contextPath}/tuihuo" class="">退货订单</a></li>
									<li><a href="${pageContext.request.contextPath}/ordertj" class="">订单统计</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="#subPages2" data-toggle="collapse" class="collapsed"><i class="lnr lnr-inbox"></i> <span>商品管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages2" class="collapse">
								<ul class="nav">
									<li><a href="${pageContext.request.contextPath}/productguanli" class="">全部商品</a></li>
									<li><a href="${pageContext.request.contextPath}/addproduct" class="">添加商品</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
			<!-- MAIN -->
			<div class="main" style="margin-top: 80px;">
				<div class="panel-body" id="main1" style="margin-left: 30px;background-color: #FFFFFF;margin-top:-60px;height: 815px;float: left;">
				
					<div id="tablewrapper" style="display:inline-block;">
					<button class="btn btn-warning"><i class="glyphicon glyphicon-plus"></i>&nbsp;添加</button><br /><br />
						<div id="tableheader">
							<div class="search">
								<select id="columns" onchange="sorter.search('query')"></select>
								<input type="text" id="query" onkeyup="sorter.search('query')" />
							</div>
							<span class="details">
								<div>Records <span id="startrecord"></span>-<span id="endrecord"></span> of <span id="totalrecords"></span></div>
						<div>
							<a href="javascript:sorter.reset()">reset</a>
						</div>
						</span>
					</div>
					<table cellpadding="0" cellspacing="0" border="0" id="table" class="table table-bordered">
            <thead>
                <tr >
                    <th class="nosort" style="border-bottom: none;background-color: #red;"><h8 style="background-color: #fff;">UserID</h8></th>
                    <th style="border-bottom: none;"><h8>用户名</h8></th>
                    <th style="border-bottom: none;"><h8>密码</h8></th>
                    <th style="border-bottom: none;"><h8>用户类型</h8></th>
                    <th style="border-bottom: none;"><h8>性别</h8></th>
                    <th style="border-bottom: none;"><h8>电话</h8></th>
                    <th style="border-bottom: none;"><h8>地址</h8></th>
                    <th style="border-bottom: none;"><h8>注册时间</h8></th>
                    <th style="border-bottom: none;"><h8>编辑</h8></th>
                    <th style="border-bottom: none;"><h8>删除</h8></th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="u" varStatus="st">
            	<tr>
                    <td>${u.id}</td>
                    <td>${u.username}</td>
                    <td>${u.pwd}</td>
                    <td>${u.type}</td>
                    <td>${u.sex}</td>
                    <td>${u.phone}</td>
                    <td>${u.address}</td>
                    <td>${u.rstime}</td>
                    <td value="${u.username}"><a value="edit" href="#">更新</a></td>
                    <td value="${u.username}"><a value="delete" href="#">删除</a></td>
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
				<div style="display:inline-block;height:400px;background-color: #FFFFFF;margin-left: 150px;min-width: 450px;">
			<form id="update" method="post" action="${pageContext.request.contextPath}/gengxin" style="display:inline-block;">
				<fieldset>
					<legend>更新</legend>
					<table>
					<tr>
					<td><label>UserId:</label></td>
					<td><input class="form-control" name="id" id="id" readonly="readonly" type="text" /></td>
					</tr><tr>
					<td><label>UserName:</label></td>
					<td><input class="form-control" name="username" readonly="readonly" id="un" type="text" /></td>
					</tr>
					<tr>
					<td><label>Password:</label></td>
					<td><input class="form-control" name="pwd" id="pwd" type="text" /></td>
					</tr>
					<tr>
					<td><label>Type:</label></td>
					<td><select id="type" class="form-control" name="type">
						<option>==请选择==</option>
						<option value="管理员">管理员</option>
						<option value="会员">会员</option>
						</select></td>
					</tr>
					<tr>
					<td><label>Sex:</label></td>
					<td><input class="form-control" name="sex" id="sex" type="text" /></td>
					</tr>
					<tr>
					<td><label>Phone:</label></td>
					<td><input class="form-control" name="phone" id="phone" type="text" /></td>
					</tr>
					<tr>
					<td><label>Address:</label></td>
					<td><input class="form-control" name="address" id="address" type="text" /></td>
					</tr>
					<tr>
					<td><label>Rstime:</label></td>
					<td><input class="form-control" id="rstime" readonly="readonly" type="text"/><br /></td>
					</tr>
					<tr><td></td><td><button type="submit" class="btn btn-danger">更新</button>&nbsp;&nbsp;<button value="reset" type="reset" class="btn btn-default">重置</button></td></tr>
					</table>
  				</fieldset>
			</form>
			<br />
			<form id="add" method="post" action="${pageContext.request.contextPath}/tianjia" style="display:inline-block;">
				<fieldset>
					<legend>添加</legend>
					<table><tr>
					<td><label>UserName:</label></td>
					<td><input class="form-control" name="username" id="un1" type="text" /><a id="yanzheng" style="color: red;"></a></td>
					</tr>
					<tr>
					<td><label>Password:</label></td>
					<td><input class="form-control" name="pwd" id="pwd1" type="text" /><a id="yanzheng1" style="color: red;"></a></td>
					</tr>
					<tr>
					<td><label>Type:</label></td>
					<td><select id="type1" class="form-control" name="type">
						<option>==请选择==</option>
						<option value="管理员">管理员</option>
						<option value="会员">会员</option>
						</select><a id="yanzheng2" style="color: red;"></a></td>
					</tr>
					<tr>
					<td><label>Sex:</label></td>
					<td><input class="form-control" name="sex" id="sex1" type="text" /></td>
					</tr>
					<tr>
					<td><label>Phone:</label></td>
					<td><input class="form-control" name="phone" id="phone1" type="text" /></td>
					</tr>
					<tr>
					<td><label>Address:</label></td>
					<td><input class="form-control" name="address" id="address1" type="text" /><br /></td>
					</tr>
					<tr><td></td><td><input type="button" class="btn btn-warning" value="添加" onclick="yanzheng()" />&nbsp;&nbsp;<button type="reset" class="btn btn-default">重置</button></td></tr>
					</table>
  				</fieldset>
			</form>
				</div>
			</div>
		</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/lanrenzhijia.js"></script>
	<script type="text/javascript">
	var sorter = new TINY.table.sorter('sorter','table',{
		headclass:'head',
		ascclass:'asc',
		descclass:'desc',
		evenclass:'evenrow',
		oddclass:'oddrow',
		evenselclass:'evenselected',
		oddselclass:'oddselected',
		paginate:true,
		size:15,
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
  	</script>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/klorofil-common.js"></script>
	<script>
		$("a[value='edit']").on('click', function(){
			var username=$(this).parent().attr("value");
			$.ajax({
				url:"${pageContext.request.contextPath}/editusers?username="+username,
				type:"GET",
				dataType:"json",
				success:function(data){
					$("#id").attr("value",data.id);
					$("#un").attr("value",data.username);
					$("#pwd").attr("value",data.pwd);
					$("#type").val(data.type);
					$("#type").attr("value",data.type);
					$("#sex").attr("value",data.sex);
					$("#phone").attr("value",data.phone);
					$("#address").attr("value",data.address);
					$("#rstime").attr("value",data.rstime);
				}
			})
    		$("#add").hide();
			$("#update").show();
			return false;
		});
		$("a[value='delete']").on('click', function(){
			var r=confirm("确认删除？");
			if(r){
			var username=$(this).parent().attr("value");
			alert("删除成功！");
			window.location.href="${pageContext.request.contextPath}/deleteuser?username="+username;}
		});
		$("button[value='reset']").on('click', function(){
			$("#id").attr("value","");
			$("#un").attr("value","");
			$("#pwd").attr("value","");
			$("#type").attr("value","");
			$("#sex").attr("value","");
			$("#phone").attr("value","");
			$("#address").attr("value","");
			$("#rstime").attr("value","");
		});
		function yanzheng(){
			var username=$("#un1").val();
			var pwd=$("#pwd1").val();
			var type=$("#type1").val();
			if(username==""){
				$("#yanzheng").text("用户名不能为空！");
			}else
				$("#yanzheng").text("");
			if(pwd==""){
				$("#yanzheng1").text("密码不能为空！");
			}else
				$("#yanzheng1").text("");
			if(type=="==请选择=="){
				$("#yanzheng2").text("用户类型不能为空！");
			}else
				$("#yanzheng2").text("");
			$.ajax({
				url:'${pageContext.request.contextPath}/register3?username='+username,
				type:'GET',
				async:false,
				dataType:'text',
				success:function(data){
					if(data==0){
						$("#yanzheng").text("用户名已存在！");
					}else{
						alert("添加成功！");
						$("#add").submit();
					}
				}
			});
		}
		$(document).ready(function(){
    		$.ajax({
    			url:"${pageContext.request.contextPath}/shouhoumessage",
    			type:"GET",
    			dataType:"text",
    			success:function(data){
    				$(".bg-danger").text(data);
    			}
    		});
    		$("#update").hide();
    		$("#add").hide();
    	});
		$("button.btn").click(function(){
			$("#update").hide();
    		$("#add").show();
		})
	</script>
</body>
</html>