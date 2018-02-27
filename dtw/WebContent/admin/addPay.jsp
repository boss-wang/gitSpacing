<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
		 	#selpayorder{
		 		position:absolute;
		 		margin-top:30px ;
            	margin-left:300px ;
            	border-collapse:collapse ;
            	padding: 20px;
            	font-size: 14px; 
            	line-height: 30px;
            	border: 1px solid rgba(0,0,0,0.2);
            		
		 	}
		 	#selpayorder tr{
		 		border: 1px solid rgba(0,0,0,0.2);
		 	}
		 	#selpayorder tr>td{
		 		padding: 10px;
		 	}
		 	.costButton{
		 		background: rgba(0,0,0,0.1);
        		border: 1px solid rgba(0,0,0,0.5);
        		width: 125px;
        		height: 30px;
        		font-size: 15px;
        		text-align: 30px;
        		margin: 10px auto 0 30px;
		 	}
		 	.costButton:hover{
            		background: rgba(0,0,0,0.5);
            	}
            .findDiv{
				position: absolute;
				z-index: 10;
				height: 200px;
				top: 92px;
				left: 101px;
			}
			#supplierTip{
				display:inline-block;
				position:absolute;
				top:63px;
				left:380px;
				width:200px;
			}
			#totalPriceTip{
				display:inline-block;
				position:absolute;
				top:213px;
				left:380px;
				width:200px;
			}
</style>
<div class="tit">
                    <div class="col-md-3 col-xs-6" >
                        <div class="tile quick-stats" >
                            <h3  style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">添加应付</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
        <form id="addPayform">
        <table id="selpayorder">
        	<tr>
        		<td>业务编号：</td>
        		<td>${order.orderNo }</td>
        	</tr>
        	<tr>
        		<td>供应商：</td>
        		<td><input id="supplierName" class="inpu" placeholder="公司抬头" /><span style="margin-left: 10px;">*</span><p id="supplierTip" class="tip-cost"></p>
        			<input type="hidden" id="supplierId" name="supplierId" />
					<div class="findDiv"></div>
        		</td>
        	</tr>
        	<tr>
        		<td>单价：</td>
        		<td>
        			<input id="unitPrice" class="inpu" name="unitPrice" placeholder="单价" type="number" step="1" max="99999999" />
        		</td>
        	</tr>
        	<tr>
        		<td>杂费：</td>
        		<td>
        			<input id="otherPrice" class="inpu" name="otherPrice" placeholder="杂费" type="number" step="1" max="99999999" />
        		</td>
        	</tr>
        	<tr>
        		<td>总价：</td>
        		<td>
        			<input id="totalPrice" class="inpu" name="totalPrice" placeholder="总价" type="number" step="1" max="99999999" /><span style="margin-left: 10px;">*</span><p id="totalPriceTip" class="tip-cost"></p>
        		</td>
        	</tr>
        	<tr>
        		<td>发票号：</td>
        		<td>
        			<input id="invoiceNo" class="inpu" name="invoiceNo" placeholder="发票号"  />
        		</td>
        	</tr>
        	<tr>
        		<td>付款状态：</td>
        		<td>
        			<select class="inpu" id="costStatus" name="costStatus">
	        			<c:forEach var="costStatus" items="${costStatusList }">
	        				<option value="${costStatus.id }">${costStatus.name }</option>
	        			</c:forEach>
        			</select>
        		</td>
        	</tr>
        	<tr>
        		<td colspan="2">
        			<input id="addPay" class="costButton" type="button" value="添加"/>
        			<input id="resPay" class="costButton" type="button" value="返回"/>
        		</td>
        	</tr>
        </table>        
        </form>
        
        <script>
        	//候选
	        $("#supplierName").keyup(function(){
				$(".findDiv").empty();
				var supplierName = $(this).val();
				if(supplierName!=""&&supplierName!=null){
					$.ajax({
						url:"supplier.do",
						type:"post",
						data:"mn=findSupplier&supplierName="+supplierName,
						success:function(res){
							var supplierJson = JSON.parse(res);
							for(var i=0;i<supplierJson.length;i++){
								var holder = $('<a class="holder">'+supplierJson[i].supplierName+'</a>');
								$(".findDiv").append(holder);
							}
						}
					});
				}
			});
	        $(".findDiv").on("click",".holder",function(){
				var name = $(this).text();
				$("#supplierName").val(name);
				$(".findDiv").empty();
			});
			$("#supplierName").blur(function(){
				setTimeout(function(){
					$(".findDiv").empty();
				},150);
			});
			//返回
			$("#resPay").click(function(){
				var currentPage=${currentPage };
				$("#home").load("order.do","mn=showOrders&currentPage="+currentPage);
			});
			//保存添加
			$("#addPay").click(function(){
				$(".tip-cost").text("");
				var supplierName = $("#supplierName").val();
				var totalPrice = $("#totalPrice").val();
				if(supplierName==""||supplierName==null){
					$("#supplierTip").text("请输入客户抬头");
					$("#supplierName").focus();
				}else if(totalPrice==""||totalPrice==null){
					$("#totalPriceTip").text("请输入总金额");
					$("#totalPrice").focus();
				}else{
					$.ajax({
						"url":"supplier.do",
						"type":"post",
						"data":"mn=checkSupplier&supplierName="+supplierName,
						"success":function(res){
							if(res==0){
								$("#supplierTip").text("不存在此公司，请先添加");
							}else{
								var orderId = ${order.orderId };
								$("#supplierTip").text("");
								$("#supplierId").val(res);
								var content = $("#addPayform").serialize();
								$.ajax({
									"url":"order.do",
									"type":"post",
									"data":"mn=addPay&orderId="+orderId+"&"+content,
									"success":function(res){
										if(res==1){
											var currentPage=${currentPage };
											$(".homeTip").text("添加成功！");
											$(".homeTip").show(200);
											$("#home").load("order.do","mn=showOrders&currentPage="+currentPage);
											setTimeout(function(){
												$(".homeTip").fadeOut(1000);
											},1000);
										}else{
											alert("添加失败");
										}
									}
							});
						}
					}
				});
				}
			});
        </script>