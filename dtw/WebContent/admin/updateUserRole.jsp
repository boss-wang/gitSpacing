<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <style type="text/css">
            .updt{
            		font-size: 18px; 
            		line-height: 30px;
            		height: 30px;
            		width: 173px;
            	}
            .sele{
            	border:none;
            	background-color:rgba(0,0,0,0.1);
            	margin:0px;
            	padding:2px;
            	width:170px;
            	height:78px;
            }	
            </style>
<body>
		 <!-- 修改员工 -->
                <div class="tit">
                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats">
                            <h3 style="background-color: rgba(0,0,0,0.15); padding: 10px;text-align:center">
                            	${user.userName }
                            </h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
            <!-- 表单内容 -->
        <table   border="1"  id="del"  >
            	<tr id="" class="tit-mess">
            		<td colspan="2" class="updt" >现任职位</td>
            	</tr> 
            	<c:forEach var="role" items="${user.roles }">
            		<tr class="tit-mess" >
	            		<td class="updt"><a>${role.roleName }</a></td>
	            		<td class="updt"><a class="delRole" delId="${role.roleId }">删&nbsp;&nbsp;除</a></td>
            		</tr> 
            	</c:forEach>
            	<tr id="" class="tit-mess">
            		<td colspan="2" class="updt" >添加职位</td>
            	</tr> 
            	<tr  class="tit-mess">
            		<td class="updt">
            		<select class="sele" style="text-indent:62px;">
            			<c:forEach var="role" items="${rolelist }">
 							<option style="background-color:rgb(52,81,97); color:white;" value="${role.roleId }">${role.roleName }</option>
 						</c:forEach>
					</select>
					</td>
            		<td class="updt"><a class="addRole">增&nbsp;&nbsp;加</a></td>
            	</tr> 
        </table>  
        <input id="addRes" class="mess" style="border:0px;height:50px;width:350px;margin-left:310px;" type="button" value="返 回" />
        
  </body>

		
		<script type="text/javascript">
			$(".addRole").click(function(){
				var roleId = $(".sele").val();
				var userId = ${user.userId };
				var hasRole = false;
				for(var i=0;i<$(".delRole").length;i++){
					if($(".delRole").eq(i).attr("delId")==roleId){
						hasRole = true;
						alert("此用户已经拥有该职位，请勿重复添加");
						break;
					}
				}
				if(!hasRole){
					$.ajax({
						url:"addUserRole",
						type:"post",
						data:"roleId="+roleId+"&userId="+userId,
						success:function(res){
							if(res==1){
								alert("添加成功！");
								$("#home").load("showUserRole?userId="+userId);
							}else if(res==0){
								alert("添加失败！");
							}
						}
					})
				}
			})
			
			$("#del").on("click",".delRole",function(){
				if($(".delRole").length<=1){
					alert("员工至少有一个职位");
				}else if(confirm("确认删除？")){
					var roleId = $(this).attr("delId");
					var userId = ${user.userId };
					$.ajax({
						url:"delUserRole",
						type:"post",
						data:"roleId="+roleId+"&userId="+userId,
						success:function(res){
							if(res==1){
								alert("删除成功！");
								$("#home").load("showUserRole?userId="+userId);
							}else if(res==0){
								alert("删除失败！");
							}
						}
					})
					
				};
			})
		
			$("#addRes").click(function(){
				$("#home").load("/dtw/showUser");
			});
			
		</script>
