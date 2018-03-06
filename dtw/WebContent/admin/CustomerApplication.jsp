<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.messdiv input{
		background-color:rgba(0,0,0,0.7);
		display:inline-block;
		border:none;
	}
</style>
<body>
		 <!-- 供应商管理 -->
                <div class="tit">
                    <div class="col-md-3 col-xs-6" >
                        <div class="tile quick-stats">
                            <h3 style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">散客管理</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
                <input type="hidden" value="customerApplication" class="searchPage" />
            <!-- 表单内容 -->
        <table   border="1" id="clientUpdate" style="width: 700px;"  >
            	<tr id="" class="tit-mess3">
            		<td class="mess1">账号</td>
            		<td class="mess1">申请公司</td>
            		<td class="mess1">申请地址</td>
            		<td class="mess1" style="width:115px;">公司存在</td>
            		<td class="mess1" style="width:150px;">审核状态</td>
            	</tr> 
            	<c:forEach var="customer" items="${customerList }">
            		<tr  class="tit-mess3">
	            		<td class="mess2">
	            				<div class="ccName"><a class="nameContent"  >${customer.loginName }</a>
		            				<div class="messdiv">
		            					<p>姓名：${customer.realName }</p>
										<p>电话：${customer.tel }</p>
										<p>邮箱：${customer.email }</p>
									</div>
								</div>
	            		</td>
	            		<td class="mess2">${customer.clientTemp.clientName }</td>
	            		<td class="mess2">${customer.clientTemp.clientAddress}</td>
	            		
	            		<td class="mess2">
	           	 			<c:if test="${customer.statusId!=2}">
	            				<c:if test="${customer.clientExists==0}">
	            					否
	            				</c:if>
	            				<c:if test="${customer.clientExists==1}">
	            					是
	            				</c:if>
	            			</c:if>
	            		</td>
	            		<td class="mess2">
	            			<c:if test="${customer.statusId==2}">
	            				<a class="noApp">未申请</a>
	            			</c:if>
	            			<c:if test="${customer.statusId==1}">
	            				<a class="pass" clientExists="${customer.clientExists}" tempClientId="${customer.clientTemp.clientId }" clientName="${customer.clientTemp.clientName }" clientAddress="${customer.clientTemp.clientAddress}" customerId="${customer.id }">同意&nbsp;&nbsp;</a>/
	            				<a class="refuse" customerId="${customer.id }">&nbsp;不同意</a> 
	            			</c:if>
	            			<c:if test="${customer.statusId==3}">
	            				审核通过
	            			</c:if>
	            			<c:if test="${customer.statusId==4}">
	            			审核未通过
	            			</c:if>
	            		</td>
            		</tr> 
            	</c:forEach>
	            	
            	<tr id="last" style="height:50px;">
            		<td  colspan="5"><a id="firstPage">首页</a><a id="prePage">上一页</a><a id="nextPage">下一页</a><a id="lastPage">末页</a></td>
            		
            	</tr> 
        </table>  
	<script type="text/javascript">
		//控制显示联系人信息
		$("#clientUpdate").on("mouseover",".ccName",function(){
			$(this).find(".messdiv").show();
			$(this).find(".nameContent").css("color","yellow");
		});
		$("#clientUpdate").on("mouseout",".ccName",function(){
			$(this).find(".messdiv").hide();
			$(this).find(".nameContent").css("color","white");
		});
		//分页
		$("#clientUpdate").on("click","#firstPage",function(){
			var serchContent = "${param.serchContent }";
			if(serchContent!=null&&serchContent!=""){
				$("#home").load("customer.do","mn=searchCustomerApplication&currentPage=1&serchContent="+serchContent);
			}else{
				$("#home").load("customer.do?mn=showCustomerApplication&currentPage=1");
			}
			
		});
		$("#clientUpdate").on("click","#lastPage",function(){
			var totalPage = ${totalPage };
			var serchContent = "${param.serchContent }";
			if(serchContent!=null&&serchContent!=""){
				$("#home").load("customer.do","mn=searchCustomerApplication&currentPage="+totalPage+"&serchContent="+serchContent);
			}else{
				$("#home").load("customer.do?mn=showCustomerApplication&currentPage="+totalPage);
			}
		});
		$("#clientUpdate").on("click","#prePage",function(){
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
					$("#home").load("customer.do","mn=searchCustomerApplication&currentPage="+currentPage+"&serchContent="+serchContent);
				}else{
					$("#home").load("customer.do?mn=showCustomerApplication&currentPage="+currentPage);
				}
			}
		});
		$("#clientUpdate").on("click","#nextPage",function(){
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
					$("#home").load("customer.do","mn=searchCustomerApplication&currentPage="+currentPage+"&serchContent="+serchContent);
				}else{
					$("#home").load("customer.do?mn=showCustomerApplication&currentPage="+currentPage);
				}
			}

		});
		//审核通过
		$("#clientUpdate").on("click",".pass",function(){
			var currentPage = ${currentPage };
			var clientName = $(this).attr("clientName");
			var clientAddress = $(this).attr("clientAddress");
			var tempClientId = $(this).attr("tempClientId");
			var clientExists = $(this).attr("clientExists");
			var customerId = $(this).attr("customerId");
			if(clientExists==0){
				if(confirm("申请绑定的公司不存在，是否添加？")){
					$("#home").load("/dtw/admin/addClient.jsp?currentPage="+currentPage+"&clientName="+clientName+"&clientAddress="+clientAddress+"&tempClientId="+tempClientId);
				}
			}else if(clientExists==1){
				if(confirm("确认通过本次绑定？")){
					$.ajax({
						"url":"customer.do",
						"type":"post",
						"data":"mn=passBindingCompany&customerId="+customerId+"&clientName="+clientName,
						"success":function(res){
							if(res==1){
								$(".homeTip").text("修改成功，审核已通过");
								$(".homeTip").show(200);
								$("#home").load("customer.do?mn=showCustomerApplication&currentPage="+currentPage);
								setTimeout(function(){
									$(".homeTip").fadeOut(1000);
								},1000);
							}else{
								alert("修改失败");
							}
						}
					});
				}
				
			}
			
		});
		//审核不通过
		$("#clientUpdate").on("click",".refuse",function(){
			var currentPage = ${currentPage };
			
			var customerId = $(this).attr("customerId");
			if(confirm("确认不同意本次绑定申请？")){
				$.ajax({
					"url":"customer.do",
					"type":"post",
					"data":"mn=refuseBindingCompany&customerId="+customerId,
					"success":function(res){
						if(res==1){
							$(".homeTip").text("操作成功");
							$(".homeTip").show(200);
							$("#home").load("customer.do?mn=showCustomerApplication&currentPage="+currentPage);
							setTimeout(function(){
								$(".homeTip").fadeOut(1000);
							},1000);
						}else{
							alert("修改失败");
						}
					}
				});
			}
		});
	</script>
	</body>