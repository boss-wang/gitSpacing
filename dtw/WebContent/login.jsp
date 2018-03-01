<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>欢迎登录大田物流</title>
</head>
<link href="css/login.css"  rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
<style>
	#prompt{
	color:red;
	position:relative;
	top:-30px;
	}
</style>
<body>
		<header>
			<img src="img/logo-login.png" id="logo" />
			<div>
				<span>欢迎登录</span>
			</div>
		</header>
		<main>
			<div>
				<form action="" method="post">
					<ul>
						<li><span>用户登陆</span>
							<a href="register.jsp"><img src="img/icon5.jpg">&nbsp;立即注册</a>
						</li>
						<li>
							<a href="zh"><img src="img/icon1.jpg"></a><input required="" type="text" id="loginName" placeholder=" 邮箱/用户名/已验证手机"></li>
						<li>
							<a href="mm"><img src="img/icon2.jpg"></a><input required="" type="password" id="paswd" placeholder=" 密码"><span id="prompt"></span></li>
						<li><input type="checkbox"> 自动登录
							<a href="">忘记密码?</a>
						</li>
						<li><input type="submit" id="" value="登 录"></li>
					</ul>
				</form>


			</div>
		</main>
</body>
<script>
	$("form").submit(function(){
		var reg1=/^[A-Za-z0-9_]{4,12}$/;
		var reg2=/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
		var reg3=/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
		var loginName = $("#loginName").val();
		var paswd=$("#paswd").val();
		if(reg1.test(loginName)||reg2.test(loginName)||reg3.test(loginName)){
			$("#prompt").text("");
			$.ajax({
				url:"custlogin.do?mn=customerlogin",
				data:"loginName="+loginName+"&paswd="+paswd,
				type:"post",
				success:function(res){
					if(res==1){
						window.location.href="<%=basePath%>index.jsp";
					}else if(res==2){
						$("#prompt").text("密码错误");
					}else if(res==0){
						$("#prompt").text("用户不存在");
					}
				}
			})
		}else{
			$("#prompt").text("用户不存在");
		}
		return false;
	})
</script>
</html>