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
			#clientTip{
				display:inline-block;
				position:absolute;
				top:63px;
				left:380px;
				width:200px;
			}
			#costTip{
				display:inline-block;
				position:absolute;
				top:113px;
				left:380px;
				width:200px;
			}
</style>
<div class="tit">
                    <div class="col-md-3 col-xs-6" >
                        <div class="tile quick-stats" >
                            <h3  style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">添加应收</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
        <form id="addCostform">
        <table id="selpayorder">
        	<tr>
        		<td>业务编号：</td>
        		<td>${order.orderNo }</td>
        	</tr>
        	<tr>
        		<td>应收客户：</td>
        		<td><input id="clientName" class="inpu" placeholder="公司抬头" /><span style="margin-left: 10px;">*</span><p id="clientTip" class="tip-cost"></p>
        			<input type="hidden" id="clientId" name="clientId" />
					<div class="findDiv"></div>
        		</td>
        	</tr>
        	<tr>
        		<td>应收费用：</td>
        		<td>
        			<input id="cost" class="inpu" name="cost" placeholder="应收金额" type="number" step="1" max="99999999" /><span style="margin-left: 10px;">*</span><p id="costTip" class="tip-cost"></p>
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
        			<input id="addCost" class="costButton" type="button" value="添加"/>
        			<input id="resCost" class="costButton" type="button" value="返回"/>
        		</td>
        	</tr>
        </table>        
        </form>
        
        <script>
        	//候选
	        $("#clientName").keyup(function(){
				$(".findDiv").empty();
				var clientName = $(this).val();
				if(clientName!=""&&clientName!=null){
					$.ajax({
						url:"client.do",
						type:"post",
						data:"mn=findClient&clientName="+clientName,
						success:function(res){
							var clientJson = JSON.parse(res);
							for(var i=0;i<clientJson.length;i++){
								var holder = $('<a class="holder">'+clientJson[i].clientName+'</a>');
								$(".findDiv").append(holder);
							}
						}
					});
				}
			});
	        $(".findDiv").on("click",".holder",function(){
				var name = $(this).text();
				$("#clientName").val(name);
				$(".findDiv").empty();
			});
			$("#clientName").blur(function(){
				setTimeout(function(){
					$(".findDiv").empty();
				},150);
			});
			//返回
			$("#resCost").click(function(){
				var currentPage=${currentPage };
				var backdo = "${param.backdo }";
				var backmn = "${param.backmn}";
				$("#home").load(backdo,"mn="+backmn+"&currentPage="+currentPage);
			});
			$("#addCost").click(function(){
				$(".tip-cost").text("");
				var clientName = $("#clientName").val();
				var cost = $("#cost").val();
				if(clientName==""||clientName==null){
					$("#clientTip").text("请输入客户抬头");
					$("#clientName").focus();
				}else if(cost==""||cost==null){
					$("#costTip").text("请输入金额");
					$("#cost").focus();
				}else{
					$.ajax({
						"url":"client.do",
						"type":"post",
						"data":"mn=checkClient&clientName="+clientName,
						"success":function(res){
							if(res==0){
								$("#clientTip").text("不存在此公司，请先添加");
							}else{
								var orderId = ${order.orderId };
								$("#clientTip").text("");
								$("#clientId").val(res);
								var content = $("#addCostform").serialize();
								$.ajax({
									"url":"order.do",
									"type":"post",
									"data":"mn=addCost&orderId="+orderId+"&"+content,
									"success":function(res){
										if(res==1){
											var currentPage=${currentPage };
											var backdo = "${param.backdo }";
											var backmn = "${param.backmn}";
											$(".homeTip").text("添加成功！");
											$(".homeTip").show(200);
											$("#home").load(backdo,"mn="+backmn+"&currentPage="+currentPage);
											setTimeout(function(){
												$(".homeTip").fadeOut(1000);
											},1000);
										}
									}
							});
						}
					}
				});
				}
			});
        </script>