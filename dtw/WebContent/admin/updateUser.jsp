<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>
		 <!-- 修改员工 -->
                <div class="tit">
                    <div class="col-md-3 col-xs-6" >
                        <div class="tile quick-stats">
                            <h3 style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">员工管理</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
            <!-- 表单内容 -->
        <table   border="1"  id="del"  >
            	<tr id="" class="tit-mess1">
            		<td class="mess1" >员工账号</td>
            		<td class="mess1" >员工姓名</td>
            		<td class="mess1" >员工性别</td>
            		<td class="mess1" >员工职位</td>
            		<td class="mess1" >操作栏</td>
            	</tr> 
            	
            	<c:forEach var="user" items="${userList }">
            		<tr  class="tit-mess1">
	            		<td class="mess1">${user.userAccount }</td>
	            		<td class="mess1">${user.userName }</td>
	            		<td class="mess1">${user.userSex }</td>
	            		<td class="mess1">
	            			<c:forEach var="role" items="${user.roles }">${role.roleName } </c:forEach>
	            		</td>
	            		<td class="mess1"><a class="updateRole" modifyId="ls">修改</a>&nbsp;&nbsp;<a href="">删除</a></td>
            		</tr> 
            	</c:forEach>
            	
            
            	<tr id="last"  >
            		<td  colspan="5"><a id="firstPage" >首页</a><a id="prePage" >上一页</a><a id="nextPage">下一页</a><a id="lastPage" >末页</a></td>
            		
            	</tr> 
        </table>  
	<script type="text/javascript">
		$(".updateRole").click(function(){
			$("#home").load("/dtw/admin/updateRole.jsp");
		})
		$("#prePage").click(function(){
			var curpage = ${curpage-1 };
			$("#home").load("/dtw/showUser?currentpage="+curpage);
		})
		$("#nextPage").click(function(){
			var curpage = ${curpage+1 };
			$("#home").load("/dtw/showUser?currentpage="+curpage);
		})
		$("#firstPage").click(function(){
			var curpage = 1;
			$("#home").load("/dtw/showUser?currentpage="+curpage);
		})
		$("#lastPage").click(function(){
			var curpage = ${totalPage};
			$("#home").load("/dtw/showUser?currentpage="+curpage);
		})
		
	</script>
	</body>