<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
.info {
	border-radius: 5px;
	line-height: 30px;
	font-size: 11pt;
	color: #333;
	padding: 25px;
	background: #f7f7f7;
	margin: 25px 0;
}
#tishi{
color:red;
}
</style>

		<div class="container">
			<div class="index-title">
				<a href="#" title="公司简介">请您留言</a>
			</div>
			<div class="info" style="margin:0px auto;width:900px;height:600px;border: 1px solid #f7f7f7;background-color: #f7f7f7;position: relative;">
					<div id="" style="margin-left: 150px;">
						QQ：<br> 客户服务：261668497
						<br> 咨询热线：400-626-1166
						<br>
						<br> 北京总公司地址：
						<br> 北京市顺义区天竺空港开发区A区天柱中路16号
						<br> 电话：400-626-1166
						<br> 邮编：101300
					</div>
					<div id="" style="width: 600px;height: 350px;border: 1px solid #f7f7f7;position: absolute;margin-left: 150px;">
						<iframe src="map.html" width="600" height="350" frameborder="0" scrolling="no"></iframe>
					</div>
				</div>
			
			
			<div class="cont">
				<form id="form1">
					<div  style="height: 30px; margin-left: 393px;">
						<h5 style="display: inline-block; color: #555555; width: 57px;">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</h5>
						<input required name="name" 
							style="width: 300px; height: 24px; margin-left: 5px;"
							placeholder="请输入您的姓名" id="custname" />
					</div>
					<div 
						style="height: 30px; margin-left: 393px; margin-top: 10px;">
						<h5 style="display: inline-block; color: #555555; width: 57px;">联系电话:</h5>
						<input required name="phoneNum"
							style="width: 300px; height: 24px; margin-left: 5px;"
							placeholder="请输入您的联系电话" id="phoneNumber" />
					</div>
					<div 
						style="height: 120px; margin-left: 393px; margin-top: 33px;">
						<h5
							style="display: inline-block; color: #555555; position: absolute; width: 57px;">内容:</h5>
						<textarea required name="message" id="content"
							style="width: 298px; height: 100px; margin-left: 67px;"
							placeholder="留言：您留言后，我们很快会和你电话联系，同时非常感谢您的关注，愿我们合作成功。"></textarea>
					</div>
					<div 
						style="height: 30px; margin-left: 460px; margin-top: 10px;">
						<input type="button" name="" id="addMessage" value="提交"
							style="height: 30px; width: 100px; border: 1px solid orangered; background-color: orangered; color: white;" />
					<span id="tishi"></span>
					</div>
				</form>
			</div>
	</div>
<script type="text/javascript">
	$("#addMessage").click(function() {
		var custname=$("#custname").val();
		var phoneNumber=$("#phoneNumber").val();
		var content=$("#content").val();
		var reg=/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
		if(custname==''||phoneNumber==''||content==''){
			$("#tishi").text("请填写完整信息");
		}else if(!reg.test(phoneNumber)){
			$("#tishi").text("手机号格式错误");
		}else{
			$("#tishi").text("");
			$.ajax({
				//几个参数需要注意一下
				type : "POST",//方法类型
				dataType : "json",//预期服务器返回的数据类型
				url : "leavamassage.do",//url
				data : "mn=addLeaveMessage&" + $("#form1").serialize(),
				success : function(result) {
					console.log(result);//打印服务端返回的数据(调试用)
					if (result > 0) {
						alert("留言成功");
						window.location.href = "index.jsp";
					} else {
						alert("失败");
					}
				},
				error : function() {
					alert("异常！");
				}
			});
		}
		
	});
</script>
</html>