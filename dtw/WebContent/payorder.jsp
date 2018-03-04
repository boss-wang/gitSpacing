<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
 #payOrderTable tr{
				text-align:center;
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
						<c:forEach var="order" items="${orderList }">
							<tr>
							<td>${order.orderNo }</td>
							<td>${order.mawbNo }</td>
							<td>${order.hawbNo }</td>
							<td>${order.departDate }</td>
							<td>${order.destination }</td>
							<td>${order.cargoPiece }</td>
							<td>${order.cargoWeight }</td>
							<td>${order.cargoVolume }</td>
							<td>${order.order_cost.cost }</td>
							<td>${order.order_cost.statusName.name }</td>
						</tr>
						</c:forEach>
						
						<tr style="height:50px;">
            				<th  colspan="11"><a id="firstPage">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="prePage">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="nextPage">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="lastPage">末页</a></th>
          			    </tr> 
					</table>
				</center>
		</div>
</body>
