<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<body>
		  <!-- 以下添加供应商联系人 -->
                <div class="tit">
                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats">
                            <h4  style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">${param.supplierName}</h4>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
            <!-- 表单内容 -->
        <form action=" " method="post">
            <div >
            	<div  class="tit-mess">
            		<span class="mess">姓&nbsp;&nbsp;&nbsp;&nbsp;名:</span>
            		<input id="contactName" class="inpu" name="contactName" placeholder="姓名" /><span style="margin-left: 10px;">*</span>
            		<p id="accountTip" class="tip"></p>
            	</div> 
            	<div class="tit-mess">
            		<span class="mess">电&nbsp;&nbsp;&nbsp;&nbsp;话:</span>
 				 	<input id="telephone" class="inpu"  name="telephone" placeholder="电话" /><span style="margin-left: 10px;">*</span>
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
					<input id="addSub" class="mess" type="button" addId="${param.supplierId}"  value="确认添加" />
					<input id="addRes" class="mess" type="button" value="放弃添加"/>
				</div>
            </div>
     		
        </form>  
	</body>
	<script>
		$("#addSub").click(function(){
			var qq =$("#qq").val();
			$(".tip").text("");
			var contactName = $("#contactName").val();
			var telephone = $("#telephone").val();
			var email=$("#email").val();
			var reg=new RegExp("^\\w+@\\w+(\\.[a-zA-Z]{2,3}){1,2}$")
			if(contactName==""||contactName==null){
				$("#accountTip").text("姓名不能为空");
				$("#contactName").focus();
			}else if(telephone==""||telephone==null){
				$("#pwdTip").text("电话不能为空");
				$("#telephone").focus();
			}else if(email!==""&&email!=null&&!reg.test(email)){
				$("#emailTip").text("邮箱格式不对");
				$("#email").focus();
			}else{
				var supplierId =$(this).attr("addId");
				$.ajax({
					type:"post",
					url:"addSupplierContact",
					data:"supplierId="+supplierId+"&contactName="+contactName+"&telephone="+telephone+"&qq="+qq+"&email="+email,
					success:function(res){
						if(res==1){
							var currentPage=${param.currentPage};
							$("#home").load("showSupplier?currentPage="+currentPage);
						}else{
							alert("添加失败");
						}
					}
					
				})
			}
		});
		$("#addRes").click(function(){
			var currentPage=${param.currentPage };
			$("#home").load("showSupplier?currentPage="+currentPage);
		});
	</script>