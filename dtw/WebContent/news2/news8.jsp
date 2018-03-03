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
				<div class="content-title" style="margin-top:0px;">
					当前位置<span>></span>
					<a class="homepage" title="首页">首页</a>
					<span>></span>
					<a class="tradeNews" title="新闻中心">新闻中心</a>
					<span>></span>
					<a class="tradeNews" title="行业新闻">行业新闻</a>
				</div>
				<div class="a-cont">
					<h1>国际物流运输，你了解多少？</h1>
					<h4>2016年05月12日</h4>
					<div class="cont">
						<div>
							什么是国际物流运输</div>
						<div>
							国际物流运输即国际货物运输，是指在国家与国家、国家与地区之间的货物运输。分为贸易与非贸易（指展览品、援外品个人行李、办公用品等）。非贸易物品的运输只是附带业务，所以国际物流运输有时也简称国际贸易运输。</div>
						<div>
							国际物流运输的基本功能</div>
						<div>
							在这项作业中，主要完成的工作是将货物由供应地移动至需求地。运输活动使空间上的距离缩短，时间上的差异减少，这样就产生了物品的流动。</div>
						<div>
							而这种流动是通过运输达成的。储存货物无形之中也就成为国际运输的另一项基本功能了。</div>
						<div>
							国际物流运输的特点</div>
						<div>
							1、国际物流运输是一项涉外工作，政策性强。</div>
						<div>
							2、路线长，环节多。</div>
						<div>
							3、涉及面广，情况复杂多变。</div>
						<div>
							4、时间性强。</div>
						<div>
							5、风险大。</div>
						<div>
							所以一般出口货物都要办理运输保险。</div>
						<div>
							国际物流运输的方式</div>
						<div>
							1、国际海洋货物运输</div>
						<div>
							国际海洋货物运输是利用天然航道进行的国际物流运输，简称海洋运输。它是国际物流运输中使用最广泛的一种运输方式。</div>
						<div>
							海洋运输的营运方式有班轮运输和租船运输两种。</div>
						<div>
							2、国际铁路货物运输</div>
						<div>
							我国对外贸易货物的铁路运输包括国际铁路联运、对香港地区的铁路运输和国内铁路运输三个组成部分。</div>
						<div>
							3、国际公路货物运输</div>
						<div>
							国际公路货物运输是指国际货物借助一定的运载工具，沿着公路作跨及两个或两个以上国家或地区的移动过程。</div>
						<div>
							4、国际航空货物运输</div>
						<div>
							国际航空货物运输是指由跨国航空承运人办理两国之间空运的全程运输，并承担运输责任的一种现代化运输方式。</div>
						<div>
							经营方式有班机运输和包机运输两种。</div>
						<div>
							5、国际多式联运</div>
						<div>
							国际多式联运是按照联运合同，以至少两种不同的运输方式，由多式联运经营人将货物从一个国境内的接管地点运至另一国境内指定交付地点的货物运输方式。</div>
						<div>
							国际多式联运，又称国际联合一贯制运输，是在集装箱运输的基础上产生并发展起来的一种新型运输方式，有陆空联运、陆海联运、海空联运等方式。</div>
						<div>
							6、集装箱运输</div>
						<div>
							集装箱运输是以集装箱作为运输单位进行货物运输的种现代化的运输方式，它适用于海洋运输、铁路运输及国际多式联运等。</div>
						<div>
							&nbsp;</div>

					</div>
				</div>
		</div>
		 </div>
		
			<script>
		
			$(".homepage").click(function(){
				window.location.href="index.jsp";
			});
			
			$(".tradeNews").click(function(){
				$("#homeDiv").load("tradeNews.jsp");
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
	