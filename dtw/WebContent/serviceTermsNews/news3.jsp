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
<li><img src="images/side-cate.png">    <a id="fastAddOrder" title="快速下单">快速下单</a></li>
<li><img src="images/side-cate.png">    <a class="selectorder" title="订单追踪">订单追踪</a></li>
</ul>
</div>
<<<<<<< HEAD
<div class="s-contact-title"><a class="contactus" title="联系我们" style="color: white;">联系我们</a></div>
=======
<div class="s-contact-title"><a class="contactUs" title="联系我们" style="color: white;">联系我们</a></div>
>>>>>>> branch 'master' of https://github.com/boss-wang/gitSpacing.git
<div><img src="images/side-contact.jpg"></div>
    </div>

	<div class="content">
		<div class="content-title">
			当前位置<span>></span> <a class="homepage" title="首页">首页</a> <span>></span>
			<a class="tradeNews" title="新闻中心">新闻中心</a> <span>></span> <a
				class="serviceTerms" title="帮助支持">帮助支持</a>
		</div>
		<div class="a-cont">
			<h1>常见进口货物</h1>
			<h4>2015年12月12日</h4>
			<div class="cont">
				公司拥有一批经验丰富的报关员和报检员，熟知海关法律法规，具有较高的业务素质和丰富的操作经验。并且与海关、检验检疫、卫生部门、环保局、航空公司等相关部门建立了良好的合作关系，能较好地为客户排忧解难，解决进出口难题。<br />
				&nbsp;<br />
				&nbsp;<br /> 食饮类：奶粉|红酒|火腿|咖啡|辅食|米糊|调味料|火锅料|火腿|橄榄油|茶叶|宠物食品|<br />
				保健类：鱼肝油|羊胎素|跌打药油|药膏|减肥产品|藏红花|蜂胶|燕窝|海参|<br />
				日用类：洗发水|沐浴露|手工皂|牙膏|牙刷|母婴用品|耳温计|尊马油|绵羊油|水宝宝|<br />
				美容类：化妆品|护肤品|面膜|面霜|洗面奶|美容针|玻尿酸|化妆原料|半成品|<br />
				名牌类：名牌包包|名牌手表|名牌服装|名牌墨镜|名牌皮带|名牌首饰|名牌鞋子|<br />
				电子类：新旧手机|音响|手机配件|电脑配件|笔记本电脑|相机|剃须刀|电池|投影仪|<br />
				机器类：美容仪器|马达|工业仪器|医疗仪器|机械|传感器|空气净化器|<br />
				其它类：塑胶粒|植物种子|试剂|化工用品|润滑油|体育用品|鱼竿|假发|高价值产品等等<br /> &nbsp;<br />
				大田的服务宗旨是：以我们的真诚，换取您对我们的信任。以高质量的服务标准，换取您对我们的满意。以互惠互利共创双赢的原则，换取我们之间合作成功的喜悦。<br />
				大田港物流将以优质的服务、良好的信誉、合理的价格、丰富的工作经验为客户提供最满意的服务。<br /> &nbsp;<br />

			</div>
		</div>
	</div>
</div>
<script>
$(".homepage").click(function() {
	window.location.href="index.jsp";
});

$(".tradeNews").click(function() {
	$("#homeDiv").load("tradeNews.html");
});

$(".serviceTerms").click(function() {
	$("#homeDiv").load("serviceTerms.html");
});

<<<<<<< HEAD
$(".contactus").click(function() {
=======
$(".contactUs").click(function() {
>>>>>>> branch 'master' of https://github.com/boss-wang/gitSpacing.git
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

$("#fastAddOrder,#cost").click(function(){
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
