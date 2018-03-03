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
					<h1>运动系列/nike/adidas/Air jordan/新百伦/球服/鞋帽/进口报关/包税进口</h1>
					<h4>2015年12月12日</h4>
					<div class="cont">
						天津大田集团物有限公司可代收各类运动系列，nike、adidas等大牌鞋帽球服，进口代理，报关清关，我们一般一快件形式进口。<br /> &nbsp;
						<br /> 　　国外鞋子近期出现一鞋难求的现象，特别是国内假货A货泛滥的情况下，国外正品鞋子更是越来越难获得，
						<br /> 　　我司专业进口运动系列、球服鞋帽等进口清关。
						<br /> 　　香港免税进口庄家,提供国外各种运动鞋列，秋衣鞋帽进口运输一条龙服务,价格便宜,安全快捷,一手操作上货量大,时效安全有保证,超过5年的进口操作经验,实力雄厚,欢迎咨询洽谈!
						<br /> &nbsp;
						<br /> 我们的优势：&nbsp;
						<br /> 　　1&gt;、专业中港快件进口，价格低廉（包税包运费）；&nbsp;
						<br /> 　　2&gt;、安全可靠（自设中港专车正规报关绝对安全）；&nbsp;
						<br /> 　　3&gt;、手续简单（无须单证，手续全包）；&nbsp;&nbsp;&nbsp;
						<br /> 　　4&gt;、速度快捷（正常3-5工作日可送货上门）；&nbsp;
						<br /> 　　5&gt;、大货、整柜一样可以通过进口包税快运分批分次进口，非常方便优惠。&nbsp;
						<br /> 　　6&gt;、多年快递进口/包税进口业务操做经验，拥有各式灵活多样的进口渠道，操作人员精通海关法规法律,能协助客户处理疑难货物的&nbsp;&nbsp;进口清关,可处理他人不能处理之业务!
						<br /> &nbsp;
						<br /> 国外进口货物为什么要经香港中转运输至内地，原因见下：
						<br /> 　　1&gt;、香港是自由贸易地区，在香港的码头还享有一定时间的免租期，进出口货物不需要关税（大量烟酒除外）&nbsp;
						<br /> 　　2&gt;、手续简单：我香港公司接货以后，可以报关、清关等手续。&nbsp;
						<br /> 　　3&gt;、速度超块：正常情况下，香港交货，在三至五工作日左右可以到大陆!&nbsp;
						<br /> 　　4&gt;、费用超低：按公斤计算，全包价格进口，如化妆品，香港接到货到大陆全包价，您无需交缴关税!&nbsp;
						<br /> 　　5&gt;、安全度高：如果是因为我们进口的原因出现货丢、货损等我们可以按照运费5倍赔偿.
						<br /> &nbsp;
						<br /> 我们的目标：&nbsp;
						<br /> 　　安全：自己渠道，正规报关，全程保证货物安全无损&nbsp;
						<br /> 　　快速：自己操作，时效有保证。&nbsp;
						<br /> 　　价优：最大限度的让利于广大客户。
						<br /> &nbsp;
						<br /> 　　天津大田集团物流有限公司，多年进口清关经验。多年来专业代理国外汽配进口清关全套代理服务！
						<br /> 　　欢迎广大新老客户来电咨询和洽谈业务！
						<br />

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
	
	