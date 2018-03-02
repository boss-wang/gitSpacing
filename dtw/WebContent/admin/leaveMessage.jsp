<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.messdiv input{
		background-color:rgba(0,0,0,0.7);
		display:inline-block;
		border:none;
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
        <table   border="1" id="clientUpdate" style="width: 600px; height: 30px"  >
            	<tr id="" class="tit-mess3" style="height:40px">
            		<td class="mess1"  style="width:30px; height:10px">姓名</td>
            		<td class="mess1"  style="width:70px; height:10px" >手机</td>
            		<td class="mess1" style="width:120px; height:10px">留言内容</td>
       
            	</tr> 
            	<c:forEach var="leavemessage" items="${leavemessageList }">
            		<tr>
            			<td>${leavemessage.name }</td>
            			<td>${leavemessage.phoneNum }</td>
            			<td>${leavemessage.message }
            		</tr>
            		 
            	</c:forEach>
	            	
            	<tr id="last" style="height:30px;">
            		<td  colspan="5"><a id="firstPage">首页</a><a id="prePage">上一页</a><a id="nextPage">下一页</a><a id="lastPage">末页</a></td>
            		
            	</tr> 
        </table>  
	<script type="text/javascript">
		//分页
		$("#firstPage").click(function(){
			$("#home").load("supplier.do?mn=showSupplier&currentPage=1");
		})
		$("#lastPage").click(function(){
			var totalPage = ${totalPage };
			$("#home").load("supplier.do?mn=showSupplier&currentPage="+totalPage);
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
				$("#home").load("supplier.do?mn=showSupplier&currentPage="+currentPage);
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
				$("#home").load("supplier.do?mn=showSupplier&currentPage="+currentPage);
			}

		})
	</script>
	</body>