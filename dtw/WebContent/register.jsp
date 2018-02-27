<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>注册界面</title>
</head>
<link rel="stylesheet" type="text/css" href="css/register.css"  />
<script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
<script src="js/register.js" type="text/javascript"></script>
<body>
	<div id="form-header" class="header">
			<div class="logo-con w clearfix">
				<img src="img/logo-login.png" id="logo"/>
				<div class="logo-title">欢迎注册</div>
				<div class="have-account">已有账号？
					<a href="login.jsp">请登录</a>
				</div>
			</div>

		</div>

			<div class="main clearfix" id="form-main">
				<div class="reg-form fl">
					<form action="" id="register-form" method="post" >
						<div class="form-item form-item-account" id="form-item-account">
							<label>用　户　名</label>
							<input id="form-account"  name="regName" class="field" autocomplete="off" maxlength="20" required="required" placeholder="4-12个字符（英文,下划线,数字）" type="text">
							<img class="i-status" src="img/right.png" >
							<div class="input-tip">
							<span></span>
						</div>
						</div>
						
						<div class="form-item" style="z-index: 12;">
							<label>设 置 密 码</label>

							<input name="pwd" id="form-pwd" class="field" maxlength="20"  required="required"  placeholder="至少8个字符（英文,下划线,数字）" type="password">
							<img class="i-status" src="img/right.png" >
							<div class="capslock-tip tips" style="display: none;">大写已开启<b class="arrow"></b><b class="arrow-inner"></b></div>
							<div class="capslock-tip tips" style="display: none;background-color: aliceblue;">大写已开启<b class="arrow"></b><b class="arrow-inner"></b></div>
							<div class="input-tip">
							<span></span>
						</div>
						</div>
						
						<div class="form-item" style="z-index: 12;">
							<label>确 认 密 码</label>

							<input name="pwdRepeat" id="form-equalTopwd" class="field"  required="required"  placeholder="请再次输入密码" maxlength="20" type="password">
							<img class="i-status" src="img/right.png" >
							<div class="input-tip">
								<span></span>
							</div>
							<span class="orPhone">
								邮 箱 验证
							</span>
						</div>
						
							<div class="item-email-wrap" style="display: none;">
							<div class="form-item">
								<label>邮 箱 验 证</label>
								<input name="email" id="form-email" class="field ignore"    placeholder="建议使用常用邮箱" type="text">
								<img class="i-status" src="img/right.png" >
								<div class="input-tip">
								<span></span>
							</div>
							</div>
						</div>
						<div class="item-phone-wrap">
							<div class="form-item form-item-phone">
								<label class="select-country" id="select-country" country_id="0086">手机号</label>
								<input id="form-phone" name="phone" class="field"  required="required"  placeholder="建议使用常用手机" autocomplete="off" maxlength="11" type="text">
								<img class="i-status" src="img/right.png" >
								<div class="input-tip">
								<span></span>
							</div>
							</div>
							
						</div>
						
						</div>

						<div class="form-item form-item-phonecode">
							<label>手机验证码</label>
							<input name="mobileCode" maxlength="6" id="phoneCode" required="required"  class="field phonecode" placeholder="请输入手机验证码" type="text">
							<button id="getPhoneCode" class="btn-phonecode"   type="button">获取验证码</button>
						
						</div>
						
						<div>
							<button type="submit" class="btn-register">立即注册</button>
						</div>

					</form>
					
				</div>
			</div>

			<div id="form-footer" class="footer ">
				<div class="links">
					<a rel="nofollow" target="_blank" > 关于我们</a>|
					<a rel="nofollow" target="_blank" >联系我们</a>|
					<a rel="nofollow" target="_blank" >人才招聘</a>|
					<a rel="nofollow" target="_blank" >商家入驻</a>|
					<a rel="no  follow" target="_blank" >广告服务</a>|
					<a target="_blank" >销售联盟</a>|
				</div>
				<div class="copyright">
					Copyright©2004-2016&nbsp;&nbsp;大田物流&nbsp;版权所有
				</div>

			</div>
	
</body>
</html>