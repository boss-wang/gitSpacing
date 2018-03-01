<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
	.messdiv input{
		background-color:rgba(0,0,0,0.7);
		display:inline-block;
		border:none;
	}
	.costSta{
		background: rgba(0,0,0,0.7);
   		margin-left: 0px;
   		text-indent: 5px;
   		height: 23px;
   		width: 153px; 
   		border: 1px solid rgba(0,0,0,0.35);
	}
	.invoiceTip{
		display:none; 
		text-align:center;
		border-radius:25px;
		line-height:20px;
		height:20px;
		width:130px;
		background:rgba(233,104,107,0.6); 
		position:absolute; 
		top:40px;
		left:130px;
	}
	.costTip{
		display:none; 
		text-align:center;
		border-radius:25px;
		line-height:20px;
		height:20px;
		width:130px;
		background:rgba(233,104,107,0.6); 
		position:absolute; 
		top:9px;
		left:130px;
	}
	.contactDiv{
		display:none;
        position: absolute;
        z-index:10;
        padding:8px 10px;
        left: 150px; 
        top: 0px; 
        width:260px;
        background-color:rgba(50,83,100,0.7);
	}
	.contactDiv p{
		margin:0px;
		text-align:left;
		line-height:18px;
	}
	.firstP{
		margin-top:10px;
		margin-bottom:10px;
	}
	.conTip{
		display:none;
        position: absolute;
        z-index:10;
        left: 0px; 
        top: -30px; 
        width:200px;
        height:25px;
        line-height:25px;
        background-color:rgba(0,0,0,0.5);
	}
	.ssName{
		display:block;
        position:relative;
	}
	.suMessdiv{
		 display:none;
         position: absolute;
         z-index:10;
         padding:8px 10px;
         left: -250px; 
         top: 0px; 
         width:260px;
         height:200px; 
       	 background-color:rgba(50,83,100,0.7);
	}
	.suMessdiv p{
         line-height:13px;
         text-align:left;
         text-indent: 5px;
    }
