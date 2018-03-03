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
		当前位置<span>></span> <a class="homepage" title="首页">首页</a> <span>></span> <a
			class="tradeNews" title="新闻中心">新闻中心</a> <span>></span> <a
			class="serviceTerms" title="帮助支持">帮助支持</a>
	</div>
	<div class="a-list">
		<ul>
			<li><a id="serviceTermsNews-news1" title="关口禁运物品">关口禁运物品</a>
			</li>
			<li><a id="serviceTermsNews-news2" title="大田进口如何节省成本">大田进口如何节省成本</a>
			</li>
			<li><a id="serviceTermsNews-news3" title="常见进口货物">常见进口货物</a></li>
		</ul>
	</div>
</div>
</div>
<script>
	$(".homepage").click(function() {
		window.location.href="index.jsp";
	});

	$(".tradeNews").click(function() {
		$("#homeDiv").load("tradeNews.jsp");
	});

	$(".serviceTerms").click(function() {
		$("#homeDiv").load("serviceTerms.jsp");
	});

	$("#serviceTermsNews-news1").click(function() {
		$("#homeDiv").load("serviceTermsNews/news1.jsp");
	});

	$("#serviceTermsNews-news2").click(function() {
		$("#homeDiv").load("serviceTermsNews/news2.jsp");
	});

	$("#serviceTermsNews-news3").click(function() {
		$("#homeDiv").load("serviceTermsNews/news3.jsp");
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
