$(function(){
			var m = 60;
			var flag;
			var isright1=false;
			var isright2=false;
			var isright3=false;
			var isright4=false;
			var isright5=false;
			$("#form-account").blur(function(){
			var value=$(this).val();
			
			var reg=/^[A-Za-z0-9_]{4,12}$/;
			if(!reg.test(value)){
				$(this).siblings(".i-status").hide();
				$(this).siblings(".input-tip").text("格式错误");
				isright1=false;
			}else{
				$.ajax({
					url:"custlogin.do?mn=isrepeat",
					data:"loginName="+value,
					type:"post",
					success:function(res){
						if(res==1){
							$("#form-account").siblings(".input-tip").text("");
							$("#form-account").siblings(".i-status").show();
							isright1=true;
						}else{
							$("#form-account").siblings(".i-status").hide();
							$("#form-account").siblings(".input-tip").text("用户名存在");
							isright1=false;
						}
					}
				})
				
			}
			
			})
				$("#form-pwd").blur(function(){
					var value=$(this).val();
			
					var reg=/^[A-Za-z0-9_]{8,}$/;
				if(!reg.test(value)){
					$(this).siblings(".i-status").hide();
					$(this).siblings(".input-tip").text("格式错误");
					isright2=false;
				}else{
					$(this).siblings(".input-tip").text("");
					$(this).siblings(".i-status").show();
					isright2=true;
			}
			
			})
					$("#form-equalTopwd").blur(function(){
					var value1=$("#form-pwd").val();
					var value2=$(this).val();
					var reg=/^[A-Za-z0-9_]{8,}$/;
				if(!reg.test(value2)||value1!=value2){
					$(this).siblings(".i-status").hide();
					$(this).siblings(".input-tip").text("密码不一致");
					isright3=false;
				}else{
					$(this).siblings(".input-tip").text("");
					$(this).siblings(".i-status").show();
					isright3=true;
			}
			
			});
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
			$("#getPhoneCode").click(function(){
				var value=$("#form-phone").val();
						if(value==null||value==''){
							$("#form-phone").siblings(".input-tip").text("请填写完整信息");
						}
						
					})		
			
				
				
				
					$("form").submit(function(){
						//手机验证码
						var phonecode= $("#phoneCode").val();
						if(isright1==true&&isright2==true&&isright3==true&&isright4==true){
							$.ajax({
								url:"custlogin.do?mn=islogin",
								data:"phonecode="+phonecode+"&loginName="+$("#form-account").val()+"&loginPwd="+$("#form-pwd").val()+"&tel="+$("#form-phone").val()+"&email="+$('#form-email').val(),
								type:"post",
								success:function(res){
									if(res==1){
										$.ajax({
											url:"custlogin.do?mn=customerlogin",
											data:"loginName="+$("#form-account").val()+"&paswd="+$("#form-pwd").val(),
											type:"post",
											success:function(res){
													window.location.href="index.jsp";
											}
										})
										
									}else{
										$("#form-phone").siblings(".input-tip").text("验证码错误");
									}
								}
							})
						
							
							return false;
						}else{
							return false;
						}
						
					})
					//邮箱验证显示
						$(".orPhone").click(function(){
							  if($('.item-email-wrap').is(':hidden')){//如果当前隐藏  
       							 $('.item-email-wrap').show(); 
       							 $('#form-email').attr("required","required");
       							 $('#form-email').removeAttr("disabled");
       								 }else{  
       								 	 $('#form-email').val('');
       								 	 $('#form-email').removeAttr("required");
       								 	$('#form-email').attr("disabled","disabled");
       							 $('.item-email-wrap').hide();
        								}  
						})
		})