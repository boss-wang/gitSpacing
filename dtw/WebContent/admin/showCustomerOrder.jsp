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
	.suMessdiv input{
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
	.payTip{
		display:none; 
		text-align:center;
		border-radius:25px;
		line-height:20px;
		height:20px;
		width:130px;
		background:rgba(233,104,107,0.6); 
		position:absolute; 
		top:71px;
		left:130px;
	}
	.payInvoiceTip{
		display:none; 
		text-align:center;
		border-radius:25px;
		line-height:20px;
		height:20px;
		width:130px;
		background:rgba(233,104,107,0.6); 
		position:absolute; 
		top:102px;
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
         height:210px; 
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
                          <h3 style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px;width:323px; ">客户自助下单</h3>
                  	</div>
				</div>
           	</div>
        
            <hr class="whiter"/>
            <input type="hidden" value="customerOrder" class="searchPage" />
		<table border="1" id="selorder" >
		 	<tr >
		 		<td>客户名</td>
		 		<td>业务编号</td>
		 		<td>联系人</td>
		 		<td>系统号</td>
		 		<td>主单号</td>
		 		<td>分单号</td>
		 		<td>航班号</td>
		 		<td>航班日期</td>
		 		<td>到港日期</td>
		 		<td>起运港</td>
		 		<td>目的港</td>
		 		<td>货物件数</td>
		 		<td>毛重（KG）</td>
		 		<td>计重（KG）</td>
		 		<td>体积（m³）</td>
		 		<td>报关单号</td>
		 		<td>报关单状态</td>
		 		<td>下单时间</td>
		 		<td>备注内容</td>
		 		<td>贸易条款</td>
		 		<td>收入</td>
		 		<td>新增收入</td>
		 		<td>支出</td>
		 		<td>新增支出</td>
		 		<td>订单状态</td>
		 		<td>操作栏</td>
		 	</tr>
		 	<c:forEach var="order" items="${orderList }">
		 		<tr>
			 		<td>${order.client.clientName }</td>
			 		<td>${order.orderNo }</td>
			 		<td>
			 			<div class="ccName">
			 				<a class="nameContent">${order.clientcontact.clientContactName}</a>
							<div class="messdiv">
								<p>电话：${order.clientcontact.clientContactTel}</p>
								<p>邮箱：${order.clientcontact.clientContactEmail}</p>
								<p>Q Q：${order.clientcontact.clientContactQQ}</p>
							</div>
						</div>
					</td>
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
									<c:if test="${order.orderStatus.statusId!=6&&order.orderStatus.statusId!=7&&order.orderStatus.statusId!=8 }">
										<p>
											<c:if test="${orderCost.costStatus!=3 }">
												<a class="ccOperation modifyCost" cost="${orderCost.cost}" invoiceNo="${orderCost.invoiceNo}" costStatus="${orderCost.costStatus }" >修 改</a> 
												<c:if test="${orderCost.costStatus==1 }">
													<a class="ccOperation delCost">删 除</a>	
												</c:if>
												<c:if test="${orderCost.costStatus==2 }">
													<a class="ccOperation">催 款</a>	
												</c:if>
											</c:if>
										</p>
									</c:if>
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
			 		<td>
			 			<c:if test="${order.orderStatus.statusId!=6&&order.orderStatus.statusId!=7&&order.orderStatus.statusId!=8 }">
			 				<a class="addCost" orderId="${order.orderId }" clientName="${order.client.clientName }">添加</a>
			 			</c:if>
			 		</td>
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
									<c:if test="${order.orderStatus.statusId!=6&&order.orderStatus.statusId!=7&&order.orderStatus.statusId!=8 }">
										<p>
											<c:if test="${orderPay.payStatus!=3 }">
												<a class="ccOperation modifyPay" unitPrice="${orderPay.unitPrice}" otherPrice="${orderPay.otherPrice }" totalPrice="${orderPay.totalPrice }" invoiceNo="${orderPay.invoiceNo}" payStatus="${orderPay.payStatus }" >修改</a>  
												<c:if test="${orderPay.payStatus==1 }">
													<a class="ccOperation delPay">删除</a>	
												</c:if>
												<c:if test="${orderPay.payStatus==2 }">
													<a class="ccOperation">付 款</a>	
												</c:if>
											</c:if>
										</p>
									</c:if>
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
			 		<td>
			 			<c:if test="${order.orderStatus.statusId!=6&&order.orderStatus.statusId!=7&&order.orderStatus.statusId!=8 }">
			 				<a class="addPay" orderId="${order.orderId }">添加</a>
			 			</c:if>
			 		</td>
			 		<td>${order.orderStatus.statusDescription }</td>
			 		<td>
			 			<c:if test="${order.orderStatus.statusId!=6&&order.orderStatus.statusId!=7&&order.orderStatus.statusId!=8 }">
			 				<a class="updateOrder" modifyId="${order.orderId }">修改</a>&nbsp;&nbsp;<a class="cancel" orderId="${order.orderId }">取消</a>
			 			</c:if>
			 			<c:if test="${order.orderStatus.statusId==6}">
			 				<a class="takeOrder" orderId="${order.orderId }" contactTel="${order.clientcontact.clientContactTel}" orderNo="${order.orderNo }">接单</a>&nbsp;&nbsp;<a class="refuse" orderId="${order.orderId }" orderNo="${order.orderNo }" contactTel="${order.clientcontact.clientContactTel}">取消</a>
			 			</c:if>
			 			<c:if test="${order.orderStatus.statusId==7||order.orderStatus.statusId==8}">
			 				<a class="delOrder" orderId="${order.orderId }">删除</a>
			 			</c:if>
			 		</td>
		 		</tr>
		 	</c:forEach>
		 	
		 	<tr id="last" style="height:50px;">
            		<td  colspan="26"><a id="firstPage">首页</a><a id="prePage">上一页</a><a id="nextPage">下一页</a><a id="lastPage">末页</a></td>
            </tr> 
		 </table>
	</div>
	<script>
	//删除订单
	$("#selorder").on("click",".delOrder",function(){
		if(confirm("确认删除订单？")){
			var currentPage = ${currentPage };
			var orderId = $(this).attr("orderId");
			$.ajax({
				url:"order.do",
				type:"post",
				data:"mn=delOrder&orderId="+orderId,
				success:function(res){
					if(res==1){
						$(".homeTip").text("已删除！");
						$(".homeTip").show(200);
						$("#home").load("order.do?mn=showCustomerOrders&currentPage="+currentPage);
						setTimeout(function(){
							$(".homeTip").fadeOut(1000);
						},1000);
					}
				}
			});
		}
	});
	//通过审核
	$("#selorder").on("click",".takeOrder",function(){
		var orderId = $(this).attr("orderId");
		var currentPage = ${currentPage };
		var contactTel = $(this).attr("contactTel");
		var orderNo = $(this).attr("orderNo");
		if(confirm("确认接单？")){
			$.ajax({
				url:"custorder.do",
				type:"post",
				data:"mn=takeOrder&orderId="+orderId+"&contactTel="+contactTel+"&orderNo="+orderNo,
				success:function(res){
					if(res==1){
						$(".homeTip").text("接单成功！");
						$(".homeTip").show(200);
						$("#home").load("order.do?mn=showCustomerOrders&currentPage="+currentPage);
						setTimeout(function(){
							$(".homeTip").fadeOut(1000);
						},1000);
					}
				}
			});
		}
	});
	//审核不通过
	$("#selorder").on("click",".refuse",function(){
		var contactTel = $(this).attr("contactTel");
		var orderId = $(this).attr("orderId");
		var orderNo = $(this).attr("orderNo");
		var currentPage = ${currentPage };
		if(confirm("确认取消接单？")){
			$.ajax({
				url:"custorder.do",
				type:"post",
				data:"mn=refuseOrder&orderId="+orderId+"&contactTel="+contactTel+"&orderNo="+orderNo,
				success:function(res){
					if(res==1){
						$(".homeTip").text("已取消接单");
						$(".homeTip").show(200);
						$("#home").load("order.do?mn=showCustomerOrders&currentPage="+currentPage);
						setTimeout(function(){
							$(".homeTip").fadeOut(1000);
						},1000);
					}
				}
			});
		}
	});
	//取消订单
	$("#selorder").on("click",".cancel",function(){
		var orderId = $(this).attr("orderId");
		var currentPage = ${currentPage };
		if(confirm("确认取消此票订单？")){
			$.ajax({
				url:"custorder.do",
				type:"post",
				data:"mn=cancelOrder&orderId="+orderId,
				success:function(res){
					if(res==1){
						$(".homeTip").text("此票订单已取消");
						$(".homeTip").show(200);
						$("#home").load("order.do?mn=showCustomerOrders&currentPage="+currentPage);
						setTimeout(function(){
							$(".homeTip").fadeOut(1000);
						},1000);
					}
				}
			});
		}
	});
	//修改订单
	$("#selorder").on("click",".updateOrder",function(){
		var orderId = $(this).attr("modifyId");
		var currentPage = ${currentPage };
		$("#home").load("order.do?mn=goUpdateOrder&currentPage="+currentPage+"&orderId="+orderId+"&backdo=order.do&backmn=showCustomerOrders");
	});
	//添加应收
	$("#selorder").on("click",".addCost",function(){
		var orderId = $(this).attr("orderId");
		var clientName = $(this).attr("clientName");
		var currentPage = ${currentPage };
		$("#home").load("order.do?mn=goAddCost&currentPage="+currentPage+"&orderId="+orderId+"&backdo=order.do&backmn=showCustomerOrders&clientName="+clientName);
	});
	//添加应付
	$("#selorder").on("click",".addPay",function(){
		var orderId = $(this).attr("orderId");
		var currentPage = ${currentPage };
		$("#home").load("order.do?mn=goAddPay&currentPage="+currentPage+"&orderId="+orderId+"&backdo=order.do&backmn=showCustomerOrders");
	});
	//分页
	$("#selorder").on("click","#firstPagey",function(){
		var serchContent = "${param.serchContent }";
		if(serchContent!=null&&serchContent!=""){
			$("#home").load("order.do","mn=searchCustomerOrders&currentPage=1&serchContent="+serchContent);
		}else{
			$("#home").load("order.do?mn=showCustomerOrders&currentPage=1");
		}
	});
	$("#selorder").on("click","#lastPage",function(){
		var totalPage = ${totalPage };
		var serchContent = "${param.serchContent }";
		if(serchContent!=null&&serchContent!=""){
			$("#home").load("order.do","mn=searchCustomerOrders&currentPage="+totalPage+"&serchContent="+serchContent);
		}else{
			$("#home").load("order.do?mn=showCustomerOrders&currentPage="+totalPage);
		}
	});
	$("#selorder").on("click","#prePage",function(){
		var currentPage = ${currentPage }-1;
		if(currentPage==0){
			$(".homeTip").text("已经是第一页了");
			$(".homeTip").show(200);
			setTimeout(function(){
				$(".homeTip").fadeOut(1000);
			},1000);
		}else{
			var serchContent = "${param.serchContent }";
			if(serchContent!=null&&serchContent!=""){
				$("#home").load("order.do","mn=searchCustomerOrders&currentPage="+currentPage+"&serchContent="+serchContent);
			}else{
				$("#home").load("order.do?mn=showCustomerOrders&currentPage="+currentPage);
			}
		}
	});
	$("#selorder").on("click","#nextPage",function(){
		var totalPage = ${totalPage }+1;
		var currentPage = ${currentPage }+1;
		if(totalPage==currentPage){
				$(".homeTip").text("已经是最后一页了");
				$(".homeTip").show(200);
				setTimeout(function(){
					$(".homeTip").fadeOut(1000);
				},1000);
		}else{
			var serchContent = "${param.serchContent }";
			if(serchContent!=null&&serchContent!=""){
				$("#home").load("order.do","mn=searchCustomerOrders&currentPage="+currentPage+"&serchContent="+serchContent);
			}else{
				$("#home").load("order.do?mn=showCustomerOrders&currentPage="+currentPage);
			}
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
	//修改应付 
	$("#selorder").on("click",".modifyPay",function(){
		if($("#selorder").find("input").length>1){
			$(".homeTip").text("正在修改其他记录");
			$(".homeTip").show(200);
			setTimeout(function(){
				$(".homeTip").fadeOut(1500);
			},1000);
		}else{
			var messdiv = $(this).parents(".suMessdiv");
			var oldContent = messdiv.children();
			
			var unitPrice = $(this).attr("unitPrice");
			var otherPrice = $(this).attr("otherPrice");
			var totalPrice = $(this).attr("totalPrice");
			var invoiceNo = $(this).attr("invoiceNo");
			var payStatus = $(this).attr("payStatus");
			var newContent = $('<p>单  价：<input class="unitPrice" value='+unitPrice+'></p><p>杂  费：<input class="otherPrice" value='+otherPrice+'></p><p>总  价：<input class="totalPrice" value='+totalPrice+'></p><p>发 票：<input class="invNo" value='+invoiceNo+'></p><p>状 态：<select  class="costSta"><c:forEach var="costStatus" items="${costStatusList }"><option value="${costStatus.id }">${costStatus.name }</option></c:forEach></select></p><p><a class="ccOperation savePay"}">保存</a><a class="ccOperation giveUp">取消</a></p><div class="payTip"></div><div class="payInvoiceTip"></div>');
			messdiv.empty();
			messdiv.append(newContent);
			var options = messdiv.find("option"); //获取select下拉框的所有值
			for (var j = 1; j < options.length; j++) {
				if ($(options[j]).val() == payStatus) {
				$(options[j]).attr("selected", "selected");
				}
			}
			$(".suMessdiv").on("click",".giveUp",function(){
				messdiv.empty();
				messdiv.append(oldContent);
			});
		}
	});
	//保存应付修改
	$("#selorder").on("click",".savePay",function(){
		var parent = $(this).parents(".ssName");
		var payId = parent.find(".nameContent").attr("payId");
		var unitPrice = parent.find("input").eq(0).val();
		var otherPrice = parent.find("input").eq(1).val();
		var totalPrice = parent.find("input").eq(2).val();
		var invoiceNo = parent.find("input").eq(3).val();
		var payStatus = parent.find("select").val();
		
		if(totalPrice==""||totalPrice==null){
			$(".payTip").text("请输入总金额");
			$(".payTip").fadeIn(200);
			$(".totalPrice").focus();
			setTimeout(function(){
				$(".payTip").fadeOut(2000);
			},1000);
		}else if(invoiceNo!=""&&invoiceNo!=null&&isNaN(invoiceNo)){
			$(".payInvoiceTip").text("请输入正确的发票号");
			$(".payInvoiceTip").fadeIn(200);
			$(".invNo").focus();
			setTimeout(function(){
				$(".payInvoiceTip").fadeOut(2000);
			},1000);
		}else{
			$.ajax({
				type:"post",
				url:"order.do",
				data:"mn=updatePay&payId="+payId+"&unitPrice="+unitPrice+"&otherPrice="+otherPrice+"&totalPrice="+totalPrice+"&invoiceNo="+invoiceNo+"&payStatus="+payStatus,
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
						$("#home").load("order.do","mn=showCustomerOrders&currentPage="+currentPage);
					}else{
						alert("修改失败");
					}
				}
			});
		}
		
	});

	</script>