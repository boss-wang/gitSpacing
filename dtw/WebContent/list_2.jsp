<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="container clearfix">
<div class="side">
        
<div class="side-title"><a href="" title="服务项目">服务项目</a></div>
<div class="side-cate">
<ul>
<li><img src="images/side-cate.png">    <a class="fastAddOrder" title="快速下单">快速下单</a></li>
<li><img src="images/side-cate.png">    <a class="selectorder" title="订单追踪">订单追踪</a></li>
</ul>
</div>
<div class="s-contact-title"><a class="lmessage" title="联系我们" style="color: white;">联系我们</a></div>
<div><img src="images/side-contact.jpg"></div>
    </div>

	<div class="content">
	<div class="content-title" style="margin-top: 0px;">
		当前位置<span>></span> <a id="homepage" title="首页">首页</a> <span>></span> <a
			class="tradeNews" title="新闻中心">新闻中心</a> <span>></span> <a class="tradeNews"
			title="行业新闻">行业新闻</a>
	</div>
	<div class="a-list">
		<ul>
			<li><a id="news2-news1" title="水货客遭严打！海关祭出“辣招”，代购说要转行了……">水货客遭严打！海关祭出“辣招”，代购说要转行了……</a>
			</li>
			<li><a id="news2-news2" title="清关慢，望大家耐心等待">清关慢，望大家耐心等待</a></li>
			<li><a id="news2-news3" title="全球化物流战略的发展趋势">全球化物流战略的发展趋势</a></li>
			<li><a id="news2-news4" title="仓储物流功能">仓储物流功能</a></li>
			<li><a id="news2-news5" title="什么是进出口代理">什么是进出口代理</a></li>
			<li><a id="news2-news6" title="物流的实质及其作用">物流的实质及其作用</a></li>
			<li><a id="news2-news7" title="快递资讯--智能快递新时代">快递资讯--智能快递新时代</a>
			</li>
			<li><a id="news2-news8" title="国际物流运输，你了解多少？">国际物流运输，你了解多少？</a>
			</li>
			<li><a id="news2-news9" title="发展城市物流的对策">发展城市物流的对策</a></li>
			<li><a id="news2-news10" title="汽配进口清关/刹车片车轮毂引擎进口报关">汽配进口清关/刹车片车轮毂引擎进口报关</a>
			</li>
			<li><a id="news2-news11" title="奢侈品代收转运|大田包税清关转运内地">奢侈品代收转运|大田包税清关转运内地</a>
			</li>
			<li><a id="news2-news12"
				title="运动系列/nike/adidas/Air jordan/新百伦/球服/鞋帽/进口报关/包税进口">运动系列/nike/adidas/Air
					jordan/新百伦/球服/鞋帽/进口报关/包税进口</a></li>
		</ul>
	</div>
	<div class="pages">
		<!--MvcPager 1.5 for ASP.NET MVC 3.0 © 2009-2011 Webdiyer (http://www.webdiyer.com)-->
		<div>
			<a id='list_first'>首页</a>&nbsp;&nbsp; 
			<a id='list_pre'>上一页</a>&nbsp;&nbsp;
			<a id='list_1'>1</a>&nbsp;&nbsp;2&nbsp;&nbsp; 
			<a id='list_3'>3</a>&nbsp;&nbsp;
			<a id='list_next'>下一页</a>&nbsp;&nbsp; 
			<a id='list_last'>尾页</a>
		</div>
		<!--MvcPager 1.5 for ASP.NET MVC 3.0 © 2009-2011 Webdiyer (http://www.webdiyer.com)-->

	</div>
</div>
</div>
<script>
$("#homepage").click(function() {
	window.location.href="index.jsp";
});

$(".tradeNews").click(function() {
	$("#homeDiv").load("tradeNews.jsp");
});

	$("#news2-news1").click(function() {
		$("#homeDiv").load("news2/news1.jsp");
	});

	$("#news2-news2").click(function() {
		$("#homeDiv").load("news2/news2.jsp");
	});

	$("#news2-news3").click(function() {
		$("#homeDiv").load("news2/news3.jsp");
	});

	$("#news2-news4").click(function() {
		$("#homeDiv").load("news2/news4.jsp");
	});

	$("#news2-news5").click(function() {
		$("#homeDiv").load("news2/news5.jsp");
	});

	$("#news2-news6").click(function() {
		$("#homeDiv").load("news2/news6.jsp");
	});

	$("#news2-news7").click(function() {
		$("#homeDiv").load("news2/news7.jsp");
	});

	$("#news2-news8").click(function() {
		$("#homeDiv").load("news2/news8.jsp");
	});

	$("#news2-news9").click(function() {
		$("#homeDiv").load("news2/news9.jsp");
	});

	$("#news2-news10").click(function() {
		$("#homeDiv").load("news2/news10.jsp");
	});

	$("#news2-news11").click(function() {
		$("#homeDiv").load("news2/news11.jsp");
	});

	$("#news2-news12").click(function() {
		$("#homeDiv").load("news2/news12.jsp");
	});

	$("#list_first,#list_pre,#list_1").click(function() {
		$("#homeDiv").load("tradeNews.jsp");
	});

	$("#list_next,#list_last,#list_3").click(function() {
		$("#homeDiv").load("list_3.jsp");
	});
	
	$(".lmessage").click(function() {
		$("#homeDiv").load("leaveMessage.jsp");
	});

	$(".selectorder").click(function(){
		var status ='${customer.statusId}';
		if(status=='1'){
			window.location.href="#abstract";
			$("#homeDiv").load("bangdinggongsi.jsp");
		}else if(status=='3'){
			window.location.href="#abstract";
			$("#homeDiv").load("showMyOrder.jsp");
		}else if(status=='2'){
			alert("您绑定的公司正在审核中，通过即可下单");
		}else{
			window.location.href="<%=basePath%>login.jsp";
		}
		
	});

	$(".fastAddOrder").click(function(){
		var status ='${customer.statusId}';
		if(status=='1'){
			window.location.href="#abstract";
			$("#homeDiv").load("bangdinggongsi.jsp");
		}else if(status=='3'){
			window.location.href="#abstract";
			$("#homeDiv").load("custorder.do","mn=goAddCustomerOrder");
		}else if(status=='2'){
			alert("您绑定的公司正在审核中，通过即可下单");
		}else{
			window.location.href="<%=basePath%>login.jsp";
		}
	});
</script>

