<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<html>


	<body>
		<div id="header">
			<div class="container clearfix">
				<div class="logo">
					<a href="#"></a>
				</div>
				<div class="nav" id="menu">
					<ul id="nav">
						<li class="mainlevel active">
							<a title="首页" href="homepage.html" class="menu">首页</a>
						</li>
						<li class="mainlevel">
							<a title="关于大田" href="" class="menu">关于大田</a>
							<ul style="display: none;">
								<li>
									<a title="公司简介" href="#abstract">公司简介</a>
								</li>

							</ul>
						</li>
						<li class="mainlevel">
							<a title="服务项目" href="" class="menu">服务项目</a>
							<ul style="display: none;">
								<li>
									<a title="城际快运" href="">快速下单</a>
								</li>
								<li>
									<a title="贸易物流" href="">订单追踪</a>
								</li>

							</ul>
						</li>
						<li class="mainlevel">
							<a title="新闻中心" href="tradeNews.html" class="menu">新闻中心</a>
							<ul style="display: none;">
								<li>
									<a title="行业新闻" href="tradeNews.html">行业新闻</a>
								</li>
								<li>
									<a title="帮助支持" href="serviceTerms.html">帮助支持</a>
								</li>
							</ul>
						</li>
						<li class="mainlevel">
							<a title="登陆/注册" href="" class="menu">登陆/注册</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--header end-->

		<a name="abstract"></a>
		<div class="index-about">
			<div class="container">
				<div class="index-title">
					<a href="#" title="公司简介">请绑定公司</a>
				</div>
				<div class="cont">
					<form action="" method="post">
						<div id="" style="height: 30px;margin-left:393px;">
							<h3 style="display: inline-block;color: #555555;">公司名称:</h3>
							<input style="width:300px;height: 24px; margin-left: 5px;" placeholder="请输入公司名称" />
						</div>
						<div id="" style="height: 120px;margin-left:393px;margin-top: 10px;">
							<h3 style="display: inline-block;color: #555555;position: absolute;">公司地址:</h3>
							<!--<input style="width:300px;height: 24px; margin-left: 5px;" placeholder="请输入公司地址" />-->
							<textarea name="" rows="" cols="" style="width:300px;height: 100px; margin-left: 90.2px;" placeholder="请输入公司地址"></textarea>
						</div>
						<div id="" style="height: 30px;margin-left:482px;margin-top: 10px;">
							<input type="button" name="" id="" value="确认绑定" style="height:30px;width: 100px;border: 1px solid orangered;background-color: orangered;color: white;" />
							<input type="reset" name="" id="" value="重新填写" style="height:30px;width: 100px;border: 1px solid orangered;background-color: orangered;color: white;margin-left: 102px;" />
						</div>

					</form>
				</div>
				<!--cont end-->
			</div>
			<!--container end-->
		</div>
		
		<!--news end-->
		</div>
		

	</body>

</html>