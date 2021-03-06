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
					<h1>物流课关于大数据时代的调研该如何进行?</h1>
					<h4>2017年07月31日</h4>
					<div class="cont">
						<div>
							在智能时代，要特别呼吁的一个问题是，注意数据本身的价值。通常，我们总是在现有经验和水平上去完成信息化的目标。而现在，我们要基于数据，实现在线的分析优化控制，就是找出规律和依据，从而提升各项作业控制的价值。</div>
						<div>
							&nbsp;</div>
						<div>
							第一是采集信息端，即识别、定位和感知。首先是身份识别，对每一个管理单元都要求有身份识别，包括人、车、物、单位等。身份识别决定了管理精度或者是管理颗粒度。其次是位置管理，定位是一项基础技术。物流是通过时空管理创造价值的，所以位置是非常重要的一个要素，位置管理会成为采集信息的一个重要方面。第三是感知，通过传感器、摄像头、或者其它设备采集需要管理的信息。采集信息端将是一个未来有巨大发展空间的领域。</div>
						<div>
							&nbsp;</div>
						<div>
							第二是传输信息。物流的信息传输技术现在基本定位在移动互联网技术，用互联网的标准架构，但是通讯功能要能够无线移动起来。这个时候就能够支持实时管控的要求，技术会体现在智能终端上。人、车、货实现无线通讯是通过两类智能终端，一类是手持终端，跟着人走;一类是货载或车载终端，跟着物走。这两类终端分别承载着移动通讯的基本职能，同时它又是采集信息的Hub。</div>
						<div>
							&nbsp;</div>
						<div>
							第三是在数据的应用和开发方面，将会出现越来越多的数据中心。数据中心承担着数据的集中整合，深度的加工和服务的功能，从而能够满足各类的管理需求，形成服务外包的数据中心。而能否外包取决于服务是否标准。标准和外包这两件事是密切相关的。所谓标准化是指描述清楚、考核规范、纠纷能够得到依据处理， 能做到这三点，这个服务基本上就是是标准的。当一个服务标准化的时候，它很容易外包出去，而且会取得规模效益和专业化效益的双赢。</div>
						<div>
							&nbsp;</div>
						<div>
							在这个大数据时代，所有的大数据将成为竞争的关键，根据麦肯锡研究院(MGI)研究，企业或公司正在寻求如何利用大数据更好地服务客户，免费提供各种开放式数据，同时做好隐私保密与安全。多媒体、社交媒体、物联网的快速发展将推动企业未来数据呈现指数级增长。</div>
						<div>
							&nbsp;</div>
						<div>
							大数据时代的海量数据对物流产业会产生较大影响，企业正通过各种渠道、包括传感器和智能手机收集各种实时数据。IT企业也在通过物流给客户提供各种新数据，公司面对海量数据需要有一个策略，比如硬件基础设施、收集与分析信息，为客户提供运营与合作网络等。</div>
						<div>
							&nbsp;</div>
						<div>
							移动设备也为物流行业提供了前所未有的实时传输时代，智能手机和平板电脑接受、处理、</div>
						<div>
							&nbsp;</div>
						<div>
							发送大量数据，配送中心的电子车、卡车、传感器和装有射频读卡器的拖车等。</div>
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
