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
            <input type="hidden" value="supplier" class="searchPage" />
        <table   border="1"  id="clientUpdate"  >
            	<tr id="" class="tit-mess3">
            		<td class="mess1"  style="width:150px;">公司抬头</td>
            		<td class="mess1"  style="width:160px;" >公司地址</td>
            		<td class="mess1" style="width:120px;">联系人</td>
            		<td class="mess1" style="width:120px;">添加</td>
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
											<a class="ccOperation modifyCC" modName="${contact.supplierContactName }" tel="${contact.supplierContactTel }"  email="${contact.supplierContactEmail }" qq="${contact.supplierContactQQ }">修改</a>
											<a class="ccOperation delCC" supplierId="${supplier.supplierId }" contactId="${contact.supplierContactId }">删除</a>
										</p>
									</div>
								</div>
	            			</c:forEach>
	            		</td>
	            		<td class="mess2"><a class="addCC" modifyId="${supplier.supplierId }" supplierName="${supplier.supplierName }">添加联系人</a></td>
	            		<td class="mess2"><a class="updateSupplier" modifyId="${supplier.supplierId }">修改</a>&nbsp;&nbsp;<a class="delSupplier" modifyId="${supplier.supplierId }">删除</a></td>
            		</tr> 
            	</c:forEach>
            	
            	
            	
            
            	
            	<tr id="last" style="height:50px;">
            		<td  colspan="5"><a id="firstPage">首页</a><a id="prePage">上一页</a><a id="nextPage">下一页</a><a id="lastPage">末页</a></td>
            		
            	</tr> 
        </table>  
	<script type="text/javascript">
	//删除联系人
		$("#clientUpdate").on("click",".delCC",function(){
			var supplierId = $(this).attr("supplierId");
			var contactId = $(this).attr("contactId");
			var thisEle = $(this);
			if(confirm("确认删除？")){
				$.ajax({
					type:"post",
					url:"supplier.do",
					data:"mn=delContact&supplierId="+supplierId+"&contactId="+contactId,
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
		var modeName;
		$("#clientUpdate").on("click",".modifyCC",function(){
			if($("#clientUpdate").find("input").length>1){
				$(".homeTip").text("正在修改`"+modeName+"`");
				$(".homeTip").show(200);
				setTimeout(function(){
					$(".homeTip").fadeOut(1500);
				},1000);
			}else{
				modeName = $(this).attr("modName");
				var messdiv = $(this).parents(".messdiv");
				var oldContent = messdiv.children();
				var tel = $(this).attr("tel");
				var email = $(this).attr("email");
				var qq = $(this).attr("qq");
				var newContent = $('<p>电话：<input value='+tel+'></p><p>邮箱：<input class="email" value='+email+'></p><p>Q Q：<input value='+qq+'></p><p><a class="ccOperation saveCC"}">保存</a><a class="ccOperation giveUp">取消</a></p><div class="emailTip"></div>');
				messdiv.empty();
				messdiv.append(newContent);
				$(".messdiv").on("click",".giveUp",function(){
					messdiv.empty();
					messdiv.append(oldContent);
				});
			}
		
		});
		//保存联系人修改
		$("#clientUpdate").on("click",".saveCC",function(){
			var parent = $(this).parents(".ccName");
			var contactId = parent.find(".nameContent").attr("contactId");
			var tel = parent.find("input").eq(0).val();
			var email = parent.find("input").eq(1).val();
			var qq = parent.find("input").eq(2).val();
			
			var reg=new RegExp("^\\w+@\\w+(\\.[a-zA-Z]{2,3}){1,2}$")
			if(email!==""&&email!=null&&!reg.test(email)){
				$(".emailTip").text("邮箱格式不正确");
				$(".emailTip").fadeIn(200);
				$(".email").focus();
				setTimeout(function(){
					$(".emailTip").fadeOut(2000);
				},1000);
			}else{
				$.ajax({
					type:"post",
					url:"supplier.do",
					data:"mn=updateContact&contactId="+contactId+"&tel="+tel+"&email="+email+"&qq="+qq,
					success:function(res){
						if(res==1){
							var currentPage = ${currentPage };
							$("#home").load("supplier.do?mn=showSupplier&currentPage="+currentPage);
						}else{
							alert("修改失败");
						}
					}
				});
			}
			
		});
		//增加联系人
		$("#clientUpdate").on("click",".addCC",function(){
			var currentPage = ${currentPage };
			var supplierId = $(this).attr("modifyId");
			var supplierName =$(this).attr("supplierName");
			$("#home").load("admin/addSupplierContact.jsp?supplierId="+supplierId+"&currentPage="+currentPage+"&supplierName="+supplierName);
		});
		//修改供应商信息
		$("#clientUpdate").on("click",".updateSupplier",function(){
			var currentPage = ${currentPage };
			var supplierId = $(this).attr("modifyId");
			$("#home").load("supplier.do?mn=goUpdateSullier&currentPage="+currentPage+"&supplierId="+supplierId);
		});
		//删除供应商
		$("#clientUpdate").on("click",".delSupplier",function(){
			if(confirm("确认删除？")){
				var currentPage = ${currentPage };
				var supplierId = $(this).attr("modifyId");
				$.ajax({
					url:"supplier.do",
					type:"post",
					data:"mn=delSupplier&supplierId="+supplierId,
					success:function(res){
						if(res==1){
							$(".homeTip").text("删除成功！");
							$(".homeTip").show(200);
							$("#home").load("supplier.do?mn=showSupplier&currentPage="+currentPage);
							setTimeout(function(){
								$(".homeTip").fadeOut(1500);
							},1500);
						}else{
							alert("删除失败");
						}
					}
				});
			}
		});
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
				$("#home").load("supplier.do","mn=searchSupplier&currentPage=1&serchContent="+serchContent);
			}else{
				$("#home").load("supplier.do?mn=showSupplier&currentPage=1");
			}
			
		});
		$("#clientUpdate").on("click","#lastPage",function(){
			var totalPage = ${totalPage };
			var serchContent = "${param.serchContent }";
			if(serchContent!=null&&serchContent!=""){
				$("#home").load("supplier.do","mn=searchSupplier&currentPage="+totalPage+"&serchContent="+serchContent);
			}else{
				$("#home").load("supplier.do?mn=showSupplier&currentPage="+totalPage);
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
					$("#home").load("supplier.do","mn=searchSupplier&currentPage="+currentPage+"&serchContent="+serchContent);
				}else{
					$("#home").load("supplier.do?mn=showSupplier&currentPage="+currentPage);
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
					$("#home").load("supplier.do","mn=searchSupplier&currentPage="+currentPage+"&serchContent="+serchContent);
				}else{
					$("#home").load("supplier.do?mn=showSupplier&currentPage="+currentPage);
				}
				
			}

		})
	</script>
	</body>