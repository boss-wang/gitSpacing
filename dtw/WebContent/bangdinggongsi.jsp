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
 			.findClient{	
				        position: absolute;
					    z-index: 10;
					    top: 147px;
					    left: 482px;
					    border: 1px solid rebeccapurple;
					}
					.holder{
						display: block;
						margin: 0px;
						text-indent: 10px;
						height: 30px;
						 width: 302px;
						line-height: 30px;
						background-color:white ;
			}
			.holder:hover{
				text-decoration:none;
				background:silver;
				color:black;
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
						<div  style="height: 30px;margin-left:393px;margin-bottom: 10px;">
							<h3 style="display: inline-block;color: #555555;">真实姓名:</h3>
							<input style="width:300px;height: 24px; margin-left: 5px;" id="customerName" placeholder="请输入真实姓名" />
							<span></span>
						</div>
						<div  style="height: 30px;margin-left:393px;">
							<h3 style="display: inline-block;color: #555555;">公司名称:</h3>
							<input style="width:300px;height: 24px; margin-left: 5px;" id="clientName" placeholder="请输入公司名称" />
							<div class="findClient"></div>
							<span></span>
						</div>
						<div  style="height: 120px;margin-left:393px;margin-top: 10px;">
							<h3 style="display: inline-block;color: #555555;position: absolute;">公司地址:</h3>
							<!--<input style="width:300px;height: 24px; margin-left: 5px;" placeholder="请输入公司地址" />-->
							<textarea name="" rows="" cols="" style="width:299px;height: 100px; margin-left: 89.2px;" id="clientAddress" placeholder="请输入公司地址"></textarea>
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
								$(".findClient").show();
								var holder = $('<a class="holder" address="'+clientJson[i].clientAddress+'" >'+clientJson[i].clientName+'</a>');
								$(".findClient").append(holder);
							}
						}
					});
				}
			});
		$(document).click(function(){
		    $(".findClient").hide();
		});
		$(".findClient").click(function(event){
		    event.stopPropagation();
		});
		$(".findClient").on("click",".holder",function(){
			var name = $(this).text();
			var address =$(this).attr("address");
			$("#clientName").val(name);
			$("#clientAddress").val(address);
			$(".findClient").empty();
		});
	</script>

	</body>

</html>