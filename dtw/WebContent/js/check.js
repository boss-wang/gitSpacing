$("#userName").blur(function(){
	var userName = $(this).val();
	$("#tip")[0].innerText="";
	if(userName==""||userName==null){
		$("#tip")[0].innerText="请输入用户名";
	}
})
$("#submit").click(function(){
	var userName = $("#userName").val();
	var password = $("#password").val();
		$("#tip")[0].innerText="";
	if(userName==""||userName==null){
		$("#tip")[0].innerText="请输入用户名";
		$("#userName").focus();
	}else if(password==""||password==null){
		$("#tip")[0].innerText="请输入密码";
		$("#password").focus();
	}else{
		$.ajax({
			type:"post",
			url:"login",
			data:"userName="+userName+"&password="+password,
			async:true,
			success:function(res){
				alert(res)
			}
		});
	}
})
