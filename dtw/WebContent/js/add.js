		$("#addRes").click(function(){
			$(".tip").text("");
			$("#userAccount").focus();
		});
		$("#addSub").click(function(){
			$(".tip").text("");
			var userAccount = $("#userAccount").val();
			var userPwd = $("#userPwd").val();
			var userName = $("#userName").val();
			var userSex = $("#userSex").val();
			var roleId = $("#roleId").val();
			var ex = /^[0-9a-zA_Z]+$/;
			if(userAccount==""||userAccount==null){
				$("#accountTip").text("账号不能为空");
				$("#userAccount").focus();
			}else if(userPwd==""||userPwd==null){
				$("#pwdTip").text("密码不能为空");
				$("#userPwd").focus();
			}else if(userName==""||userName==null){
				$("#nameTip").text("姓名不能为空");
				$("#userName").focus();
			}else if(!ex.test(userAccount)){
				$("#accountTip").text("请输入英文或数字");
				$("#userAccount").focus();
			}else{
				$.ajax({
					type:"post",
					url:"user.do",
					data:"mn=addUser&userAccount="+userAccount+"&userPwd="+userPwd+"&userName="+userName+"&userSex="+userSex+"&roleId="+roleId,
					async:true,
					success:function(res){
						if(res==3){
							$("#accountTip").text("账号已经存在");
							$("#userAccount").focus();
						}else if(res==0){
							alert("添加失败");
						}else if(res==1){
							alert("用户添加成功，职位未添加");
							$("#home").load("user.do?mn=showUser");
						}else if(res==2){
							$(".homeTip").text("用户添加成功");
							$(".homeTip").show(200);
							$("#home").load("user.do?mn=showUser");
							setTimeout(function(){
								$(".homeTip").fadeOut(1000);
							},1000);
						}
					}
				})
			}
		})