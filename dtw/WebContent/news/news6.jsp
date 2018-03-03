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
					<h1>物流「最后一公里」是最赚钱的吗？「最后一公里」给物流公司带来了哪些考验？</h1>
					<h4>2017年06月13日</h4>
					<div class="cont">
						<div>
							物流「最后一公里」是最赚钱的吗?</div>
						<div>
							&nbsp;</div>
						<div>
							物流最赚钱的环节是拿到第一手货源然后分包给承运商，这个环节是最赚钱的。</div>
						<div>
							&nbsp;</div>
						<div>
							「最后一公里」这个生意模式赚钱，不赚钱就不会存在了。</div>
						<div>
							&nbsp;</div>
						<div>
							猜测下你觉得赚钱是因为落地配或者同城配送的吨公里运费较长途运输高是吗?在物流活动中，整车长途运输的吨公里成本相对是最低的。不管是零担还是快递，整车运输的油费、过路费成本基本一样。管理成本略有差别。物流成本大概是仓储管理、装卸操作、干线运输、落地配送之和，物流成本的大头是干线运输费用和配送费。</div>
						<div>
							&nbsp;</div>
						<div>
							落地配的吨公里费用高，是因为运营成本高，但说到利润，具体要看公司的车辆使用效率了，运营成本相同的情况下，车辆使用效率高就赚钱。</div>
						<div>
							&nbsp;</div>
						<div>
							「最后一公里」给物流公司带来了哪些考验?</div>
						<div>
							&nbsp;</div>
						<div>
							货物送往目的地的最终用户或收货人是由当地的合作公司做落地配的</div>
						<div>
							&nbsp;</div>
						<div>
							考验只有一个：不受控。</div>
						<div>
							&nbsp;</div>
						<div>
							表现形式是：服务意识淡薄、时效意识淡薄，并且成本优先，操作第二。你能想到的可能的不受控造成的各种状况，基本都会出现。</div>
						<div>
							&nbsp;</div>
						<div>
							「最后一公里」不是物流业是硬伤，它是物流活动中不可缺的一个环节，至关重要。落地配几乎承载了客户对物流服务的全部体验。</div>
						<div>
							&nbsp;</div>
						<div>
							物流业的硬伤是信息流不畅、延续性差、数据链私有性强、信息透明度一般。</div>
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
