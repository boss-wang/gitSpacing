<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<link rel="stylesheet" href="css/register.css">
<style>
#updatephone{
	position: absolute;
    display: none;
    top: 721px;
    z-index: 100;
    background-color: white;
    left: 486px;
}
.update {
	    background: url(img/edit.png) no-repeat 8px;
    background-color: white;
    font-size: 12px;
    color: #3a6691;
    padding-left: 27px;

}
.update a{
 color: #3a6691;
}

.inpu {
	background: rgba(0, 0, 0, 0.2);
	margin-left: 0px;
	text-indent: 10px;
	height: 30px;
	width: 240px;
	border: 1px solid rgba(0, 0, 0, 0.35);
}
table{
    margin: -20px auto;
    position: relative;
    left: 40px;
    border-spacing: 14px;
	
}
table tr td {
 padding:10px;
 border-spacing: 10px;
}
table tr {
		margin:10px;
				background:rgba(0,0,0,0.1);
				border-spacing: 10px;
			}
</style>
<body>
			<a name="abstract"></a>
			<div class="index-title">
				<a >本人信息</a>
			</div>
			<table >
			
			<tr>
				<th>手机号：</th>
				<td class="thiscon" >${customer.tel}</td>
				<td attrname="phone" class="update"><a class="up" >点击修改</a></td>
			</tr>
			<tr>
				<th>邮箱：</th>
				<td class="thiscon"><c:if test="${customer.email==null}">尚未填写</c:if><c:if test="${customer.email!=null}">${customer.email}</c:if></td>
				<td attrname="email" class="update"><a class="up" >点击修改</a></td>
			</tr>
			<tr>
				<th>公司：</th>
				<td ><c:if test="${customer.statusId==2}">未绑定公司</c:if><c:if test="${customer.statusId==1}">审核中</c:if><c:if test="${customer.statusId==3}">${clienttemp.clientName }</c:if><c:if test="${customer.statusId==4}">审核未通过</c:if></td>
				<td  class="update"><c:if test="${customer.statusId==2}"><a id="binding">绑定</a></c:if><c:if test="${customer.statusId==1}">无法修改</c:if><c:if test="${customer.statusId==3}"><a id="undinding">解绑</a></c:if><c:if test="${customer.statusId==4}"><a id="rebind">重新绑定</a></c:if></td>
			</tr>
				
					</table>
			<div id="updatephone">
			<form action="">
				<div class="item-phone-wrap">
					<div class="form-item form-item-phone" style="left:0px;">
						<label class="select-country" id="select-country"
							>手机号</label> 
							<input id="form-phone" name="phone" class="field" required="required" placeholder="建议使用常用手机" autocomplete="off" maxlength="11" type="text">
							 <img class="i-status" src="img/right.png">
						<div class="input-tip">
							<span></span>
						</div>
					</div>

				</div>


				<div class="form-item form-item-phonecode" style="left:0px;">
					<label>手机验证码</label> <input name="mobileCode" maxlength="6"
						id="phoneCode" required="required" class="field phonecode"
						placeholder="请输入手机验证码" type="text">
					<button id="getPhoneCode" class="btn-phonecode" type="button">获取验证码</button>

				</div>

				<div>
					<button type="submit"  id="sub" class="btn-register" style="left:24px;width: 139px;">保存</button>
					<button type="button" id="back" class="btn-register"  style="left:84px;width: 139px;">取消</button>
				</div>
				</form>
			</div>
