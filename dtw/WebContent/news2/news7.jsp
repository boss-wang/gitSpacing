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
					<h1>快递资讯--智能快递新时代</h1>
					<h4>2016年05月24日</h4>
					<div class="cont">
						<div>
							中国邮政日前宣布开放全国5000个自提网点，任何一家快递公司发货，均可享受此服务。自提网点包括现有邮政自有网点和&ldquo;无人值守&rdquo;的智能快递柜。</div>
						<div>
							中国邮政20日宣布启动包裹&ldquo;自提&rdquo;服务。消费者在网购时，选择中国邮政提供的自提网点为收货地址，自提网点人员接收包裹并将信息录入系统，系统自动触发短信提醒，消费者凭短信密码自取包裹。</div>
						<div>
							目前，全国有5000个邮政自提网点，分布在北、上、广、天津、杭州等城市。随着邮政自提网点信息嵌入电商平台，消费者在网上购物时，将可选择离收件地址最近的邮政包裹自提网点。这些自提网点不局限于邮政用户使用，任何一家快递公司发货，均可享受此服务。</div>
						<div>
							电商包裹&ldquo;自提&rdquo;服务网点主要分为两部分，一部分是&ldquo;有人值守&rdquo;的自提点，主要是依托邮政自有的营业网点、投递网点，以及社区超市等社会网点，叠加包裹自提服务，另一部分是&ldquo;无人值守&rdquo;的邮政智能快递柜。</div>
						<div>
							看似简单的自提系统开放，背后却是智能快递的大市场。企业、专家、主管部门等负责人均认为，智能快递已成为当前政府解决快递业及驱动快递满足消费、商业需求的重要手段。</div>
						<div>
							手机查询、输入密码、开门取件&mdash;&mdash;三个步骤，一个快递包裹便从智慧快递柜中取出。这样的智能快递箱外形酷似小区楼道的报刊箱。这种方式越来越受到居民和快递员欢迎。</div>
						<div>
							智能快递可消化我国高速增长的巨量快递。未来我国快递业务量猛增，而人工投递成本不断增加，继续满足居民和电子商务快递需求，快递柜成为有效解决问题的方法。</div>
						<div>
							智能快递柜还具有很强的扩展性，成为高价值的社区入口。此外，可以利用这一空间进行销售，以小区的大数据积累为基础，电商可以掌握小区购买米、油等生活用品消耗并提前配送储藏，提升了物流和快递柜的效率和价值。</div>
						<div>
							有人预测，智能快递在未来5年左右可产生百亿级的市场。</div>
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
	