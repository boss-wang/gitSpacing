<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<html>

<style>
 		span{
 		color:red;
 		}
</style>
	<body>
		<a name="abstract"></a>
		<div class="index-about">
			<div class="container">
				<div class="index-title">
					<a  title="公司简介">请绑定公司</a>
				</div>
				<div class="cont">
					<form action="" method="post">
						<div id="" style="height: 30px;margin-left:393px;">
							<h3 style="display: inline-block;color: #555555;">公司名称:</h3>
							<input style="width:300px;height: 24px; margin-left: 5px;" id="clientName" placeholder="请输入公司名称" />
							<span></span>
						</div>
						<div id="" style="height: 120px;margin-left:393px;margin-top: 10px;">
							<h3 style="display: inline-block;color: #555555;position: absolute;">公司地址:</h3>
							<!--<input style="width:300px;height: 24px; margin-left: 5px;" placeholder="请输入公司地址" />-->
							<textarea name="" rows="" cols="" style="width:300px;height: 100px; margin-left: 90.2px;" id="clientAddress" placeholder="请输入公司地址"></textarea>
							<span></span>
						</div>
						<div id="" style="height: 30px;margin-left:482px;margin-top: 10px;">
							<input type="button" name="" id="sub" value="确认绑定" style="height:30px;width: 100px;border: 1px solid orangered;background-color: orangered;color: white;" />
							<input type="reset" name="" id="" value="重新填写" style="height:30px;width: 100px;border: 1px solid orangered;background-color: orangered;color: white;margin-left: 102px;" />
						</div>

					</form>
				</div>
				<!--cont end-->
			</div>
			<!--container end-->
		</div>
		
	<script>
		$("#sub").click(function(){
		var	$clientName=$("#clientName").val();
		var $clientAddress=$("#clientAddress").val();
		
			if(	$clientName==''){
				if($clientAddress!=''){
					$("#clientAddress").next().text("");
				}
				$("#clientName").next().text("公司名不能为空");
			}else if($clientAddress==''){
				if($clientName!=''){
					$("#clientName").next().text("");
				}
				$("#clientAddress").next().text("公司地址不能为空");
			}else if($clientAddress!=''&&$clientName!=''){
				$("span").text('');
				var customerId=${customer.id};
				$.ajax({
					url:"custorder.do?mn=bindingCompany",
					data:"clientName="+$clientName+"&clientAddress="+$clientAddress+"&customerId="+customerId,
					type:"post",
					success:function(res){
						if(res==1){
							alert("绑定成功，等待审核通过");
							
							window.location.href="<%=basePath%>index.jsp";
						}
					}
				})
			}
		})
	</script>

	</body>

</html>