<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <style type="text/css">
            .updt{
            		font-size: 18px; 
            		line-height: 30px;
            		width: 173px;
            	}
            .sele{
            	border:none;
            	background-color:rgba(0,0,0,0.1);
            	margin:0px;
            	padding:2px;
            	width:170px;
            	height:55px;
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
			var currentpage = ${param.curpage };
			$(".addRole").click(function(){
				var roleId = $(".sele").val();
				var userId = ${user.userId };
				var hasRole = false;
				for(var i=0;i<$(".delRole").length;i++){
					if($(".delRole").eq(i).attr("delId")==roleId){
						hasRole = true;
						$(".homeTip").text("请勿重复添加该职位");
						$(".homeTip").show(200);
						setTimeout(function(){
							$(".homeTip").fadeOut(1000);
						},1000);
						break;
					}
				}
				if(!hasRole){
					$.ajax({
						url:"user.do",
						type:"post",
						data:"mn=addRole&roleId="+roleId+"&userId="+userId,
						success:function(res){
							if(res==1){
								$(".homeTip").text("添加成功！");
								$(".homeTip").show(200);
								$("#home").load("user.do?mn=goUpdateRole&userId="+userId+"&curpage="+currentpage);
								setTimeout(function(){
									$(".homeTip").fadeOut(1000);
								},1000);
							}else if(res==0){
								alert("添加失败！");
							}
						}
					})
				}
			})
			
			$("#del").on("click",".delRole",function(){
				if($(".delRole").length<=1){
					$(".homeTip").text("员工至少有一个职位");
					$(".homeTip").show(200);
					setTimeout(function(){
						$(".homeTip").fadeOut(1000);
					},1000);
				}else if(confirm("确认删除？")){
					var roleId = $(this).attr("delId");
					var userId = ${user.userId };
					$.ajax({
						url:"user.do",
						type:"post",
						data:"mn=delRole&roleId="+roleId+"&userId="+userId,
						success:function(res){
							if(res==1){
								$(".homeTip").text("删除成功");
								$(".homeTip").show(200);
								$("#home").load("user.do?mn=goUpdateRole&userId="+userId+"&curpage="+currentpage);
								setTimeout(function(){
									$(".homeTip").fadeOut(1000);
								},1000);
							}else if(res==0){
								alert("删除失败！");
							}
						}
					})
					
				};
			})
		
			$("#addRes").click(function(){
				$("#home").load("user.do?mn=showUser&currentpage="+currentpage);
			});
			
		</script>
