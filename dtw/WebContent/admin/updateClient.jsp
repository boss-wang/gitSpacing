<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
            		<td class="mess1"  style="width:135px;">客户公司抬头</td>
            		<td class="mess1"  style="width:160px;" >客户公司地址</td>
            		<td class="mess1" style="width:120px;">联系人</td>
            		<td class="mess1" style="width:120px;">联系人操作</td>
            		<td class="mess1" style="width:120px;">操作栏</td>
            	</tr> 
            	
            	<tr  class="tit-mess3">
            		<td class="mess2">江苏打你分飞鸟分发氨基藕粉</td>
            		<td class="mess2">分爱分评价哦叫分解机房内傲娇密封风机分泌垃圾 飞丰来讲ife丰满来减肥分泌哦分爱浪费金额i 额!!!∑(ﾟДﾟノ)ノ</td>
            		<td class="mess2">
            			<a class="ccName">赵振</a>
            			<div class="messdiv">
							<p>电话：182737373</p>
							<p>邮箱：2828929@11.com</p>
							<p>Q Q：fejifeij</p>
						</div>
						<a class="ccName">赵振</a>
						<div class="messdiv">
							<p>电话：100000</p>
							<p>邮箱：2828929@11.com</p>
							<p>Q Q：fejifeij</p>
						</div>
            		</td>
            		<td class="mess2"><a class="addCC" modifyId="ls">增加</a>&nbsp;&nbsp;<a class="delCC" modifyId="ls">删除</a></td>
            		<td class="mess2"><a class="updateClient" modifyId="ls">修改</a>&nbsp;&nbsp;<a href="">删除</a></td>
            	</tr> 
            	
            	<tr  class="tit-mess3">
            		<td class="mess2">江苏打你分飞鸟分发氨基藕粉</td>
            		<td class="mess2">分爱分评价哦叫分解机房内傲娇密封风机分泌垃圾 飞丰来讲ife丰满来减肥分泌哦分爱浪费金额i 额!!!∑(ﾟДﾟノ)ノ</td>
            		<td class="mess2">
            			<a class="ccName">赵振</a>
            			<div class="messdiv">
							<p>电话：182737373</p>
							<p>邮箱：2828929@11.com</p>
							<p>Q Q：fejifeij</p>
						</div>
						<a class="ccName">赵振</a>
						<div class="messdiv">
							<p>电话：100000</p>
							<p>邮箱：2828929@11.com</p>
							<p>Q Q：fejifeij</p>
						</div>
            		</td>
            		<td class="mess2"><a class="addCC" modifyId="ls">增加</a>&nbsp;&nbsp;<a class="delCC" modifyId="ls">删除</a></td>
            		<td class="mess2"><a class="updateClient" modifyId="ls">修改</a>&nbsp;&nbsp;<a href="">删除</a></td>
            	</tr> 
            	
            	
            	<tr id="last"  >
            		<td  colspan="5"><a href="" >首页</a><a href="">上一页</a><a href="">下一页</a><a href="">末页</a></td>
            		
            	</tr> 
        </table>  
	<script type="text/javascript">
		$("body").on("click",".updateClient",function(){
			$("#home").load("/dtw/admin/updateClientAddress.jsp");
		});
		$("body").on("mouseover",".ccName",function(){
			$(this).next().show(100);
		});
		$("body").on("mouseout",".ccName",function(){
			$(this).next().hide(100);
		});
	</script>
	</body>