</style>
<!-- 订单管理 -->

	<div style="width: 3000px;">
		 	<div class="tit" style="padding-left:350px">
                 <div class="col-md-3 col-xs-6" >
                    <div class="tile quick-stats">
                          <h3 style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px;width:323px; ">订单管理</h3>
                  	</div>
				</div>
           	</div>
        
            <hr class="whiter"/>
              
		<table border="1" id="selorder" >
		 	<tr >
		 		<td>客户名</td>
		 		<td>业务编号</td>
		 		<td>系统号</td>
		 		<td>主单号</td>
		 		<td>分单号</td>
		 		<td>航班号</td>
		 		<td>航班日期</td>
		 		<td>到港日期</td>
		 		<td>起运港</td>
		 		<td>目的港</td>
		 		<td>货物件数</td>
		 		<td>货物重量</td>
		 		<td>计费重量</td>
		 		<td>货物体积</td>
		 		<td>报关单号</td>
		 		<td>报关单状态</td>
		 		<td>订单状态</td>
		 		<td>最近修改时间</td>
		 		<td>备注内容</td>
		 		<td>贸易条款</td>
		 		<td>应收</td>
		 		<td>新增应收</td>
		 		<td>应付</td>
		 		<td>新增应付</td>
		 		<td>操作栏</td>
		 	</tr>
		 	<c:forEach var="order" items="${orderList }">
		 		<tr>
			 		<td>${order.client.clientName }</td>
			 		<td>${order.orderNo }</td>
			 		<td>${order.systemNo }</td>
			 		<td>${order.mawbNo }</td>
			 		<td>${order.hawbNo }</td>
			 		<td>${order.flightNo }</td>
			 		<td>${order.departDate }</td>
			 		<td>${order.arriveDate }</td>
			 		<td>${order.loadingPort }</td>
			 		<td>${order.destination }</td>
			 		<td>${order.cargoPiece }</td>
			 		<td>${order.cargoWeight }</td>
			 		<td>${order.chargeWeight }</td>
			 		<td>${order.cargoVolume }</td>
			 		<td>${order.customsNo }</td>
			 		<td>${order.cusStatus.description }</td>
			 		<td>${order.orderStatus.statusDescription }</td>
			 		<td>${fn:substring(order.updateTime, 0, 19) }</td>
			 		<td>${order.remarks }</td>
			 		<td>${order.terms.code }</td>
			 		<td>
						<c:forEach var="orderCost" items="${order.orderCostList}">
							<div class="ccName">
								<a class="nameContent" costId="${orderCost.id }">${orderCost.client.clientName}</a>
								<div class="messdiv">
									<p>金  额：${orderCost.cost}</p>
									<p>发 票：${orderCost.invoiceNo}</p>
									<p>状 态：
										<c:forEach var="costStatus" items="${costStatusList }">
											<c:if test="${costStatus.id==orderCost.costStatus }">${costStatus.name }</c:if>
										</c:forEach>
									</p>
									<p>
										<a class="ccOperation modifyCost" cost="${orderCost.cost}" invoiceNo="${orderCost.invoiceNo}" costStatus="${orderCost.costStatus }" >修改</a> 
										<a class="ccOperation delCost">删除</a>
									</p>
								</div>
								
	            				<div class="contactDiv">
		            				<c:forEach var="clientcontact" items="${orderCost.client.clientContactlist }">
										<p>姓名：${clientcontact.clientContactName}</p>
										<p>电话：${clientcontact.clientContactTel}</p>
										<p>邮箱：${clientcontact.clientContactEmail}</p>
										<p>Q Q：${clientcontact.clientContactQQ}</p>
										<hr class="firstP" />
									</c:forEach>
								</div>
	            				<p class="conTip">单击查看联系人</p>
							</div>
						</c:forEach>
					</td>
			 		<td><a class="addCost" orderId="${order.orderId }">添加应收</a></td>
			 		<td>
			 			<c:forEach var="orderPay" items="${order.orderPayList}">
							<div class="ssName">
								<a class="nameContent" payId="${orderPay.id }">${orderPay.supplier.supplierName}</a>
								<div class="suMessdiv">
									<p>单 价：${orderPay.unitPrice}</p>
									<p>杂 费：${orderPay.otherPrice}</p>
									<p>总 价：${orderPay.totalPrice }</p>
									<p>发 票：${orderPay.invoiceNo }</p>
									<p>状 态：
										<c:forEach var="costStatus" items="${costStatusList }">
											<c:if test="${costStatus.id==orderPay.payStatus }">${costStatus.name }</c:if>
										</c:forEach>
									</p>
									<p>
										<a class="ccOperation modifyPay" unitPrice="${orderPay.unitPrice}" otherPrice="${orderPay.otherPrice }" totalPrice="${orderPay.totalPrice }" invoiceNo="${orderPay.invoiceNo}" payStatus="${orderPay.payStatus }" >修改</a> 
										<a class="ccOperation delPay">删除</a>
									</p>
								</div>
								
	            				<div class="contactDiv">
		            				<c:forEach var="supplierContact" items="${orderPay.supplier.supplierContacts }">
										<p>姓名：${supplierContact.supplierContactName}</p>
										<p>电话：${supplierContact.supplierContactTel}</p>
										<p>邮箱：${supplierContact.supplierContactEmail}</p>
										<p>Q Q：${supplierContact.supplierContactQQ }</p>
										<hr class="firstP" />
									</c:forEach>
								</div>
	            				<p class="conTip">单击查看联系人</p>
							</div>
						</c:forEach>
			 		</td>
			 		<td><a class="addPay" orderId="${order.orderId }">添加</a></td>
			 		<td><a class="updateOrder" modifyId="${order.orderId }">修改</a>&nbsp;&nbsp;<a>删除</a></td>
		 		</tr>
		 	</c:forEach>
		 	
		 	<tr id="last" style="height:50px;">
            		<td  colspan="21"><a id="firstPage">首页</a><a id="prePage">上一页</a><a id="nextPage">下一页</a><a id="lastPage">末页</a></td>
            </tr> 
		 </table>
	</div>
	<script>
	//修改订单
	$("#selorder").on("click",".updateOrder",function(){
		var orderId = $(this).attr("modifyId");
		var currentPage = ${currentPage };
		$("#home").load("order.do?mn=goUpdateOrder&currentPage="+currentPage+"&orderId="+orderId);
	});
	//添加应收
	$("#selorder").on("click",".addCost",function(){
		var orderId = $(this).attr("orderId");
		var currentPage = ${currentPage };
		$("#home").load("order.do?mn=goAddCost&currentPage="+currentPage+"&orderId="+orderId);
	});
	//添加应付
	$("#selorder").on("click",".addPay",function(){
		var orderId = $(this).attr("orderId");
		var currentPage = ${currentPage };
		$("#home").load("order.do?mn=goAddPay&currentPage="+currentPage+"&orderId="+orderId);
	});
	//分页
	$("#firstPage").click(function(){
		$("#home").load("order.do?mn=showOrders&currentPage=1");
	});
	$("#lastPage").click(function(){
		var totalPage = ${totalPage };
		$("#home").load("order.do?mn=showOrders&currentPage="+totalPage);
	});
	$("#prePage").click(function(){
		var currentPage = ${currentPage }-1;
		if(currentPage==0){
			$(".homeTip").text("已经是第一页了");
			$(".homeTip").show(200);
			setTimeout(function(){
				$(".homeTip").fadeOut(1000);
			},1000);
		}else{
			$("#home").load("order.do?mn=showOrders&currentPage="+currentPage);
		}
	});
	$("#nextPage").click(function(){
		var totalPage = ${totalPage }+1;
		var currentPage = ${currentPage }+1;
		if(totalPage==currentPage){
				$(".homeTip").text("已经是最后一页了");
				$(".homeTip").show(200);
				setTimeout(function(){
					$(".homeTip").fadeOut(1000);
				},1000);
		}else{
			$("#home").load("order.do?mn=showOrders&currentPage="+currentPage);
		}

	});
	//显示应付
	$("#selorder").on("mouseover", ".ssName", function() {
		$(this).find(".nameContent").css("color", "yellow");
		$(this).find(".suMessdiv").show();
	});
	$("#selorder").on("mouseenter", ".nameContent", function() {
		var conTip = $(this).nextAll(".conTip");
		conTip.show();
		setTimeout(function() {
			conTip.hide(800);
		}, 200);
	});
	$("#selorder").on("mouseout", ".ssName", function() {
		$(this).find(".nameContent").css("color", "white");
		$(this).find(".suMessdiv").hide();
	});
	//显示应收
	$("#selorder").on("mouseover", ".ccName", function() {
		$(this).find(".nameContent").css("color", "yellow");
		$(this).find(".messdiv").show();
	});
	$("#selorder").on("mouseenter", ".nameContent", function() {
		var conTip = $(this).nextAll(".conTip");
		conTip.show();
		setTimeout(function() {
			conTip.hide(800);
		}, 200);
	});
	$("#selorder").on("mouseout", ".ccName", function() {
		$(this).find(".nameContent").css("color", "white");
		$(this).find(".messdiv").hide();
	});
	//查看联系人
	$("#selorder").on("click", ".nameContent", function() {
		var using = $(this).nextAll(".contactDiv");
		$("#selorder").find(".contactDiv").not(using).hide();
		using.toggle();
	});
	//删除应付
	$("#selorder").on("click",".delPay",function(){
		if(confirm("确认删除？")){
			var parent = $(this).parents(".ssName");
			var payId = parent.find(".nameContent").attr("payId");
			$.ajax({
				type:"post",
				url:"order.do",
				data:"mn=delPay&payId="+payId,
				success:function(res){
					if(res==1){
						var currentPage = ${currentPage };
						$(".homeTip").text("删除成功");
						$(".homeTip").show(200);
						parent.remove();
						setTimeout(function(){
							$(".homeTip").fadeOut(1500);
						},1000);
					}else{
						alert("删除失败");
					}
				}
			});
		}
	});
	//删除应收
	$("#selorder").on("click",".delCost",function(){
		if(confirm("确认删除？")){
			var parent = $(this).parents(".ccName");
			var costId = parent.find(".nameContent").attr("costId");
			$.ajax({
				type:"post",
				url:"order.do",
				data:"mn=delCost&costId="+costId,
				success:function(res){
					if(res==1){
						var currentPage = ${currentPage };
						$(".homeTip").text("删除成功");
						$(".homeTip").show(200);
						parent.remove();
						setTimeout(function(){
							$(".homeTip").fadeOut(1500);
						},1000);
					}else{
						alert("删除失败");
					}
				}
			});
		}
	});
	//修改应收
	$("#selorder").on("click",".modifyCost",function(){
		if($("#selorder").find("input").length>1){
			$(".homeTip").text("正在修改其他记录");
			$(".homeTip").show(200);
			setTimeout(function(){
				$(".homeTip").fadeOut(1500);
			},1000);
		}else{
			var messdiv = $(this).parents(".messdiv");
			var oldContent = messdiv.children();
			var cost = $(this).attr("cost");
			var invoiceNo = $(this).attr("invoiceNo");
			var costStatus = $(this).attr("costStatus");
			var newContent = $('<p>金  额：<input class="costAmount" value='+cost+'></p><p>发 票：<input class="invNo" value='+invoiceNo+'></p><p>状 态：<select  class="costSta"><c:forEach var="costStatus" items="${costStatusList }"><option value="${costStatus.id }">${costStatus.name }</option></c:forEach></select></p><p><a class="ccOperation saveCost"}">保存</a><a class="ccOperation giveUp">取消</a></p><div class="costTip"></div><div class="invoiceTip"></div>');
			messdiv.empty();
			messdiv.append(newContent);
			var options = messdiv.find("option"); //获取select下拉框的所有值
			for (var j = 1; j < options.length; j++) {
				if ($(options[j]).val() == costStatus) {
				$(options[j]).attr("selected", "selected");
				}
			}
			$(".messdiv").on("click",".giveUp",function(){
				messdiv.empty();
				messdiv.append(oldContent);
			});
		}
	});
	//保存应收修改
	$("#selorder").on("click",".saveCost",function(){
		var parent = $(this).parents(".ccName");
		var costId = parent.find(".nameContent").attr("costId");
		var cost = parent.find("input").eq(0).val();
		var invoiceNo = parent.find("input").eq(1).val();
		var costStatus = parent.find("select").val();
		
		if(cost==""||cost==null){
			$(".costTip").text("请输入金额");
			$(".costTip").fadeIn(200);
			$(".costAmount").focus();
			setTimeout(function(){
				$(".costTip").fadeOut(2000);
			},1000);
		}else if(invoiceNo!=""&&invoiceNo!=null&&isNaN(invoiceNo)){
			$(".invoiceTip").text("请输入正确的发票号");
			$(".invoiceTip").fadeIn(200);
			$(".invNo").focus();
			setTimeout(function(){
				$(".invoiceTip").fadeOut(2000);
			},1000);
		}else{
			$.ajax({
				type:"post",
				url:"order.do",
				data:"mn=updateCost&costId="+costId+"&cost="+cost+"&invoiceNo="+invoiceNo+"&costStatus="+costStatus,
				success:function(res){
					if(res==1){
						var currentPage = ${currentPage };
						$("#home").load("order.do","mn=showOrders&currentPage="+currentPage);
					}else{
						alert("修改失败");
					}
				}
			});
		}
		
	});
	</script>