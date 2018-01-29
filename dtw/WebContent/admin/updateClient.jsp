<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
		 <!-- 修改客户信息 -->
                <div class="tit">
                    <div class="col-md-3 col-xs-6" >
                        <div class="tile quick-stats">
                            <h3 style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">客户管理</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
            <!-- 表单内容 -->
        <table   border="1"  id="clientUpdate"  >
            	<tr id="" class="tit-mess3">
            		<td class="mess1"  style="width:150px;">客户公司抬头</td>
            		<td class="mess1"  style="width:160px;" >客户公司地址</td>
            		<td class="mess1" style="width:120px;">联系人</td>
            		<td class="mess1" style="width:120px;">联系人操作</td>
            		<td class="mess1" style="width:120px;">操作栏</td>
            	</tr> 
            	<c:forEach var="client" items="${list }">
            	<tr  class="tit-mess3">
            		<td class="mess2">${client.clientName }</td>
            		<td class="mess2">${client.clientAddress }</td>
            		
            		<td class="mess2">
            		<c:forEach var="clientcontact" items="${client.clientContactlist}">
            			<a class="ccName">${clientcontact.clientContactName}</a>
            			<div class="messdiv">
							<p>电话：${clientcontact.clientContactTel}</p>
							<c:if test="${clientcontact.clientContactEmail!=null }">
							<p>邮箱：${clientcontact.clientContactEmail}</p>
							</c:if>
							<c:if test="${clientcontact.clientContactQQ!=null }">
							<p>Q Q：${clientcontact.clientContactQQ}</p>
							</c:if>
						</div>
						</c:forEach>
            		</td>
            		<td class="mess2"><a class="addCC" modifyId="ls">增加</a>&nbsp;&nbsp;<a class="delCC" modifyId="ls">删除</a></td>
            		<td class="mess2"><a class="updateClient" modifyId="ls">修改</a>&nbsp;&nbsp;<a href="">删除</a></td>
            	</tr> 
            	</c:forEach>
            	
            	<tr id="last" style="height:50px;">
            		<td  colspan="5"><a href="" >首页</a><a href="">上一页</a><a href="">下一页</a><a href="">末页</a></td>
            		
            	</tr> 
        </table>  
	<script type="text/javascript">
		$("body").on("click",".updateClient",function(){
			$("#home").load("/dtw/admin/updateClientAddress.jsp");
		});
		$("body").on("mouseover",".ccName",function(){
			$(this).next().show(200);
		});
		$("body").on("mouseout",".ccName",function(){
			$(this).next().hide(200);
		});
		$("body").on("click",".addCC",function(){
			$("#home").load("/dtw/addClientContact");
		})
	</script>
	</body>