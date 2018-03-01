<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>大田物流集团</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="keywords" content="大田, 大田集团, 大田物流, 物流配送, 仓储物流, VMI, 陆运, 海运, 空运, 货运, 公路运输, 物流解决方案, 供应链, 冷链, 危险品运输">
		<meta name="description" content="中国最优秀的以供应链管理为核心的综合物流供应商">
		<link rel="stylesheet" href="css/customerOrder.css">
		<link rel="shortcut icon" href="images/homepage/fav.ico">
		<!--收藏夹小图标-->
		<link rel="bookmark" href="images/homepage/fav.ico" />
		<!-- 基础javascript框架区 ends -->
		<!-- 自定义javascript框架区 starts -->
		<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="js/full.js"></script>
		<script type="text/javascript" src="js/banner.js"></script>
		<script type="text/javascript" src="js/slide.js"></script>
		<script type="text/javascript" src="js/main.js"></script>
		<!-- 自定义javascript框架区 ends -->
		<style type="text/css">
			.mess {
				display: inline-block;
				line-height: 30px;
				height: 30px;
				width: 100px;
				text-align: center;
			}
			
			.inpu {
				background: rgba(0, 0, 0, 0.2);
				margin-left: 0px;
				text-indent: 10px;
				height: 30px;
				width: 240px;
				border: 1px solid rgba(0, 0, 0, 0.35);
			}
			.tit-mess {
				position: absolute;
				left: 200px;
				height: 80px;
			}
		</style>
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
							<a title="首页" href="/" class="menu">首页</a>
						</li>
						<li class="mainlevel">
							<a title="关于大田" href="" class="menu">关于大田</a>
							<ul style="display: none;">
								<li>
									<a title="公司简介" href="">公司简介</a>
								</li>
								<li>
									<a title="企业文化" href="">企业文化</a>
								</li>
							</ul>
						</li>
						<li class="mainlevel">
							<a title="服务项目" href="" class="menu">服务项目</a>
							<ul style="display: none;">
								<li>
									<a title="城际快运" href="">城际快运</a>
								</li>
								<li>
									<a title="贸易物流" href="">贸易物流</a>
								</li>
								<li>
									<a title="国际物流" href="">国际物流</a>
								</li>
								<li>
									<a title="综合物流" href="">综合物流</a>
								</li>
								<li>
									<a title="仓储物流配送服务" href="">仓储物流配送服务</a>
								</li>
								<li>
									<a title="全球供应采购" href="">全球供应采购</a>
								</li>
							</ul>
						</li>
						<li class="mainlevel">
							<a title="新闻中心" href="/xwzx/" class="menu">新闻中心</a>
							<ul style="display: none;">
								<li>
									<a title="行业新闻" href="">行业新闻</a>
								</li>
								<li>
									<a title="帮助支持" href="/">帮助支持</a>
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

		<div class="customerOrder">
			<div class="container">
				<div class="index-title">
					<a href="" title="下单">下单</a>
				</div>
				<div class="cont">
					<form action="" method="">
					<div class="tit-mess">
					<span class="mess">发货时间</span>
					<input  class="inpu" name="" type="datetime-local" />
					<span class="mess">发货地点</span>
					<input  class="inpu" name="" placeholder="发货地点" />
					</div>
					<div class="tit-mess" style="position: absolute; top: 80px;">
					<span class="mess">目&nbsp;&nbsp;的&nbsp;&nbsp;港</span>
					<input  class="inpu" name="" placeholder="目的港" />
					<span class="mess">货物件数</span>
					<input  class="inpu"  name="" placeholder="货物件数" />
					</div>
					<div class="tit-mess" style="position: absolute; top: 160px;">
					<span class="mess">货物重量</span>
					<input  class="inpu"  name="" placeholder="货物重量" />
					<span class="mess">货物体积</span>
					<input  class="inpu"  name="" placeholder="货物体积" />
					</div>
					<div class="tit-mess" style="position: absolute; top: 240px;">
					<span class="mess">贸易方式</span>
						<select  class="inpu" name="">
							<option value="1">CIF</option>
							<option value="2">FOB</option>
							<option value="3">EXW</option>
							<option value="4">DDU</option>
							<option value="5">DDP</option>
							<option value="6">DAP</option>
						</select>
						<span class="mess">联&nbsp;&nbsp;系&nbsp;&nbsp;人</span>
						<select  class="inpu" name="">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
						</div>
						<div class="tit-mess" style="position: absolute; top: 320px; left: 480px;">
						<input id="addSub" class="mess" type="button" value="确认下单" />
						<input id="addRes" class="mess" type="reset" value="重新填写" />
						</div>
						</form>
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

</html>