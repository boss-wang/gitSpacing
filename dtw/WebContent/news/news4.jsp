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
					<h1>大数据对物流管理有什么影响？</h1>
					<h4>2017年08月28日</h4>
					<div class="cont">
						<div>
							物流的发展方向肯定是万物互联的物联网啦大数据的基础就是物联网，万物互联产生的数据形成云数据，在经过云计算，可以对物流各个流程(运输，仓储，搬运装卸，包装，流通加工，配送，信息处理等)更好的达到更精准的监控，进而提高物流效率，降低一直高企的物流成本拿物流的细分领域，冷链物流来说：冷链运输比其他快件运输的温度要求比较高，分为几大温区，每个区域对温度的控制要求又不相同。再加上目前我国冷链运输企业大多由于成本的控制，完全做不到全程冷链运输，这在一定程度上影响了生鲜产品的质量，进而影响客户的消费体验。但到了万物互联的物联网时代，冷链物流便可借助大数据，信息技术，物联网技术实现冷链物流的智能化，将能给够大幅提升冷链配送的效率和质量并对整个冷链过程实施更好的管理控制。大数据对物流行业的影响大不大?你可以看看菜鸟网络，这个平台就是基于阿里云大数据打造的，将各大快递公司数据与之对接，极大的提升物流的配送效率。其实大数据对于任何行业来说影响都是巨大的。</div>
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
	