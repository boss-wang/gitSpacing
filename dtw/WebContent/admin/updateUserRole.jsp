<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            <h3 style="background-color: rgba(0,0,0,0.15); padding: 10px;">
                            	<span style="margin-left: 30px;">姓&nbsp;&nbsp;&nbsp;&nbsp;名:</span>
                            </h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
            <!-- 表单内容 -->
        <table   border="1"  id="del"  >
            	<tr id="" class="tit-mess">
            		<td class="updt" >职位</td>
            		<td class="updt" >操作栏</td>
            	</tr> 
            	<tr  class="tit-mess">
            		<td class="updt"><a href="">员工</a></td>
            		<td class="updt"><a href="">删&nbsp;&nbsp;除</a></td>
            	</tr> 
            	<tr  class="tit-mess">
            		<td class="updt"><a href="">主管</a></td>
            		<td class="updt"><a href="">删&nbsp;&nbsp;除</a></td>
            	</tr> 
            	<tr  class="tit-mess">
            		<td class="updt">
            		<select class="sele" style="text-indent:62px;">
						<option style="background-color:rgb(52,81,97); color:white;" value="管理员">管理员</option>
						<option style="background-color:rgb(52,81,97); color:white;" value="主管">主管</option>
						<option style="background-color:rgb(52,81,97); color:white;" value="普通员工">普通员工</option>
					</select>
					</td>
            		<td class="updt"><a href="">增&nbsp;&nbsp;加</a></td>
            	</tr> 
        </table>  
        <input id="addRes" class="mess" style="border:0px;height:50px;width:350px;margin-left:310px;" type="button" value="返 回" />
        
  </body>

		
		<script type="text/javascript">
			$("#addRes").click(function(){
				$("#home").load("/dtw/showUser");
			});
			
		</script>
