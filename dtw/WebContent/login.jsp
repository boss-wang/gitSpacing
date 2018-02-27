<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>欢迎登录大田物流</title>
</head>
<link href="css/login.css"  rel="stylesheet" type="text/css" />
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
							<a href="zh"><img src="img/icon1.jpg"></a><input required="" type="text" placeholder=" 邮箱/用户名/已验证手机"></li>
						<li>
							<a href="mm"><img src="img/icon2.jpg"></a><input required="" type="password" placeholder=" 密码"></li>
						<li><input type="checkbox"> 自动登录
							<a href="">忘记密码?</a>
						</li>
						<li><input type="submit" value="登 录"></li>
					</ul>
				</form>


			</div>
		</main>
</body>
</html>