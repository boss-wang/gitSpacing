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
					<h1>国际物流发展趋势</h1>
					<h4>2017年03月09日</h4>
					<div class="cont">
						<div>
							&ldquo;互联网+物流&rdquo;创新发展</div>
						<div>
							如今，&ldquo;互联网+物流&rdquo;作为物流管理的一种新趋势正在企业实践中广为应用，&ldquo;互联网+物流&rdquo;将此前的物流体系和物流网络有机结合起来。互联网物流是建立在发达的实体物流网络基础之上的，虚拟化企业之间的合作必然在实践中产生大量的实体商品的配送和处理，而这些管理活动必须以发达的物流网络为基础才能够实现。因此现在一些优秀的企业都在探索将这两者的优势有机地结合在一起。</div>
						<div>
							顺应物流领域科技与产业发展的新趋势，形成以互联网为依托，探索分析物流与互联网发展新思路，构建物流信息互联共享体系，打破制约&ldquo;互联网+&rdquo;物流发展障碍，最大限度地释放了物流市场活力。</div>
						<div>
							物流包装的绿色创新</div>
						<div>
							电商的快速发展带动了快递包裹量的上升，而不能循环使用的包装往往带来&ldquo;快递垃圾&rdquo;。如何在包装环节最大限度节约资源，减少污染的绿色包装已经成为中国绿色环保领域面临的最大社会焦点问题之一。随着高效能物流产业链的各环节企业的发展，绿色包装已经成为不可忽略的绿色环保大集团，物流包装升级迫在眉睫，同样也是建设绿色产业生态的最活跃力量。</div>
						<div>
							无论是传统零售商、制造商还是进出口贸易商，都纷纷触电，希望插上互联网的翅膀，站上风口。然而，在电商化的转型升级路上，许多传统企业都不同程度上地遭遇阵痛。传统企业也纷纷都在探索转型之路，并且很多企业都在转型的路上行走了一段距离。传统企业如何运用电商化思维，在商业模式、管理模式、生产模式、营销模式上需要作出哪些调整？传统企业如何实现华丽转身与逆袭，让王者重新归来？</div>
						<div>
							天津的外贸企业、代工厂数量居全国首位，在插上电商翅膀后纷纷从传统外贸转型为跨境电商。天津是全国跨境电商企业和从业者最集中的城市。</div>
						<div>
							天津大田集团物流有限公司作为专业代理进口的企业，我们的代理优势有：无合同散货快件进口，私人物品进口，无单证无批文货物进口，退货进口，等等疑难进口，公司长期进口的货物有：奢侈品、电子产品，食品，保健品，乳制品，化妆品，工业制品，工业原料，机器模具（新旧）、奶粉、红酒、食品、家电，家具、服装、五金制品、各类机械设备、纺织品、塑料粒、五金等。
						<div>
							天津大田集团物流有限公司已经打开了内陆市场，在湖北、河南、安徽、四川都设有分销中心和仓库，从而能更加方便的服务于广大客户。</div>
						<div>
							&nbsp;</div>

					</div>
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
		
	