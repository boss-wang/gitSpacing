<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
            .mess{
            		padding: 20px;
            		font-size: 18px; 
            		line-height: 30px;
            		height: 30px;
            	}	
            	.tit{
            		height: 130px;
            	}
            	.tit>div{
            		margin: 20px auto 20px 310px ;
            	}
            	.tit-mess{
            		height: 5px;
            	}
            	.tip{
            		margin-left: 410px; 
            		line-height: 30px;
            	}
            	#userAccount{
            		ime-mode: disabled;
            	}
            	#last{
            		font-size: 18px; 
            		
            	}
            	#last a{
            		margin: 20px;
            		
            	}
            	#del{
            		margin-top:30px ;
            		border-color: rgba(0,0,0,0.2);
            	 margin-left:310px ;
            	 text-align:center; 
            	 border-collapse:collapse ;
            	}
            </style>
<body id="skin-blur-blue">
		 <!-- 删除员工 -->
                <div class="tit">
                    <div class="col-md-3 col-xs-6" style="margin-left: 420px;">
                        <div class="tile quick-stats">
                            <h3 style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">删除员工</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
            <!-- 表单内容 -->
        <table   border="1px"  id="del"  >
            	<tr id="" class="tit-mess">
            		<td class="mess" >员工账号</td>
            		<td class="mess" >员工姓名</td>
            		<td class="mess" >员工性别</td>
            		<td class="mess" >员工职位</td>
            		<td class="mess" >操作栏</td>
            	</tr> 
            	<tr  class="tit-mess">
            		<td class="mess"></td>
            		<td class="mess"></td>
            		<td class="mess"></td>
            		<td class="mess"></td>
            		<td class="mess"><a href="">删&nbsp;&nbsp;除</a></td>
            	</tr> 
            	<tr id="last"  >
            		<td  colspan="5"><a href="" >首页</a><a href="">上一页</a><a href="">下一页</a><a href="">末页</a></td>
            		
            	</tr> 
        </table>  
	<script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
	
	</body>