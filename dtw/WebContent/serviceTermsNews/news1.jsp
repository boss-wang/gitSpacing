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
		<div class="content-title">
			当前位置<span>></span> <a class="homepage" title="首页">首页</a> <span>></span>
			<a class="tradeNews" title="新闻中心">新闻中心</a> <span>></span> <a
				class="serviceTerms" title="帮助支持">帮助支持</a>
		</div>
		<div class="a-cont">
			<h1>关口禁运物品</h1>
			<h4>2015年12月12日</h4>
			<div class="cont">
				大田对危险药物，精神药物，受管制化学品，抗生素，枪械，烟花爆竹，战略物品，未经加工钻石，动物，植物，濒危物种，野味，肉类以及家禽的进出口实施法律管制。<br />
				常见禁运/受管制物品如下：<br /> ◎危险药物以及精神药物<br /> ◎受管制化学品<br /> ◎抗生素<br />
				◎枪械，弹药以及武器<br /> 没有有效许可证而把任何火器或者弹药带进/带离大田，可遭检控。除获法例豁免外，有仿制火器亦属违法。<br />
				◎动植物<br />
				在大田进出口任何动物，雀鸟，爬虫，植物，除害剂，泥土以及植物病虫害，必须预先领有由渔农自然护理署署长所签发的有效许可证或准许证。进口供食用的动物方面，则必须附有由来源地方禽兽卫生主管当局发出的有效健康证书和由渔农自然护理署署长所签发的进口许可证。至于进口由中国内地生产的切花/蔬菜/非濒危植物，则无需领有进口许可证或证明书。经大田转运的动物，雀鸟或爬虫，亦须领有由渔农自然护理署署长签发的有效特别许可证。大田对进口的狗或猫设有检疫限制。在运送时，这些动物应放于蓝，篓，笼或适当的容器内。<br />
				◎濒危物种<br />
				除获法例豁免外，在大田进出口任何濒危物种（不论活的和死的）或其部分/制成品，如标本，皮，角，肉，药物，象牙雕刻品以及饰物，必须预先领有许可证。以下为一些濒危动植物的例子：动物、猴子、象、野生猫科动物（虎，豹，虎猫等），犀牛，熊，河马，赛加羚羊，穿山甲，海龟，陆龟，巨蜥，龙吐珠鱼，鹰，猫头鹰，鹦鹉，巨蚌以及珊瑚。<br />
				◎植物<br /> 兰花、仙人掌、花旗参、猪笼草、捕蛹草、某类空气草、天麻、石斛以及沉香。<br />
				◎野味、肉类、家禽、无烟烟草产品<br />
				任何未领有有效健康证明书的肉类或家禽带进大田，即属违法。在大田进口任何野味（例如果子狸、鹿肉等）前，亦需取得食物环境卫生署署长的事先批准。此外，法例亦严禁进口狗肉/猫肉或无烟烟草产品。）<br />
				◎烟花爆竹或爆炸品<br /> 烟花、爆竹、火药纸、圣诞炮、或其他爆炸品<br /> ◎冒牌货品以及侵犯版权物品<br />
				附有伪造商标/虚假商品说明的冒牌货品（例如手表，手袋以及衣物）或版权作品的侵犯版权复制品（例如载有电脑软件，电影，音乐或电脑/电视游戏的光碟）。<br />
				◎电讯设备<br /> 以无线电波进行发送的器具或任何该器具的任何元件（例如流动电话及无线电对讲机等）
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

$(".lmessage").click(function() {
	$("#homeDiv").load("leaveMessage.jsp");
});

$(".selectorder").click(function(){
	alert();
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
	alert();
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