</body>
<script>
		//修改
	$("table").on("click",".up",function(){
		var	content=$(this).parents(".update").prev().text();
		var attrname=$(this).parent(".update").attr("attrname");
		
		if(attrname=='phone'){
			$("#updatephone").show();
		}else{
			$(this).parent('.update').prev().html("<input type='text'/>");
		 $(this).parent('.update').html('<a class="save">保存</a>&nbsp;&nbsp;&nbsp;<a class="resert">取消</a>');
		
		 $(".resert").click(function(){
			 $(this).parent('.update').prev().html(content);
			 $(this).parent('.update').html('<a class="up">点击修改</a>');
		 })
		}
	})
	//保存
	$("table").on("click",".save",function(){
			 var attrname=$(this).parent(".update").attr("attrname");
			var content=$(this).parent(".update").prev().find("input").val();
		
			
			if(attrname=='email'){
				$.ajax({
					url:"customer.do?mn=updateEmail",
					data:"phoneNumber=${customer.tel}&email="+content,
					type:"post",
					success:function(res){
						$.ajax({
							url:"custlogin.do?mn=customerlogin",
							data:"loginName="+'${customer.loginName}'+"&paswd="+'${customer.loginPwd}',
							type:"post",
							success:function(res){
								$("#personCenter").click();
							}
						});
						
					}
				});
				
			}

		 })
		//解除绑定 
	$("#binding").click(function(){
		$("#homeDiv").load("bangdinggongsi.jsp");
	})	 
	$("#rebind").click(function(){
		$("#homeDiv").load("bangdinggongsi.jsp");
	})	 
	$("#undinding").click(function(){
		$.ajax({
			url:"customer.do?mn=unbinding",
			data:"customerId=${customer.id}&clientId=${clienttemp.clientId}",
			type:"post",
			success:function(res){
				if(res==1){
					$.ajax({
						url:"custlogin.do?mn=customerlogin",
						data:"loginName="+'${customer.loginName}'+"&paswd="+'${customer.loginPwd}',
						type:"post",
						success:function(res){
							alert("解绑成功");
							window.location.reload();
						}
					});
				}else{
					alert("解绑失败");
				}
			}
		})
	})	 
		 
		 //手机验证
		  $("#back").click(function(){
			  $("#form-phone").val('');
			  $("#phoneCode").val('');
			  $("#form-phone").siblings(".input-tip").text("");
			 $("#updatephone").hide();
		 });
		 var isright4=false;
	function checkTel(){
		var value=$("#form-phone").val();

		var reg=/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
	if(!reg.test(value)){
		$("#form-phone").siblings(".i-status").hide();
		$("#form-phone").siblings(".input-tip").text("手机号格式错误");
		isright4=false;
	}else{
		$.ajax({
			url:"custlogin.do?mn=isrepeat",
			data:"tel="+value,
			type:"post",
			success:function(res){
				if(res==1){
					$("#form-phone").siblings(".input-tip").text("");
					$("#form-phone").siblings(".i-status").show();
					isright4=true;
				}else{
					$("#form-phone").siblings(".i-status").hide();
					$("#form-phone").siblings(".input-tip").text("手机号已存在");
					isright4=false;
				}
			}
		});
	}
	}
	$("#form-phone").blur(checkTel);
		
	$("#getPhoneCode").click(function(){
		var value=$("#form-phone").val();
		var reg=/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
	if(!reg.test(value)){
		$("#form-phone").siblings(".i-status").hide();
		$("#form-phone").siblings(".input-tip").text("手机号格式错误");
		isright4=false;
	}else{
		$.ajax({
			url:"custlogin.do?mn=isrepeat",
			data:"tel="+value,
			type:"post",
			success:function(res){
				if(res==1){
					$("#form-phone").siblings(".input-tip").text("");
					$("#form-phone").siblings(".i-status").show();
					isright4=true;
				}else{
					$("#form-phone").siblings(".i-status").hide();
					$("#form-phone").siblings(".input-tip").text("手机号已存在");
					isright4=false;
				}
			}
		});
	}
	if(isright4==true){
		$("#getPhoneCode").attr("disabled","disabled");
		$.ajax({
			url:"custlogin.do?mn=sendMessage",
			data:"phoneNumber="+$("#form-phone").val(),
			type:"post",
			success:function(res){
				m = 60;
				flag=setInterval(getdate,1000);
				setTimeout(removeSession,60*1000);
			}
		})
		
		}
	})
	
	function removeSession(){
				$.ajax({
				url:"custlogin.do?mn=deleCode",
				data:"",
				type:"post"
				});
			}
	function getdate() {
		m--;
		$("#getPhoneCode").text("已发送("+m+")");
		if(m==0){
			clearInterval(flag);
			$("#getPhoneCode").removeAttr("disabled");
			$("#getPhoneCode").text("获取验证码");
		}
	}

	$("form").submit(function(){
		var phonecode= $("#phoneCode").val();
		var newphone=$("#form-phone").val();
		if(isright4==true){
			$.ajax({
				url:"customer.do?mn=updatePhoneNumber",
				data:"phonecode="+phonecode+"&oldphone="+'${customer.tel}'+"&newphone="+newphone+"&customerId="+'${customer.id}',
				type:"post",
				success:function(res){
					if(res==1){
						$.ajax({
							url:"custlogin.do?mn=customerlogin",
							data:"loginName="+'${customer.loginName}'+"&paswd="+'${customer.loginPwd}',
							type:"post",
							success:function(res){
								$("#personCenter").click();
							}
						});
						
					}else{
						$("#form-phone").siblings(".input-tip").text("验证码错误");
					}
				}
			});
			return false;
		}else{
			return false;
		}
		
		
	});
</script>
</html>