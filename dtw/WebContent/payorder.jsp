<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
 #payOrderTable tr{
				text-align:center;
				height: 30px;
			}
			
			#payOrderTable th{
				height: 30px;
			}
			#payOrderTable tr:last-child{
				height: 30px;
			}
			#payOrderTable tr td{
				padding-top:10px;
				padding-bottom:10px;
			}
			#payOrderTable tr:nth-child(odd) {
				background:rgba(0,0,0,0.1);
			}
			#pageTip{
				position:absolute;
				display:none;
				border-radius:6px;
				top:52px;
				left:500px;
				padding:3px 10px 3px 10px;
				background:rgba(89,154,222,1);
			}
</style>
<body>
	<a name="abstract"></a>
			<div class="container">
				<caption id="cap">
					<div class="index-title">
						<a >订单付款</a>
					</div>
				</caption>
				<div id="pageTip"></div>
				<center>
					<table id="payOrderTable"  width="100%">
						
						<tr>
							<th><span>业务编号</span></th>
							<th><span>主单号</span></th>
							<th><span>分单号</span></th>
							<th><span>发货日期</span></th>
							<th><span>目的地</span></th>
							<th><span>件数</span></th>
							<th><span>重量</span></th>
							<th><span>体积</span></th>
							<th><span>应付金额</span></th>
							<th><span>付款状态</span></th>
							
						</tr>
						<c:if test="${orderList!=null }">
						<c:forEach var="order_cost" items="${orderList }">
							<tr>
							<td>${order_cost.order.orderNo }</td>
							<td>${order_cost.order.mawbNo }</td>
							<td>${order_cost.order.hawbNo }</td>
							<td>${order_cost.order.departDate }</td>
							<td>${order_cost.order.destination }</td>
							<td>${order_cost.order.cargoPiece }</td>
							<td>${order_cost.order.cargoWeight }</td>
							<td>${order_cost.order.cargoVolume }</td>
							<td>${order_cost.cost }</td>
							<td>${order_cost.statusName.name }</td>
						</tr>
						</c:forEach>
						</c:if>
						
						<c:if test="${empty orderList  }">
						<tr><td colspan="11">暂无付款订单</td></tr>
						</c:if>
						
						<tr >
            				<th  colspan="11"><a id="firstPage">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="prePage">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="nextPage">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="lastPage">末页</a></th>
          			    </tr> 
					</table>
				</center>
		</div>
</body>
<script>
$("#firstPage").click(function(){
		$("#homeDiv").load("custorder.do","mn=showCustomerPayOrdersByClientId&currentPage=1");
	});
	$("#lastPage").click(function(){
		var totalPage = ${totalPage };
		$("#homeDiv").load("custorder.do","mn=showCustomerPayOrdersByClientId&currentPage="+totalPage);
	});
	$("#prePage").click(function(){
		var currentPage = ${currentPage }-1;
		if(currentPage==0){
			$("#pageTip").text("已经是第一页了");
			$("#pageTip").show(200);
			setTimeout(function(){
				$("#pageTip").fadeOut(1000);
			},1000);
		}else{
			$("#homeDiv").load("custorder.do","mn=showCustomerPayOrdersByClientId&currentPage="+currentPage);
		}
	});
	$("#nextPage").click(function(){
		var totalPage = ${totalPage }+1;
		var currentPage = ${currentPage }+1;
		if(totalPage==currentPage){
				$("#pageTip").text("已经是最后一页了");
				$("#pageTip").show(200);
				setTimeout(function(){
					$("#pageTip").fadeOut(1000);
				},1000);
		}else{
			$("#homeDiv").load("custorder.do","mn=showCustomerPayOrdersByClientId&currentPage="+currentPage);
		}
	
	});
	</script>