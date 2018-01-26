<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
        <!-- CSS1234 -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/font-awesome.min.css" rel="stylesheet">
        <link href="../css/form.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <link href="../css/icons.css" rel="stylesheet">
        <link href="../css/generics.css" rel="stylesheet"> 
        <link rel="stylesheet" href="../css/add.css" />
        
	</head>
	<body style="background-color: rgba(0,0,0,0);">
		  <!-- 以下添加员工 -->
                <div class="tit">
                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats">
                            <h3  style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px;">添加员工</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
            <!-- 表单内容 -->
        <form action="aaa" method="post">
            <div id="">
            	<div id="" class="tit-mess">
            		<span class="mess">账&nbsp;&nbsp;&nbsp;号</span>
            		<input id="userAccount" class="inpu" name="userAccount" placeholder="员工登录账号" /><span style="margin-left: 10px;">*</span>
            		<p id="accountTip" class="tip"></p>
            	</div> 
            	<div class="tit-mess">
            		<span class="mess">密&nbsp;&nbsp;&nbsp;码</span>
 				 	<input id="userPwd" class="inpu" type="password" name="userPwd" placeholder="员工登录密码" /><span style="margin-left: 10px;">*</span>
 					<p id="pwdTip" class="tip"></p>
            	</div> 
 				<div id="" class="tit-mess">
 					<span class="mess">姓&nbsp;&nbsp;&nbsp;名</span>
 				 	<input id="userName" class="inpu" name="userName" placeholder="员工姓名" /><span style="margin-left: 10px;">*</span>
 					<p id="nameTip" class="tip"></p>
 				</div> 
 				<div id="" class="tit-mess">
 					<span class="mess">性&nbsp;&nbsp;&nbsp;别 </span>
 						<select id="userSex" class="inpu" name="userSex">
 							<option value="男">男</option>
 							<option value="女">女</option>
 						</select>
				</div> 
				<div id="" class="tit-mess">
 					<span class="mess">职&nbsp;&nbsp;&nbsp;位</span>
 						<select id="roleId" class="inpu" name="roleId">
 							<option value="1">管理员</option>
 							<option value="2">主管</option>
 							<option value="3" selected="selected">员工</option>
 						</select>
				</div> 
				<div id="" class="tit-mess">
					<input id="addSub" class="mess" type="button" value="确认添加"/>
					<input id="addRes" class="mess" type="reset" value="重新填写"/>
				</div>
            </div>
     		
        </form>  
	<script type="text/javascript" src="../js/jquery-3.2.1.min.js" ></script>
	<script type="text/javascript" src="../js/add.js" ></script>
	</body>
</html>
