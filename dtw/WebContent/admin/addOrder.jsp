<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.rightTip{
		margin-left: 860px; 
        line-height: 30px;
        margin-top:-28px;
	}
</style>
<body  style="background-color: rgba(0,0,0,0);">
		<!-- 添加订单 -->
		<div class="tit">
                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats">
                            <h3  style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">添加订单</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
		<!-- 表单内容 -->
			<div >
			<form id="frm">
				<div class="line">
					<div class="tit-mess" style="display: inline-block;">
						<span class="mess">客&nbsp;&nbsp;&nbsp;&nbsp;户</span>
						<input id="clientName" class="inpu" placeholder="客户公司抬头"/><span style="margin-left: 10px;">*</span><p id="clientTip" class="tip"></p>
						<input type="hidden" id="clientId" name="clientId" />
						<div class="findClient"></div>
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">起运港</span>
						<input  class="inpu" id="loadingPort" name="loadingPort" placeholder="起运港" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
				</div>
				<div class="line">
					<div  class="tit-mess" style="display: inline-block;">
						<span class="mess">系&nbsp;&nbsp;统&nbsp;&nbsp;号</span>
						<input class="inpu" id="systemNo" name="systemNo" placeholder="系统号" />
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">主&nbsp;&nbsp;单&nbsp;&nbsp;号</span>
						<input class="inpu" id="mawbNo" name="mawbNo" placeholder="主单号" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
				</div>
				<div class="line">
					<div  class="tit-mess" style="display: inline-block;">
						<span class="mess">分&nbsp;&nbsp;单&nbsp;&nbsp;号</span>
						<input class="inpu" id="hawbNo" name="hawbNo" placeholder="分单号" />
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">航&nbsp;&nbsp;班&nbsp;&nbsp;号</span>
						<input  class="inpu" id="flightNo" name="flightNo" placeholder="航班号" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
				</div>
				<div class="line">
					<div class="tit-mess" style="display: inline-block;">
						<span class="mess">航班日期</span>
						<input  class="inpu" id="departDate" name="departDate" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" />
					</div>				
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">到港日期</span>
						<input  class="inpu" id="arriveDate" name="arriveDate" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
				</div>
				<div class="line">
					<div class="tit-mess" style="display: inline-block;">
						<span class="mess">目&nbsp;&nbsp;的&nbsp;&nbsp;港</span>
						<input  class="inpu" id="destination" name="destination" placeholder="目的港" />
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">货物件数</span>
						<input  class="inpu" id="cargoPieces" name="cargoPieces" placeholder="货物件数" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
				</div>
				<div class="line">
					<div class="tit-mess" style="display: inline-block;">
						<span class="mess">货物重量</span>
						<input class="inpu" id="cargoWeight" name="cargoWeight" placeholder="货物重量" />
					</div>	
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">计费重量</span>
						<input class="inpu" id="chargeWeight" name="chargeWeight" placeholder="计费重量" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
				</div>
				<div class="line">
					<div class="tit-mess" style="display: inline-block;">
						<span class="mess">货物体积</span>
						<input  class="inpu" id="cargoVolume" name="cargoVolume" placeholder="货物体积" />
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">报关单状态</span>
						<select  class="inpu" id="customsStatus" name="customsStatus" style="display: inline-block; position: absolute; left: 854px;top: 23px;">
							<c:forEach var="customsStatus" items="${customsStatusList }">
								<option value="${customsStatus.id }">${customsStatus.description }</option>
							</c:forEach>
						</select><span style="margin-left: 10px;display: inline-block;position: absolute;left: 1095px;top: 30px;">*</span>
				</div>
				<div class="line">
					<div  class="tit-mess" style="display: inline-block;">
						<span class="mess">订单状态</span>
						<select  class="inpu" id="orderStatus" name="orderStatus">
							<c:forEach var="status" items="${statusList }">
								<option value="${status.statusId }">${status.statusDescription }</option>
							</c:forEach>
						</select><span style="margin-left: 10px;">*</span>
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">报关单号</span>
						<input class="inpu" id="customsNo" name="customsNo" placeholder="报关单号" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
				</div>
				<div class="line" style="height: 80px;">
					<div  class="tit-mess" style="display: inline-block;">
						<span class="mess">贸易条款</span>
						<select  class="inpu" id="terms" name="terms">
							<c:forEach var="terms" items="${termsList }">
								<option value="${terms.id }">${terms.code }</option>
							</c:forEach>
						</select>
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">备注内容</span>
						<textarea class="remarks" id="remarks" name="remarks" style=" height:30px;"></textarea>
				</div>
				<div  class="tit-mess"style="position: relative; left: 230px;top: 20px;">
					<input id="addSub" class="mess" type="button" value="确认添加" />
					<input id="addRes" class="mess" type="reset" value="重新填写" />
				</div>
			</form>
			</div>
			

		<script type="text/javascript">
			
			$("#clientName").keyup(function(){
				$(".findClient").empty();
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
								$(".findClient").append(holder);
							}
						}
					});
				}
			});
			$(".findClient").on("click",".holder",function(){
				var name = $(this).text();
				$("#clientName").val(name);
				$(".findClient").empty();
			});
			$("#clientName").blur(function(){
				setTimeout(function(){
					$(".findClient").empty();
				},150);
			});
			$("#addRes").click(function() {
				$(".tip").text("");
				$("#client").focus();
			});
			$("#addSub").click(function() {
				$(".tip").text("");
				$(".rightTip").text("");
				var clientName = $("#clientName").val();
				var orderNo = $("#orderNo").val();
				if(clientName==""||clientName==null){
					$("#clientTip").text("请输入客户抬头");
					$("#clientName").focus();
				}else{
					$.ajax({
						"url":"client.do",
						"type":"post",
						"data":"mn=checkClient&clientName="+clientName,
						"success":function(res){
							if(res==0){
								$("#clientTip").text("不存在此公司，请先添加");
							}else{
								var userId = ${user.userId };
								$("#clientTip").text("");
								$("#clientId").val(res);
								var content = $("#frm").serialize();
								$.ajax({
									"url":"order.do",
									"type":"post",
									"data":"mn=addOrder&userId="+userId+"&"+content,
									"success":function(res){
										if(res==1){
											$(".homeTip").text("添加成功！");
											$(".homeTip").show(200);
											$("#home").load("order.do","mn=showOrders");
											setTimeout(function(){
												$(".homeTip").fadeOut(1000);
											},1000);
										}else if(res==0){
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
	</body>