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
					<h1>如何准确又通俗易懂地解释大数据及其应用价值？</h1>
					<h4>2017年04月11日</h4>
					<div class="cont">
						<div style="text-align: center;">
							<img alt="天津大田集团物流有限公司" src="images/news/2017112106295851648.png" style="width: 647px; height: 77px;" /></div>
						<div>
							我们知道：</div>
						<div>
							&nbsp;</div>
						<div>
							1、第一次工业革命以煤炭为基础，蒸汽机和印刷术为标志，</div>
						<div>
							&nbsp;</div>
						<div>
							2、第二次工业革命以石油为基础，内燃机和电信技术为标志，</div>
						<div>
							&nbsp;</div>
						<div>
							3、第三次工业革命以核能基础，互联网技术为标志，</div>
						<div>
							&nbsp;</div>
						<div>
							4、第四次工业革命以可再生能源为基础，_______技术为标志。</div>
						<div>
							&nbsp;</div>
						<div>
							行业首先与互联网融合成功，从海量的数据金矿中发现暗藏的规律，就能够抢占先机，先发制人。</div>
						<div>
							&nbsp;</div>
						<div>
							大数据的应用</div>
						<div>
							&nbsp;</div>
						<div>
							大数据时代已经到来，根据IDC和Mckinsey的大数据研究报告。大数据挖掘商业价值的方法主要分为四种：</div>
						<div>
							&nbsp;</div>
						<div>
							顾客群体细分，然后对每个群体量体裁衣般地采取独特的行动。</div>
						<div>
							&nbsp;</div>
						<div>
							模拟实际环境，发掘新的需求同时提高投入的回报率。</div>
						<div>
							&nbsp;</div>
						<div>
							加强各部门联系，提高整个管理链条和产业链条的投入回报率。</div>
						<div>
							&nbsp;</div>
						<div>
							发现隐藏线索，进行产品和服务的创新。</div>

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
		
