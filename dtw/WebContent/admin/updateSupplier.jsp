<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
		 <!-- 修改供应商信息 -->
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
            		<td class="mess1"  style="width:150px;">供应商公司抬头</td>
            		<td class="mess1"  style="width:160px;" >供应商公司地址</td>
            		<td class="mess1" style="width:120px;">联系人</td>
            		<td class="mess1" style="width:120px;">添加联系人</td>
            		<td class="mess1" style="width:120px;">操作栏</td>
            	</tr> 
            	<c:forEach var="supplier" items="${supplierList }">
            		<tr  class="tit-mess3">
	            		<td class="mess2">${supplier.supplierName }</td>
	            		<td class="mess2">${supplier.supplierAddress }</td>
	            		<td class="mess2">
	            			<c:forEach var="contact" items="${supplier.supplierContacts }">
	            				<div class="ccName"><a class="nameContent">${contact.supplierContactName }</a>
		            				<div class="messdiv">
										<p>电话：${contact.supplierContactTel }</p>
										<p>邮箱：${contact.supplierContactEmail }</p>
										<p>Q Q：${contact.supplierContactQQ }</p>
										<p>
											<a class="ccOperation modifyCC">修改</a>
											<a class="ccOperation delCC" supplierId="${supplier.supplierId }" contactId="${contact.supplierContactId }">删除</a>
										</p>
									</div>
								</div>
	            			</c:forEach>
	            		</td>
	            		<td class="mess2"><a class="addCC" modifyId="ls">增加</a></td>
	            		<td class="mess2"><a class="updateSupplier" modifyId="ls">修改</a>&nbsp;&nbsp;<a href="">删除</a></td>
            		</tr> 
            	</c:forEach>
            	
            	
            	
            
            	
            	<tr id="last" style="height:50px;">
            		<td  colspan="5"><a id="firstPage">首页</a><a id="prePage">上一页</a><a id="nextPage">下一页</a><a id="lastPage">末页</a></td>
            		
            	</tr> 
        </table>  
	<script type="text/javascript">
		$("#clientUpdate").on("click",".delCC",function(){
			var supplierId = $(this).attr("supplierId");
			var contactId = $(this).attr("contactId");
			var thisEle = $(this);
			if(confirm("确认删除？")){
				$.ajax({
					type:"post",
					url:"delSupplierContact",
					data:"supplierId="+supplierId+"&contactId="+contactId,
					success:function(res){
						if(res==1){
							thisEle.parents(".ccName").remove();
						}else{
							alert("删除失败");
						}
					}
				})
			}
		});
		$("#clientUpdate").on("click",".updateSupplier",function(){
			$("#home").load("/dtw/admin/updateSupplierAddress.jsp");
		});
		$("#clientUpdate").on("mouseover",".ccName",function(){
			$(this).find(".messdiv").show();
			$(this).find(".nameContent").css("color","yellow");
		});
		$("#clientUpdate").on("mouseout",".ccName",function(){
			$(this).find(".messdiv").hide();
			$(this).find(".nameContent").css("color","white");
		});
		$("#firstPage").click(function(){
			$("#home").load("showSupplier?currentPage=1");
		})
		$("#lastPage").click(function(){
			var totalPage = ${totalPage };
			$("#home").load("showSupplier?currentPage="+totalPage);
		})
		$("#prePage").click(function(){
			var currentPage = ${currentPage }-1;
			$("#home").load("showSupplier?currentPage="+currentPage);
		})
		$("#nextPage").click(function(){
			var currentPage = ${currentPage }+1;
			$("#home").load("showSupplier?currentPage="+currentPage);
		})
	</script>
	</body>