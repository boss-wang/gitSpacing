<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		
		
		<style>
			#myOrderTable tr{
				text-align:center;
			}
			#myOrderTable tr:nth-child(odd) {
				background:rgba(0,0,0,0.1);
			}
		</style>
		
</head>
<body>
	
		<a name="abstract"></a>
			<div class="container">
				<caption id="cap">
					<div class="index-title">
						<a href="#"  title="公司简介">查看订单</a>
					</div>
				</caption>
				<center>
					<table id="myOrderTable"  width="100%">
						
						<tr>
							<th><span>业务编号</span></th>
							<th><span>主单号</span></th>
							<th><span>分单号</span></th>
							<th><span>发货日期</span></th>
							<th><span>到货日期</span></th>
							<th><span>目的地</span></th>
							<th><span>贸易方式</span></th>
							<th><span>件数</span></th>
							<th><span>重量</span></th>
							<th><span>体积</span></th>
							<th><span>订单状态</span></th>
							
						</tr>
						<c:forEach var="order" items="${orderList }">
							<tr>
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
					</table>
				</center>
				<!--cont end-->
		
			<!--container end-->
		</div>
		
</body>
</html>