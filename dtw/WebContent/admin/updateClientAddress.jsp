<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<body>
		  <!-- 修改客户 -->
                <div class="tit">
                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats">
                            <h3 style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">修改客户</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
            <!-- 表单内容 -->
        <form action="aaa" method="post" style="position:relative;top:50px">
            <div >
            	<div  class="tit-mess">
            		<span class="mess">客&nbsp;&nbsp;&nbsp;户</span>
            		<input id="clientName" class="inpu" name="clientName" placeholder="公司抬头" value=${clientText.clientName } /><span style="margin-left: 10px;">*</span>
            		<p id="nameTip" class="tip"></p>
            	</div> 
            	<div class="tit-mess">
            		<span class="mess">地&nbsp;&nbsp;&nbsp;址</span>
 				 	<textarea id="clientAddress" class="inpu" style="height: 50px;position:relative;top:18px" name="clientAddress" placeholder="公司地址" >${clientText.clientAddress }</textarea><span style="margin-left: 10px;">*</span>
 					<p id="addressTip" class="tip"></p>
            	</div> 
				<div  class="tit-mess">
					<input id="addSub" class="mess" type="button" value="确认修改"/>
					<input id="addRes" class="mess" type="button" value="放弃修改"/>
				</div>
            </div>
        </form>  
        
	<script type="text/javascript">
		$("#addRes").click(function(){
			var curpage = ${currentpage};
			$("#home").load("/dtw/client.do?mn=showClient&currentpage="+curpage);
		});
		$("#addSub").click(function(){
			$(".tip").text("");
			
			var clientName = $("#clientName").val();
			var clientAddress = $("#clientAddress").val();
			if(clientName==""||clientName==null){
				$("#nameTip").text("公司名不能为空");
				$("#clientName").focus();
			}else if(clientAddress==""||clientAddress==null){
				$("#AddressTip").text("地址不能为空");
				$("#clientAddress").focus();
			}else{
				var curpage = ${currentpage};
				var clientId =${clientText.clientId };
				$.ajax({
					type:"post",
					url:"client.do",
					data:"clientName="+clientName+"&clientAddress="+clientAddress+"&clientId="+clientId+"&mn=updateClient",
					async:true,
					success:function(res){
						if(res==0){
							$("#nameTip").text("公司名已经存在");
							$("#clientName").focus();
						}else{
							$("#home").load("/dtw/client.do?&mn=showClient&currentpage="+curpage);
						}
					}
				})
			}
		})
	</script>
 </body>