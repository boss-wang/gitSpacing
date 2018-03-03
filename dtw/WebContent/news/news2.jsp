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
				<div class="content-title" style="margin-top:0px;">
					当前位置<span>></span>
					<a class="homepage" title="首页">首页</a>
					<span>></span>
					<a class="tradeNews" title="新闻中心">新闻中心</a>
					<span>></span>
					<a class="tradeNews" title="行业新闻">行业新闻</a>
				</div>
				<div class="a-cont">
					<h1>物流公司仓储基地的选址是如何进行的？通常受哪些因素影响？</h1>
					<h4>2017年10月10日</h4>
					<div class="cont">
						<div>
							<p>
								一、需求分析，首先要了解你的物流仓储的用途是什么。是属于出口装箱还是进口分拨，是保税仓库还是物流中转?如果属于出口装箱的仓库选择优先考虑靠近几大港口并交通条件良好的地段，以降低内装箱成本;如果属于进口分拨，那么就要分为两类：1、分拨后货物派送需要承包的，选择就是靠近派送终端的地段，2、不参与分拨后派送的，选择接近进货港口的地段;如果是保税仓库，选择地段主要看当地的客户群体密集的&amp;海关管理系统完善的;如果是物流中转的，选择辐射范围广&amp;交通方便的。</p>
							<p>
								二、模型建立，对以后业务或者将来业务进行模型测算。模型需要考虑的问题包括：交通状况、进货成本测算、出货成本测算、租金、人力成本、计划收益、固有资金、未来发展等，可以把各种因素形成一段程序，可以精确测算出最理想的仓库门点，但考虑实际拿地困难的因素--可以把几个备选地点列入到模型里面运算，选择最适合自己的地点。</p>
							<p>
								三、完善模型，进一步确认建模参数的可靠性。对于可能影响的因素进行再分析，并可根据实际情况增加其他的影响因素，例如竞争与合作情况分析。</p>
							<p>
								四、模拟运行，让自己的团队先模拟运营仓库。查找是否存在其他的未考虑的因素。</p>
							<p>
								五、正式投产。</p>
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
