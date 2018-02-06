<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<body>
		  <!-- 以下添加客户联系人 -->
                <div class="tit">
                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats">
                            <h4  style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">${param.clientName}</h4>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
            <!-- 表单内容 -->
        <form action=" " method="post">
            <div >
            	<div  class="tit-mess">
            		<span class="mess">姓&nbsp;&nbsp;&nbsp;&nbsp;名:</span>
            		<input id="userAccount" class="inpu" name="contactName" placeholder="姓名" /><span style="margin-left: 10px;">*</span>
            		<p id="accountTip" class="tip"></p>
            	</div> 
            	<div class="tit-mess">
            		<span class="mess">电&nbsp;&nbsp;&nbsp;&nbsp;话:</span>
 				 	<input id="userPwd" class="inpu"  name="telephone" placeholder="电话" /><span style="margin-left: 10px;">*</span>
 					<p id="pwdTip" class="tip"></p>
            	</div> 
 				<div  class="tit-mess">
 					<span class="mess">邮&nbsp;&nbsp;&nbsp;&nbsp;箱:</span>
 				 	<input id="email" class="inpu" name="email" placeholder="邮箱" />
 					<p id="emailTip" class="tip"></p>
 				</div> 
 				<div  class="tit-mess">
 					<span class="mess">Q&nbsp;&nbsp;&nbsp;&nbsp;Q:</span>
 				 	<input id="qq" class="inpu" name="qq" placeholder="QQ" />
 					<p id="QQTip" class="tip"></p>
 				</div> 
				
				<div  class="tit-mess">
					<input id="addSub" class="mess" type="button" addId="${param.clientId}"  value="确认添加" />
					<input id="addRes" class="mess" type="button" value="放弃添加"/>
				</div>
            </div>
     		
        </form>  
	</body>
	<script>
		$("#addSub").click(function(){
			
			var qq =$("#qq").val();
			$(".tip").text("");
			var userAccount = $("#userAccount").val();
			var userPwd = $("#userPwd").val();
			var email=$("#email").val();
			var reg=new RegExp("^\\w+@\\w+(\\.[a-zA-Z]{2,3}){1,2}$")
			if(userAccount==""||userAccount==null){
				$("#accountTip").text("姓名不能为空");
				$("#userAccount").focus();
			}else if(userPwd==""||userPwd==null){
				$("#pwdTip").text("电话不能为空");
				$("#userPwd").focus();
			}else if(email!==""&&email!=null){
			if(!reg.test(email)){
				$("#emailTip").text("邮箱格式不对");
				$("#email").focus();
			}else{
				var clientId =$(this).attr("addId");
				$.ajax({
					type:"post",
					url:"client.do",
					data:"clientId="+clientId+"&userAccount="+userAccount+"&userPwd="+userPwd+"&qq="+qq+"&email="+email+"&mn=addClientContact",
					success:function(res){
						alert("联系人添加成功")
						var currentpage=${param.currentpage};
						$("#home").load("client.do?&mn=showClient&currentpage="+currentpage);
					}
					
				})
			}
			}else{
				var clientId =$(this).attr("addId");
				$.ajax({
					type:"post",
					url:"client.do",
					data:"clientId="+clientId+"&userAccount="+userAccount+"&userPwd="+userPwd+"&qq="+qq+"&email="+email+"&mn=addClientContact",
					success:function(res){
						alert("联系人添加成功")
						var currentpage=${param.currentpage};
						$("#home").load("client.do?&mn=showClient&currentpage="+currentpage);
					}
					
				})
			}
			
		});
		$("#addRes").click(function(){
			var currentpage=${param.currentpage};
			$("#home").load("client.do?&mn=showClient&currentpage="+currentpage);
		});
	</script>