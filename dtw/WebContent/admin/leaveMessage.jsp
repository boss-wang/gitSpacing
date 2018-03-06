<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>

	.messdiv{
		overflow-y:scroll; 
		left:100px;
		background-color: rgba(0,0,0,0.8);
		padding:10px;
		line-height: 25px;
	}
</style>
<body>
		 <!-- 供应商管理 -->
                <div class="tit">
                    <div class="col-md-3 col-xs-6" >
                        <div class="tile quick-stats">
                            <h3 style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">客户留言</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
            <!-- 表单内容 -->
        <table   border="1" id="clientUpdate" style="width: 700px; height: 330px"  >
            	<tr id="" class="tit-mess3" >
            		<td class="mess1"  style="width:100px; height:10px">姓名</td>
            		<td   style="width:70px; height:10px ;padding:10px;" >手机</td>
            		<td class="mess1" style="width:120px; height:10px">留言内容</td>
            		
       				<td  class="mess1"	>留言时间</td>
       				
       				<td  class="mess1">操作</td>
            	</tr> 
            	<c:forEach var="leavemessage" items="${messageList }">
            		<tr>
            			<td>${leavemessage.name }</td>
            			<td>${leavemessage.phoneNum }</td>
            			<td>
            			<div class="ccName">
            			<a class="nameContent" >留言详情</a>
            			<div class="messdiv" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${leavemessage.message } </div>
            			</div>
            			</td>
            			
            			<td>${fn:substring(leavemessage.messageTime,0,16) }</td>
            			<td><a id="delmessage" modifyId="${leavemessage.id }">删除</a></td>
            		</tr>
            		 
            	</c:forEach>
	            	
            	<tr id="last" style="height:30px;">
            		<td  colspan="5"><a id="firstPage">首页</a><a id="prePage">上一页</a><a id="nextPage">下一页</a><a id="lastPage">末页</a></td>
            		
            	</tr> 
        </table>  
	<script type="text/javascript">
	
		$("#clientUpdate").on("mouseover", ".ccName", function() {
			$(this).find(".nameContent").css("color", "yellow");
			$(this).find(".messdiv").show();
		});
		$("#clientUpdate").on("mouseout", ".ccName", function() {
			$(this).find(".nameContent").css("color", "white");
			$(this).find(".messdiv").hide();
		});
		//分页
		$("#firstPage").click(function(){
			$("#home").load("customer.do?mn=showCustomerLeaveMessage&currentPage=1");
		})
		$("#lastPage").click(function(){
			var totalPage = ${totalPage };
			$("#home").load("customer.do?mn=showCustomerLeaveMessage&currentPage="+totalPage);
		})
		$("#prePage").click(function(){
			var currentPage = ${currentPage }-1;
			if(currentPage==0){
				$(".homeTip").text("已经是第一页了");
				$(".homeTip").show(200);
				setTimeout(function(){
					$(".homeTip").fadeOut(1000);
				},1000);
			}else{
				$("#home").load("customer.do?mn=showCustomerLeaveMessage&currentPage="+currentPage);
			}
		})
		$("#nextPage").click(function(){
			var totalPage = ${totalPage }+1;
			var currentPage = ${currentPage }+1;
			if(totalPage==currentPage){
					$(".homeTip").text("已经是最后一页了");
					$(".homeTip").show(200);
					setTimeout(function(){
						$(".homeTip").fadeOut(1000);
					},1000);
			}else{
				$("#home").load("customer.do?mn=showCustomerLeaveMessage&currentPage="+currentPage);
			}

		})
		//删除留言
		$("#clientUpdate").on("click","#delmessage",function(){
			var messid=$(this).attr("modifyId");
			var currentPage = ${currentPage };
			if(confirm("确认删除？")){
				$.ajax({
					type:"post",
					url:"leavamassage.do",
					data:"mn=delLeaveMessage&messid="+messid,
					success:function(res){
						if(res==1){
							$(".homeTip").text("删除成功！");
							$(".homeTip").show(200);
							$("#home").load("customer.do?mn=showCustomerLeaveMessage&currentPage="+currentPage);
							setTimeout(function(){
								$(".homeTip").fadeOut(1500);
							},1500);
						}else{
							alert("删除失败");
						}
					}
				})
			}
		})
	</script>
	</body>