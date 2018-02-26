<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 订单管理 -->

	<div style="width: 2500px;">
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
			 		<td><a>查看应收</a></td>
			 		<td><a class="addCost" orderId="${order.orderId }">添加</a></td>
			 		<td><a>查看应付</a></td>
			 		<td><a>添加</a></td>
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
	</script>