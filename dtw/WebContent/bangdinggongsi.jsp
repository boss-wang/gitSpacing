<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<html>


	<body>
		<a name="abstract"></a>
		<div class="index-about">
			<div class="container">
				<div class="index-title">
					<a href="#" title="公司简介">请绑定公司</a>
				</div>
				<div class="cont">
					<form action="" method="post">
						<div id="" style="height: 30px;margin-left:393px;">
							<h3 style="display: inline-block;color: #555555;">公司名称:</h3>
							<input style="width:300px;height: 24px; margin-left: 5px;" placeholder="请输入公司名称" />
						</div>
						<div id="" style="height: 120px;margin-left:393px;margin-top: 10px;">
							<h3 style="display: inline-block;color: #555555;position: absolute;">公司地址:</h3>
							<!--<input style="width:300px;height: 24px; margin-left: 5px;" placeholder="请输入公司地址" />-->
							<textarea name="" rows="" cols="" style="width:300px;height: 100px; margin-left: 90.2px;" placeholder="请输入公司地址"></textarea>
						</div>
						<div id="" style="height: 30px;margin-left:482px;margin-top: 10px;">
							<input type="button" name="" id="" value="确认绑定" style="height:30px;width: 100px;border: 1px solid orangered;background-color: orangered;color: white;" />
							<input type="reset" name="" id="" value="重新填写" style="height:30px;width: 100px;border: 1px solid orangered;background-color: orangered;color: white;margin-left: 102px;" />
						</div>

					</form>
				</div>
				<!--cont end-->
			</div>
			<!--container end-->
		</div>
		
		<!--news end-->
		</div>
		

	</body>

</html>