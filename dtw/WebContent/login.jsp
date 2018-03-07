<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>欢迎登录大田物流</title>
</head>
<link href="css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<style>
		#prompt {
			color: red;
			position: relative;
			left: 10px;
			font-size:14px;
		}

		.outer{
            position: relative;
            width: 287px;
            height: 30px;
            line-height: 30px;
            border:1px solid #ccc;
            background: #ccc9c9;
        }
        .outer span,.filter-box,.inner{
            position: absolute;
            top: 0;
            left: 0;
        }
        .outer span{
            display: block;
            width: 100%;
            height: 100%;
            color: #fff;
            text-align: center;
        }
        .filter-box{
            width: 0;
            height: 100%;
            background: green;
            z-index: 9;
        }
        .outer.act span{
            padding:0 36px 0 0;
        }
        .inner{
            width: 36px;
            height: 30px;
            text-align: center;
            background: #fff;
            cursor: pointer;
            font-family: "宋体";
            z-index: 10;
            font-weight: bold;
            color: #929292;
        }
        .outer.act .inner{
            color: green;
        }
        .outer.act span{
            z-index: 99;
        }
</style>
<body>
	<header> <img src="img/logo-login.png" id="logo" />
	<div>
		<span>欢迎登录</span>
	</div>
	</header>
	<main>
	<div>
		<form action="" method="post">
			<ul>
				
				<li><span>用户登陆</span> <a href="register.jsp"><img
						src="img/icon5.jpg">&nbsp;立即注册</a><span id="prompt"></span></li>
				<li><a href="zh"><img src="img/icon1.jpg"></a><input
					required="" type="text" id="loginName" placeholder=" 邮箱/用户名/已验证手机"></li>
				<li><a href="mm"><img src="img/icon2.jpg"></a><input
					required="" type="password" id="paswd" placeholder=" 密码"></li>
				<li id="testLI">
					<div   class="outer">
						 <div class="filter-box"></div>
					     <span>滑动解锁 </span>
					     <div class="inner">&gt;&gt;</div>
				    </div>
				</li>
				<li><input type="checkbox"> 自动登录 <a href="">忘记密码?</a></li>
				<li><input type="submit" id="" value="登 录"></li>
			</ul>
		</form>


	</div>
	</main>
</body>
<script>
	
	var testRight = true;
	$("form").submit(function(){
		//还原验证区
		 var el = $(".inner"),os = el.offset(),dx,$span=$(".outer>span"),$filter=$(".filter-box"),_differ=$(".outer").width()-el.width();
		 dx=0;
         $span.html("滑动解锁");
         $filter.css('width',dx);
         el.css("left",dx);
         
		var reg1=/^[A-Za-z0-9_]{4,12}$/;
		var reg2=/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
		var reg3=/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
		var loginName = $("#loginName").val();
		
		var paswd=$("#paswd").val();
		if(testRight){
			if(reg1.test(loginName)||reg2.test(loginName)||reg3.test(loginName)){
				$("#prompt").text("");
				$(".outer").removeClass("act");
				
				$.ajax({
					url:"custlogin.do?mn=customerlogin",
					data:"loginName="+loginName+"&paswd="+paswd,
					type:"post",
					success:function(res){
						var resJson = JSON.parse(res);
						if(resJson.loginTimes>=3){
							$("#testLI").show();
							 testRight = false;
						}
						if(resJson.back==1){
							window.location.href="<%=basePath%>index.jsp";
						} else if (resJson.back == 2) {
							$("#prompt").text("密码错误");
						} else if (resJson.back == 3) {
							$("#prompt").text("用户不存在");
						}
					}
				});
				} else {
					$("#prompt").text("用户名格式不正确");
				}
				return false;
		}else{
			$("#prompt").text("请滑动解锁");
			return false;
		}
	});
	$(function(){
        $(".inner").mousedown(function(e){
            var el = $(".inner"),os = el.offset(),dx,$span=$(".outer>span"),$filter=$(".filter-box"),_differ=$(".outer").width()-el.width();
            $(document).mousemove(function(e){
                dx = e.pageX - os.left;
                if(dx<0){
                    dx=0;
                }else if(dx>_differ){
                    dx=_differ;
                }
                $filter.css('width',dx);
                el.css("left",dx);
            });
            $(document).mouseup(function(e){
                $(document).off('mousemove');
                $(document).off('mouseup');
                dx = e.pageX - os.left;
                if(dx<_differ){
                    dx=0;
                    $span.html("滑动解锁");
                }else if(dx>=_differ){
                    dx=_differ;
                    $(".outer").addClass("act");
                    $span.html("验证通过！");
                    el.html('&radic;');
                    testRight = true;
                }
                $filter.css('width',dx);
                el.css("left",dx);

            });
        });
    });
</script>
</html>