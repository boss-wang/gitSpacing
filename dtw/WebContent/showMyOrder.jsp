<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		
		
		<style>
			#myOrderTable tr{
				text-align:center;
				height: 30px;
			}
			#myOrderTable th{
				height: 30px;
			}
			#myOrderTable tr:last-child{
				height: 30px;
			}
			#myOrderTable tr td{
				padding-top:10px;
				padding-bottom:10px;
			}
			#myOrderTable tr:nth-child(odd) {
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
		
</head>
<body>
	
		<a name="abstract"></a>
			<div class="container">
				<caption id="cap">
					<div class="index-title">
						<a  title="公司简介">查看订单</a>
					</div>
				</caption>
				<div id="pageTip"></div>
				<center>
					<table id="myOrderTable"  width="100%">
						
						<tr>
							<th><span>下单时间</span></th>
							<th><span>下单人</span></th>
							<th><span>业务编号</span></th>
							<th><span>主单号</span></th>
							<th><span>分单号</span></th>
							<th><span>发货日期</span></th>
							<th><span>到货日期</span></th>
							<th><span>目的地</span></th>
							<th><span>条款</span></th>
							<th><span>件数</span></th>
							<th><span>重量(KG)</span></th>
							<th><span>体积(m³)</span></th>
							<th><span>订单状态</span></th>
							
						</tr>
						<c:forEach var="order" items="${orderList }">
							<tr>
							<td>${fn:substring(order.updateTime,2,16) }</td>
							<td>${order.clientcontact.clientContactName }</td>
							<td>${order.orderNo }</td>
							<td>${order.mawbNo }</td>
							<td>${order.hawbNo }</td>
							<td>${order.departDate }</td>
							<td>${order.arriveDate }</td>
							<td>${order.destination }</td>
							<td>
								<c:forEach var="terms" items="${termsList }">
									<c:if test="${terms.id==order.termsId }">${terms.code }</c:if>
								</c:forEach>
							</td>
							<td>${order.cargoPiece }</td>
							<td>${order.cargoWeight }</td>
							<td>${order.cargoVolume }</td>
							<td>
								<c:forEach var="status" items="${statusList }">
									<c:if test="${status.statusId==order.statusId }">${status.statusDescription }</c:if>
								</c:forEach>
							</td>
						</tr>
						</c:forEach>
						<c:if test="${empty orderList  }">
						<tr><td colspan="11">暂无任何订单</td></tr>
						</c:if>
						<tr >
            				<th  colspan="13"><a id="firstPage">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="prePage">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="nextPage">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="lastPage">末页</a></th>
          			    </tr> 
					</table>
				</center>
				<!--cont end-->
		
			<!--container end-->
		</div>
</body>
<script type="text/javascript">
	//分页
	$("#firstPage").click(function(){
		$("#homeDiv").load("custorder.do","mn=showCustomerOrdersByClientId&currentPage=1");
	});
	$("#lastPage").click(function(){
		var totalPage = ${totalPage };
		$("#homeDiv").load("custorder.do","mn=showCustomerOrdersByClientId&currentPage="+totalPage);
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
			$("#homeDiv").load("custorder.do","mn=showCustomerOrdersByClientId&currentPage="+currentPage);
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
			$("#homeDiv").load("custorder.do","mn=showCustomerOrdersByClientId&currentPage="+currentPage);
		}
	
	});
</script>
</html>