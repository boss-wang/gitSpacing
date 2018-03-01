<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	#delesession:hover{
	cursor: pointer;
	color:blue;
	}

</style>
<head>
		<title>大田物流集团</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="keywords" content="大田, 大田集团, 大田物流, 物流配送, 仓储物流, VMI, 陆运, 海运, 空运, 货运, 公路运输, 物流解决方案, 供应链, 冷链, 危险品运输">
		<meta name="description" content="中国最优秀的以供应链管理为核心的综合物流供应商">
		<link rel="stylesheet" href="css/homepage.css">
		<link rel="shortcut icon" href="images/homepage/fav.ico">
		<!--收藏夹小图标-->
		<link rel="bookmark" href="images/homepage/fav.ico" />
		

	</head>

	<body>
		<div id="header">
			<div class="container clearfix">
				<div class="logo">
					<a href="#"></a>
				</div>
				<div class="nav" id="menu">
					<ul id="nav">
						<li class="mainlevel active">
							<a title="首页" href="index.jsp" class="menu">首页</a>
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
							<a title="新闻中心" id="newsCenter" class="menu">新闻中心</a>
							<ul style="display: none;">
								<li>
									<a title="行业新闻" id="tradeNews">行业新闻</a>
								</li>
								<li>
									<a title="帮助支持" href="serviceTerms.html">帮助支持</a>
								</li>
							</ul>
						</li>
					<c:if test="${customer==null }"><li class="mainlevel">
							<a title="登陆" href="login.jsp" class="menu">登陆</a>
								<a title="" href="register.jsp">/注册</a>
						</li>
						</c:if>
						<c:if test="${customer!=null }">
						<li class="mainlevel" style="font-size: 15px; position:relative;top:30px;" >
							${customer.loginName}<span id="delesession" style="display:inline;float: none;">/注销</span>
						</li>
						</c:if>	
					</ul>
				</div>
			</div>
		</div>
		<!--header end-->
		<div class="index-slider">
			<div class="wrapper">
				<div class="fullwidthbanner-container">
					<div class="fullwidthbanner  full-1">
						<ul>
							<li data-transition="fade" data-slotamount="15" data-masterspeed="300" data-link="#">
								<img src="images/homepage/banner_1a.jpg" alt="" />
							</li>
							<li data-transition="fade" data-slotamount="15" data-masterspeed="300" data-link="#">
								<img src="images/homepage/banner_2a.jpg" alt="" />
							</li>
							<li data-transition="fade" data-slotamount="15" data-masterspeed="300" data-link="#">
								<img src="images/homepage/banner_3a.jpg" alt="" />
							</li>
							<li data-transition="fade" data-slotamount="15" data-masterspeed="300" data-link="#">
								<img src="images/homepage/banner_4a.jpg" alt="" />
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="index-ico">
				<ul class="clearfix">
					<li class="o1"><span>采购供应</span></li>
					<li class="o2"><span>仓储配送</span></li>
					<li class="o3"><span>大田转运</span></li>
					<li class="o4"><span>国际物流</span></li>
				</ul>
			</div>
		</div>
		<!--index-ico end-->
		<a name="abstract"></a>
		<div class="index-about" id="homeDiv" >
			<div class="container">
				<div class="index-title">
					<a href="#"  title="公司简介">公司简介</a>
				</div>
				<div class="cont">

					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大田集团创立于1992年，是经中国对外贸易经济合作部（现商务部）、中国民航总局（现中国民航局）批准的一类一级国际货运代理企业，国际航空运输协会成员，2001年被国家经贸委列为国家重点扶持的物流企业之一。大田集团总部位于北京，目前在国内主要城市和经济区域拥有33个综合物流配送中心、23个国际货运代理公司、7个保税仓库，营业网点192个，构筑起完善的集空运、海运和陆运的物流网络服务平台。承办海运、陆运、空运进出口货物和国际展品、私人物品及过境货物的国际运输代理业务，包括：揽货、订舱、包机、中转、集装箱拼装拆箱、结算运杂费、报关、报验、保险、国际多式联运及相关的短途运输服务及咨询业务；仓储、货物装卸、搬倒、加工、包装、配送及信息处理服务和咨询业务；普通货物运输；国内公路运输；进出口贸易；危险品鉴定、包装、运输。</p>

				</div>
				<!--cont end-->
			</div>
			<!--container end-->
		</div>
		<!--about end-->
		<div class="index-news">
			<div class="container clearfix">
				<div class="cont">
					<div class="pic">
						<a href="tradeNews.html" title="行业新闻">
							<IMG src="images/homepage/index-pic1.jpg">
						</a>
					</div>
					<dl>
						<dt><a href="" target="_blank" title="汽配进口清关/刹车片车轮毂引擎进口报关">汽配进口清关/刹车片车轮毂引擎进口报关</a></dt>
						<dt><a href="" target="_blank" title="奢侈品代收转运|包税清关转运内地">奢侈品代收转运|包税清关转运内地</a></dt>
						<dt><a href="" target="_blank" title="运动系列/nike/adidas/Air jordan/新百伦/球服/鞋帽/进口报关/包税进口">运动系列/nike/adidas/Air jordan/新百伦/球服/鞋帽/进口报关/包税进口</a></dt>
						<dt><a href="" target="_blank" title="猫粮进口清关/狗粮进口报关/鼠粮进口代理/宠物食品包税进口">猫粮进口清关/狗粮进口报关/鼠粮进口代理/宠物食品包税进口</a></dt>
						<dt><a href="" target="_blank" title="印度雪松种子辣木籽进口清关">印度雪松种子辣木籽进口清关</a></dt>

					</dl>
				</div>
				<div class="cont">
					<div class="pic">
						<a href="" title="服务项目">
							<IMG src="images/homepage/index-pic2.jpg">
						</a>
					</div>
					<dl>
						<dt><a href="" target="_blank" title="快速下单">快速下单</a></dt>
						<dt><a href="" target="_blank" title="订单追踪">订单追踪</a></dt>
						
					</dl>
				</div>
				<div class="cont last">
					<div class="pic">
						<a href="serviceTerms.html" title="帮助支持">
							<IMG src="images/homepage/index-pic3.jpg">
						</a>
					</div>
					<dl>
						<dt><a href="" target="_blank" title="投诉建议？">投诉建议</a></dt>
						<dt><a href="" target="_blank" title="法律声明？">法律声明</a></dt>
						<dt><a href="" target="_blank" title="常见进口货物">常见进口货物</a></dt>
						<dt><a href="" target="_blank" title="关口禁运物品">关口禁运物品</a></dt>

					</dl>
				</div>
			</div>
		</div>
		<!--news end-->
		<!--index-contact-bg end-->
		<div class="bottom">
			<div class="container clearfix">
				<div class="bottom-link">
					客服电话:400-626-1166
					<br />
					<a href="adminIndex.html" target="_blank" title="大田集团办公平台">大田集团办公平台</a>
					|
					<a href="" target="_blank" title="华田集团官网">华田集团官网</a>
					|
					<a href="" target="_blank" title="中华企业录">中华企业录</a>
					|
					<a href="" target="_blank" title="中国产品网">中国产品网</a>
					|
					<a href="" target="_blank" title="环球贸易网">环球贸易网</a>
					|
					<a href="" target="_blank" title="万国企业网">万国企业网</a>
					|
					<a href="" target="_blank" title="跨国采购网">跨国采购网</a>
					|
					<a href="" target="_blank" title="商务联盟">商务联盟</a>
					|
					<a href="" target="_blank" title="企汇网">企汇网</a>
					|
					<a href="" target="_blank" title="中国企业链">中国企业链</a>
					|
					<a href="" target="_blank" title="中国供应商">中国供应商</a>
					<br /> 版权所有&copy;
					<a href="" title="天津大田集团有限公司 " target="_blank">
						天津大田集团有限公司版权所有 </a> 技术支持:
					<a href="" >KD03-一个神秘的小组</a>
					<br />
					<a href=""  title="工信部网站查询">津ICP备07001462号</a>
				</div>
				<div class="bottom-code">
					<img src="images/homepage/btn_qrcode2.png" width="80" height="80" alt="微信号：大田物流" />
					<span>微信号：大田物流</span>
				</div>
			</div>
		</div>
		<!--row end-->
	</body>
	
		<!-- 自定义javascript框架区 starts -->
		<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="js/full.js"></script>
		<script type="text/javascript" src="js/banner.js"></script>
		<script type="text/javascript" src="js/slide.js"></script>
		<script type="text/javascript" src="js/main.js"></script>
		<!-- 自定义javascript框架区 ends -->
		<script type="text/javascript">
			$("#newsCenter").click(function(){
				window.location.href="#abstract";
				$("#homeDiv").load("tradeNews.html");
			});
			$("#tradeNews").click(function(){
				window.location.href="#abstract";
				$("#homeDiv").load("tradeNews.html");
			});
			$("#delesession").click(function(){
				<%
				request.getSession().removeAttribute("customer");
				%>
				window.location.href="<%=basePath%>index.jsp";
			})
		</script>
</html>