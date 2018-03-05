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
					<h1>中国下一个战争——物流的数据战争</h1>
					<h4>2016年12月29日</h4>
					<div class="cont">
						<div>
						
							天津大田集团物流有限公司是一家专业代理进出口的公司，我司在天津东莞各口岸代理进出口相关业务方面已具备相当雄厚的实力，尤其是在常平快件中心与海关关系甚好。公司以个性化的物流提供商为自身定位，不断进取致力于为客户提供更加灵活、更加个性化的快速通关服务。公司拥有一批经验丰富的报关员和报检员，熟知海关法律法规，具有较高的业务素质和丰富的操作经验。并且与海关、检验检疫、卫生部门、环保局、航空公司等相关部门建立了良好的合作关系，能较好地为客户排忧解难，解决进出口难题。</div>
						<div>
							很多人或许还没有意识到，如果从1999年阿里巴巴、携程网、8848、易趣网、当当网等第一批电子商务网站先后创立算起，中国电子商务在先后经历了渠道竞争、流量竞争、支付竞争之后，必将会引发物流竞争。</div>
						<div>
							物流为何成为最后一个有待攻下的城池？原因无他，多年以来，物流一直是商务流通中的一大痛点。</div>
						<div>
							从大物流的角度来说，中国的物流成本高是不争的事实。最新的数据是，国家发改委7月20日透露，2015年中国物流成本占国内生产总值的比重高达16.6％，高于世界平均水平5个百分点。</div>
						<div>
							信息化程度不高、信息不对称困扰中国物流业多年。由于信息不对称，常常出现车找不到货、货找不到车，货找不到库、库找不到货的情况。</div>
						<div>
							问题日久年深，改变却进展缓慢。大数据时代的到来，为物流业的信息化瓶颈提供了真正可行的解决方案。</div>
						<div>
							&ldquo;大数据，使得原来碎片化的需求，变得清晰化，实现了一定程度的可预见。&rdquo;中国交通运输协会快运分会副秘书长刘建新对《中国新闻周刊》表示，五年以前，物流成本占GDP比重长期在18％左右，经过从&ldquo;十二五&rdquo;后半程的努力，现在已经降低了两到三个百分点，2016年社会物流总费用与GDP的比率有望降至15.5％左右，已经达到了&ldquo;十三五&rdquo;降低物流成本的预期目标，&ldquo;这其中，大数据和信息化有很大的贡献。&rdquo;</div>
						<div>
							&ldquo;智慧物流是走出经济困境和全球化的最重要的关键点。&rdquo;马云曾表示，智慧物流的意义绝不仅仅在于让物流变得更快，而是要参与到整个生产、经济的转型升级，&ldquo;必须要做到能够消灭库存。&rdquo;</div>
						<div>
							我们的服务宗旨是：以我们的真诚，换取您对我们的信任。以高质量的服务标准，换取您对我们的满意。以互惠互利共创双赢的原则，换取我们之间合作成功的喜悦。 联系电话：</div>
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
