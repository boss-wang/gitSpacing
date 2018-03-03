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
					<h1>全球化物流战略的发展趋势</h1>
					<h4>2016年09月23日</h4>
					<div class="cont">
						<div>
							从全球化物流战略的实践看，出现了三种形式的发展趋势：</div>
						<div>
							1、作为全球化的生产企业，在世界范围内寻找原材料、零部件来源，并选择一个适应全球分销的物流中心以及关键供应物资的集散仓库，在获得原材料以及分配新产品时使用当地现有的物流网络，并推广其先进的物流技术与方法。</div>
						<div>
							2、生产企业与专业第三方物流企业的同步全球化，即随着生产企业全球化的进程，将以前所形成的完善的第三方物流网络也带入到全球市场。例如，日资背景的伊藤洋华堂在打入中国市场后，其在日本的物流配送伙伴伊藤忠株式会社也跟随而至，并承担了其配送活动。</div>
						<div>
							3、国际运输企业之间的结盟，为了充分应对全球化的经营，国际运输企业之间开始形成了一种覆盖多种航线，相互之间以资源、经营的互补为纽带，面向长远利益的战略联盟，这不仅使全球物流更能便捷地进行，而且使全球范围内的物流设施得到了极大的利用，有效地降低了运输成本。</div>
						<div>
							全球化物流战略的评析&nbsp;</div>
						<div>
							当今，企业经营规模不断扩大，国际化经营不断延伸，出现了一大批立足于全球生产、全球经营和全球销售的大型全球型企业。这些企业的出现不仅使世界上都在经营、消费相同品牌的产品，而且产品的核心部件和主体部分也趋向于标准化。在这种状况下，全球型企业要想取得竞争优势，获取超额利润，就必须在全球范围内配置利用资源，通过采购、生产、营销等方面的全球化实现资源的最佳利用，发挥最大的规模效益。</div>
						<div>
							但是，在此过程中，有两点是必须加以关注的，一是全球市场的异质性或多样性，决定了企业&ldquo;从外到内&rdquo;的思维方式，即企业不仅要考虑通过规模经济的实现来降低成本，而且更要考虑积极发挥范围经济，既满足多样化的要求，又能有效降低费用；二是当一个企业服务全球市场时，物流系统会变得更昂贵、更复杂，结果导致前置时间延长和库存水平上升。因此，综合上述两个问题，企业在实施全球化物流时必须处理好集中化与分散化物流的关系，否则将无法确立全球化的竞争优势。&nbsp;</div>
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
