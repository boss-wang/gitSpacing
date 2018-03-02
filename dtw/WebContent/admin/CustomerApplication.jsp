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
                            <h3 style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">供应商管理</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
            <!-- 表单内容 -->
        <table   border="1"  id="clientUpdate"  >
            	<tr id="" class="tit-mess3">
            		<td class="mess1"  style="width:150px;">联系人</td>
            		<td class="mess1"  style="width:160px;" >公司名</td>
            		<td class="mess1" style="width:120px;">公司地址</td>
            		<td class="mess1" style="width:120px;">操作栏</td>
            	</tr> 
            	<c:forEach var="supplier" items="${supplierList }">
            		<tr  class="tit-mess3">
	            		<td class="mess2">
	            			<c:forEach var="contact" items="${supplier.supplierContacts }">
	            				<div class="ccName"><a class="nameContent" contactId="${contact.supplierContactId }" >${contact.supplierContactName }</a>
		            				<div class="messdiv">
										<p>电话：${contact.supplierContactTel }</p>
										<p>邮箱：${contact.supplierContactEmail }</p>
										<p>Q Q：${contact.supplierContactQQ }</p>
										<p>
											<a class="ccOperation modifyCC" modName="${contact.supplierContactName }" tel="${contact.supplierContactTel }"  email="${contact.supplierContactEmail }" qq="${contact.supplierContactQQ }">修改</a>
											<a class="ccOperation delCC" supplierId="${supplier.supplierId }" contactId="${contact.supplierContactId }">删除</a>
										</p>
									</div>
								</div>
	            			</c:forEach>
	            		</td>
	            		<td class="mess2">${client.clientName }</td>
	            		<td class="mess2">${client.clientAddress}</td>
	            		
	            		<td class="mess2"><a class="addCC" modifyId="${supplier.supplierId }" supplierName="${supplier.supplierName }">增加</a></td>
	            		<td class="mess2"><a class="updateSupplier" modifyId="${supplier.supplierId }">修改</a>&nbsp;&nbsp;<a class="delSupplier" modifyId="${supplier.supplierId }">删除</a></td>
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
		$("#firstPage").click(function(){
			$("#home").load("supplier.do?mn=showSupplier&currentPage=1");
		})
		$("#lastPage").click(function(){
			var totalPage = ${totalPage };
			$("#home").load("supplier.do?mn=showSupplier&currentPage="+totalPage);
		})
		$("#prePage").click(function(){
			var currentPage = ${currentPage }-1;
			if(currentPage==0){
				$(".homeTip").text("已经是第一页了");
				$(".homeTip").show(200);
				setTimeout(function(){
					$(".homeTip").fadeOut(1000);
				},1000);
			}else{
				$("#home").load("supplier.do?mn=showSupplier&currentPage="+currentPage);
			}
		})
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
				$("#home").load("supplier.do?mn=showSupplier&currentPage="+currentPage);
			}

		})
	</script>
	</body>