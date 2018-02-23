<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>欢迎使用</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/animate.min.css" rel="stylesheet">
		<link href="css/font-awesome.min.css" rel="stylesheet">
		<link href="css/form.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<link href="css/icons.css" rel="stylesheet">
		<link href="css/generics.css" rel="stylesheet">
        <link rel="stylesheet" href="css/add.css" />
</head>


<body id="skin-blur-blue">
		<header id="header" class="media">
			<a id="menu-toggle"></a>
			<a class="logo pull-left" href="">${user.userName}</a>

			<div class="media-body">
				<div class="media" id="top-menu">
					<div id="second" style="width: 50px ;height: 50px;float: right;font-size: 20px;padding-top: 10px; margin-right: 4px;"></div>
					<div id="time" class="pull-right">
						
					</div>
					
					<div class="media-body">
						<input type="text" class="main-search" placeholder="搜索内容">
					</div>
				</div>
			</div>
		</header>
		
		<aside id="sidebar">

			<!-- 头像-->
			<div class="side-widgets overflow">
				<div class="text-center s-widget m-b-25 dropdown" id="profile-menu">
						<img class="profile-pic animated"  src="${user.showPicPath}" title="点击修改" alt="">
					
				</div>
				<!-- 职位描述 -->
				<div class="s-widget m-b-25">
					<div class="s-widget-body">
						<div class="side-border">
							<h5>职位描述</h5>

						</div>

					</div>
				</div>
			</div>
			
			<!-- Side Menu -->
			
			<ul class="list-unstyled side-menu">
				    <li class="active">
                        <a class="sa-side-home" href="" >
                            <span class="menu-item">主界面</span>
                        </a>
                    </li>
				<li class="dropdown">
					<a class="sa-side-form" >
						<span class="menu-item">员工管理</span>
					</a>
					<ul class="list-unstyled menu-item">
						<li>
							<a id="addUser">添加员工</a>
						</li>
						<li>
							<a id="updateUser">员工管理</a>
						</li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="sa-side-form2" >
						<span class="menu-item">客户管理</span>
					</a>
					<ul class="list-unstyled menu-item">
						<li>
							<a id="addClient">添加客户</a>
						</li>
						<li>
							<a id="updateClient">客户管理</a>
						</li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="sa-side-form3" >
						<span class="menu-item">供应商管理</span>
					</a>
					<ul class="list-unstyled menu-item">
						<li>
							<a id="addSupplier">添加供应商</a>
						</li>
						<li>
							<a id="updateSupplier">供应商管理</a>
						</li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="sa-side-ui" >
						<span class="menu-item">订单管理</span>
					</a>
					<ul class="list-unstyled menu-item">
						<li>
							<a id="addOrder">新建订单</a>
						</li>
						<li>
							<a id="showOrder">管理订单</a>
						</li>
					</ul>
				</li>
				
				
			</ul>
			
		</aside>
		<div id="headpics"></div>
		<section id="home"></section>
		<div class="homeTip"></div>
	</body>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
	<script type="text/javascript" src="js/time.js"></script>
	<script type="text/javascript" src="js/hiddenlist.js" ></script>
	<script type="text/javascript">
		
		$("#addUser").click(function(){
			$("#home").load("user.do","mn=goAddUser");
		})
		$("#updateUser").click(function(){
			$("#home").load("user.do","mn=showUser");
		})
		$("#addOrder").click(function(){
			$("#home").load("order.do","mn=goAddOrder");
		})
		$("#addClient").click(function(){
			$("#home").load("/dtw/admin/addClient.jsp");
		})
		$("#updateClient").click(function(){
			$("#home").load("client.do?mn=showClient");
		})
		$("#addSupplier").click(function(){
			$("#home").load("admin/addSupplier.jsp");
		})
		$("#updateSupplier").click(function(){
			$("#home").load("supplier.do","mn=showSupplier");
		})
		$("#showOrder").click(function(){
			$("#home").load("/dtw/admin/showOrder.jsp");
		})
		$("#profile-menu").click(function(){
		var userid = ${user.userId};
		$("#headpics").show();
		$("#headpics").load("user.do?mn=showAllHeadPic&userid="+userid);
		})
	</script>
	
</html>