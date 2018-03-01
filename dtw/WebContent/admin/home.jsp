<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<body>
	<div class="tit">
                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats" style="width:325px;">
                            <h3  style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px;">操作导航</h3>
                    	</div>
					</div>
                </div>
		<table id="homesection">
		
			<tr>
				<td id="usermanage" ><img src="img/usermanage.jpg" title="员工管理"></td>
				<td id="clientmanage"><img src="img/clientmanage.jpg" title="客户管理"></td>
				
			</tr>
			<tr>
				<td id="suppliermanage"><img src="img/suppliermanage.jpg" title="供应商管理"></td>
				<td id="allordermanage"><img src="img/allordermanage.jpg" title="所有订单管理"></td>
			</tr>
		</table>
</body>
<script>
	$("#usermanage").click(function(){
		$("#home").load("user.do","mn=showUser");
	})
	$("#clientmanage").click(function(){
			$("#home").load("client.do?mn=showClient");
	})
	$("#suppliermanage").click(function(){
			$("#home").load("supplier.do","mn=showSupplier");
	})
	$("#allordermanage").click(function(){
			$("#home").load("order.do","mn=showOrders");
	})
</script>