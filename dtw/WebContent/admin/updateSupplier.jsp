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
	            				<div class="ccName"><a class="nameContent" contactId="${contact.supplierContactId }" >${contact.supplierContactName }</a>
		            				<div class="messdiv">
										<p>电话：${contact.supplierContactTel }</p>
										<p>邮箱：${contact.supplierContactEmail }</p>
										<p>Q Q：${contact.supplierContactQQ }</p>
										<p>
											<a class="ccOperation modifyCC" tel="${contact.supplierContactTel }" email="${contact.supplierContactEmail }" qq="${contact.supplierContactQQ }">修改</a>
											<a class="ccOperation delCC" supplierId="${supplier.supplierId }" contactId="${contact.supplierContactId }">删除</a>
										</p>
									</div>
								</div>
	            			</c:forEach>
	            		</td>
	            		<td class="mess2"><a class="addCC" modifyId="${supplier.supplierId }" supplierName="${supplier.supplierName }">增加</a></td>
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
				});
			}
		});
		//修改联系人
		$("#clientUpdate").on("click",".modifyCC",function(){
			var messdiv = $(this).parents(".messdiv");
			var oldContent = messdiv.children();
			var tel = $(this).attr("tel");
			var email = $(this).attr("email");
			var qq = $(this).attr("qq");
			var newContent = $('<p>电话：<input value='+tel+'></p><p>邮箱：<input value='+email+'></p><p>Q Q：<input value='+qq+'></p><p><a class="ccOperation saveCC"}">保存</a><a class="ccOperation giveUp">取消</a></p>')
			messdiv.empty();
			messdiv.append(newContent);
			$(".giveUp").click(function(){
				messdiv.empty();
				messdiv.append(oldContent);
			})
		});
		//保存联系人修改
		$("#clientUpdate").on("click",".saveCC",function(){
			var parent = $(this).parents(".ccName");
			var contactId = parent.find(".nameContent").attr("contactId");
			var tel = parent.find("input").eq(0).val();
			var email = parent.find("input").eq(1).val();
			var qq = parent.find("input").eq(2).val();
			$.ajax({
				type:"post",
				url:"modifySupplierContact",
				data:"contactId="+contactId+"&tel="+tel+"&email="+email+"&qq="+qq,
				success:function(res){
					if(res==1){
						
					}else{
						alert("修改失败");
					}
				}
			});
		});
		
		$("#clientUpdate").on("click",".addCC",function(){
			var currentPage = ${currentPage };
			var contactId = $(this).attr("contactId");
			var supplierName =$(this).attr("supplierName");
			$("#home").load("modifySupplierContact?supplierName="+supplierName+"&contactId="+contactId+"&currentPage="+currentPage);
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