<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
            	<tr  class="tit-mess1">
            		<td class="mess1"></td>
            		<td class="mess1"></td>
            		<td class="mess1"></td>
            		<td class="mess1"></td>
            		<td class="mess1"><a class="updateRole" modifyId="ls">修改</a>&nbsp;&nbsp;<a href="">删除</a></td>
            	</tr> 
            	<tr id="last"  >
            		<td  colspan="5"><a href="" >首页</a><a href="">上一页</a><a href="">下一页</a><a href="">末页</a></td>
            		
            	</tr> 
        </table>  
	<script type="text/javascript">
		$(".updateRole").click(function(){
			$("#home").load("/dtw/admin/updateRole.jsp");
		})
	</script>
	</body>