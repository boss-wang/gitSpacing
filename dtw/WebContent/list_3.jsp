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
			<li><a id="news3-news1" title="猫粮进口清关/狗粮进口报关/鼠粮进口代理/宠物食品包税进口">猫粮进口清关/狗粮进口报关/鼠粮进口代理/宠物食品包税进口</a>
			</li>
			<li><a id="news3-news2" title="美容护肤品进口清关报关|化妆品大田快件进口代理">美容护肤品进口清关报关|化妆品大田快件进口代理</a>
			</li>
			<li><a id="news3-news3" title="多肉植物进口清关报关|多肉植物大田进口|多肉植物运输">多肉植物进口清关报关|多肉植物大田进口|多肉植物运输</a>
			</li>
			<li><a id="news3-news4" title="印度雪松种子辣木籽进口清关">印度雪松种子辣木籽进口清关</a>
			</li>
		</ul>
	</div>
	<div class="pages">
		<div>
			<a id='list_first'>首页</a>&nbsp;&nbsp; 
			<a id='list_pre'>上一页</a>&nbsp;&nbsp;
			<a id='list_1'>1</a>&nbsp;&nbsp; 
			<a id='list_2'>2</a>&nbsp;&nbsp;3&nbsp;&nbsp;
			<a id="next">下一页</a>&nbsp;&nbsp; 
			<a id="list_3">尾页</a>
		</div>

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

	$("#news3-news1").click(function() {
		$("#homeDiv").load("news3/news1.jsp");
	});

	$("#news3-news2").click(function() {
		$("#homeDiv").load("news3/news2.jsp");
	});

	$("#news3-news3").click(function() {
		$("#homeDiv").load("news3/news3.jsp");
	});

	$("#news3-news4").click(function() {
		$("#homeDiv").load("news3/news4.jsp");
	});

	$("#list_last").click(function() {
		$("#homeDiv").load("list_3.jsp");
	});

	$("#list_2,#list_pre").click(function() {
		$("#homeDiv").load("list_2.jsp");
	});

	$("#list_1,#list_first").click(function() {
		$("#homeDiv").load("tradeNews.jsp");
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



