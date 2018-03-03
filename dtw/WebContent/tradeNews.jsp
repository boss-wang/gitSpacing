<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="container clearfix">
<div class="side">
        
<div class="side-title">服务项目</div>
<div class="side-cate">
<ul>
<li><img src="images/side-cate.png">    <a class="fastAddOrder" title="快速下单">快速下单</a></li>
<li><img src="images/side-cate.png">    <a class="selectorder" title="订单追踪">订单追踪</a></li>
</ul>
</div>
<div class="s-contact-title"><a class="contactUs" title="联系我们" style="color: white;">联系我们</a></div>
<div><img src="images/side-contact.jpg"></div>
    </div>

	<div class="content">
	<div class="content-title">
		当前位置<span>></span> <a id="homepage" title="首页">首页</a> <span>></span> <a
			class="tradeNews" title="新闻中心">新闻中心</a> <span>></span> <a class="tradeNews"
			title="行业新闻">行业新闻</a>
	</div>
	<div class="a-list">
		<ul>
			<li><a id="news-news1" title="物流和快递有什么区别？？">物流和快递有什么区别？？</a></li>
			<li><a id="news-news2" title="物流公司仓储基地的选址是如何进行的？通常受哪些因素影响？">物流公司仓储基地的选址是如何进行的？通常受哪些因素影响？</a>
			</li>
			<li><a id="news-news3" title="物流的价值？">物流的价值？</a></li>
			<li><a id="news-news4" title="大数据对物流管理有什么影响？">大数据对物流管理有什么影响？</a>
			</li>
			<li><a id="news-news5" title="物流课关于大数据时代的调研该如何进行?">物流课关于大数据时代的调研该如何进行?</a>
			</li>
			<li><a id="news-news6"
				title="物流「最后一公里」是最赚钱的吗？「最后一公里」给物流公司带来了哪些考验？">物流「最后一公里」是最赚钱的吗？「最后一公里」给物流公司带来了哪些考验？</a>
			</li>
			<li><a id="news-news7" title="大数据时代于物流行业的应用？">大数据时代于物流行业的应用？</a>
			</li>
			<li><a id="news-news8" title="如何准确又通俗易懂地解释大数据及其应用价值？">如何准确又通俗易懂地解释大数据及其应用价值？</a>
			</li>
			<li><a id="news-news9" title="国际物流发展趋势">国际物流发展趋势</a></li>
			<li><a id="news-news10" title="今后智能仓储有望主导物流行业">今后智能仓储有望主导物流行业</a>
			</li>
			<li><a id="news-news11" title="中国下一个战争——物流的数据战争">中国下一个战争——物流的数据战争</a>
			</li>
			<li><a id="news-news12" title="【物流趣事】世界上最早的物流公司：中国镖局">【物流趣事】世界上最早的物流公司：中国镖局</a>
			</li>
		</ul>
	</div>
	<div class="pages">
		<div>
			<a id="list_first">首页</a>&nbsp;&nbsp; 
			<a id="list_pre">上一页</a>&nbsp;&nbsp;1&nbsp;&nbsp;
			<a id='list_2'>2</a>&nbsp;&nbsp; 
			<a id='list_3'>3</a>&nbsp;&nbsp; 
			<a id='list_next'>下一页</a>&nbsp;&nbsp; <a id='list_last'>尾页</a>
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

	$("#news-news1").click(function() {
		$("#homeDiv").load("news/news1.jsp");
	});

	$("#news-news2").click(function() {
		$("#homeDiv").load("news/news2.jsp");
	});

	$("#news-news3").click(function() {
		$("#homeDiv").load("news/news3.jsp");
	});

	$("#news-news4").click(function() {
		$("#homeDiv").load("news/news4.jsp");
	});

	$("#news-news5").click(function() {
		$("#homeDiv").load("news/news5.jsp");
	});

	$("#news-news6").click(function() {
		$("#homeDiv").load("news/news6.jsp");
	});

	$("#news-news7").click(function() {
		$("#homeDiv").load("news/news7.jsp");
	});

	$("#news-news8").click(function() {
		$("#homeDiv").load("news/news8.jsp");
	});

	$("#news-news9").click(function() {
		$("#homeDiv").load("news/news9.jsp");
	});

	$("#news-news10").click(function() {
		$("#homeDiv").load("news/news10.jsp");
	});

	$("#news-news11").click(function() {
		$("#homeDiv").load("news/news11.jsp");
	});

	$("#news-news12").click(function() {
		$("#homeDiv").load("news/news12.jsp");
	});

	$("#list_first").click(function() {
		$("#homeDiv").load("tradeNews.jsp");
	});

	$("#list_2,#list_next").click(function() {
		$("#homeDiv").load("list_2.jsp");
	});
	$("#list_3,#list_last").click(function() {
		$("#homeDiv").load("list_3.jsp");
	});
	
	$(".contactUs").click(function() {
		$("#homeDiv").load("contactUs.jsp");
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