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
            当前位置<span>></span>                <a class="homepage" title="首页">首页</a>
					<span>></span>
					<a class="tradeNews" title="新闻中心">新闻中心</a>
					<span>></span>
					<a class="tradeNews" title="行业新闻">行业新闻</a>
        </div>
        <div class="a-cont">
            <h1>多肉植物进口清关报关|多肉植物大田进口|多肉植物运输</h1>
            <h4>2015年12月12日</h4>
            <div class="cont">
                　　韩国多肉植物进口清关报关运输！美国多肉植物进口清关，荷兰多肉植物大田进口运输<br />
　　非洲多肉植物进口报关公司，多肉植物如何进口到内地？多肉植物进口报关流程<br />
　　天津大田集团物流有限公司，专业代理各国多肉植物中转大田包税进口清关运输到内地！无需任何单证，不需要缴纳任何关税，安全快捷，价格优惠！<br />
&nbsp;<br />
　　我们拥有拥有海关报关、商检(报检)、运输及政府事务等各方面经验丰富的资深专业人员，尤其在天津海关各口岸具有良好的声誉及融洽的人际关系，能为您提供安全稳妥、快捷畅通、省心放心的大田(或国外经大田中转)至国内货物进口通关一站式专业服务。&nbsp;<br />
含税进口快运--多肉植物从大田或从国外经大田中转到国内(港中快运)：按公斤计价、费用全包、代转货款、代办所有通关手续(报检、报关、清关、单证等)<br />
&nbsp;<br />
<strong>特点:</strong><br />
　　1、手续简单－代办单证手续全包&nbsp;<br />
　　2、安全无忧－正规报关绝对安全&nbsp;<br />
　　3、费用合理－含税含费公斤计价&nbsp;<br />
　　4、速度特快－正常一至两天到货<br />
&nbsp;<br />
　　操作简单：我司拥有专业才操作队伍，货物到我司后，其他操作均有我司来完成，方便快捷。<br />
　　服务周到：我司提供24小时电话咨询服务，及时为客户解决所有的物流疑难问题，客户也可以通过咨询电话，了解自己货物的运输状况，实现货物运输的透明化，在大田，我司拥有面积较广的仓库，可以为客户提供优质的仓储服务，也可以为客户免费提供国外货物寄回的收货地址。我司还可以在大田各地区提供上门提货服务，并可以代客户垫付部分运费，清关费实报实销，我司还可以为客户办理各种单证，为客户节省不少的时间。<br />
　　安全高效：我司拥有专业的进口渠道，进口以快件形式进来，可以省去不少不必要的麻烦，安全，高效，便捷.<br />
　　时效快捷：在我司接到货后，正常情况下，2-3个工作日内，将货物发到客户手上.<br />
　　用户须知：交货时，客户只需提供货物的详细资料，商业发票，装箱清单，其他单证无需提供，省去了不少繁琐的手续，手续简单。<br />
　　大田易达公司拥有自己宽敞的仓库，可以为客户提供优质的仓储服务，我们的物流网络覆盖全国的一二级城市，可以提供门到门的物流服务，简单，方便，快捷式我们不变的宗旨。&nbsp;全心全意打造多肉植物进口，多肉植物包税进口，多肉植物快件进口报关！欢迎新老客户来电咨询！<br />

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
 