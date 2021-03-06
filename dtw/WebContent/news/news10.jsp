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
					<h1>今后智能仓储有望主导物流行业</h1>
					<h4>2017年02月23日</h4>
					<div class="cont">
						<div>
							天津大田集团物流有限公司是一家专业代理进出口的公司，我司在天津东莞各口岸代理进出口相关业务方面已具备相当雄厚的实力，尤其是在常平快件中心与海关关系甚好。</div>
						<div>
							当物流将成为决定购物选择的关键，据传天猫正在下大力气提升用户的购物体验，2017年的首次大动作就是提升物流体验。</div>
						<div>
							因为今后，物流不再仅仅是下单购买后的配套服务，而是会直接影响消费者的购买行为。</div>
						<div>
							&ldquo;包邮&rdquo;之后物流再次驱动消费</div>
						<div>
							面对日益增长的人力成本与难以提升的运行效率，电商物流的自动化转型已迫在眉睫。根据《全国社会化电商物流从业人员研究报告》显示，在社会化物流模式协同下，与电商物流相关的新业态正在兴起。</div>
						<div>
							确实，与传统仓储相比，智能仓储在空间利用率、作业效率、人工成本等指标上的优势都十分显著，降本增效尤其明显。同时，随着电商规模的增长，以及消费者对物流时效的要求提高，不少企业都试图引入科技提升效率。</div>
						<div>
							从当前趋势来看，未来几年内，这种智能化的仓储物流将会迎来井喷式的发展，平均每年的复合增长率有望超过40%。而对传统的仓储物流行业进行智能化改造已经是大势所趋，提高运营效益、增加企业受益是最直接的驱动因素。</div>
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

