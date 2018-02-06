<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<body>
		  <!-- 添加客户 -->
                <div class="tit">
                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats">
                            <h3 style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">添加客户</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
            <!-- 表单内容 -->
        <form action="aaa" method="post" style="position:relative;top:50px">
            <div id="">
            	<div id="" class="tit-mess">
            		<span class="mess">客&nbsp;&nbsp;&nbsp;户</span>
            		<input id="clientName" class="inpu" name="clientName" placeholder="公司抬头" /><span style="margin-left: 10px;">*</span>
            		<p id="nameTip" class="tip"></p>
            	</div> 
            	<div class="tit-mess">
            		<span class="mess">地&nbsp;&nbsp;&nbsp;址</span>
 				 	<textarea id="clientAddress" class="inpu" style="height: 50px;position:relative;top:18px" name="clientAddress" placeholder="公司地址" /></textarea><span style="margin-left: 10px;">*</span>
 					<p id="addressTip" class="tip"></p>
            	</div> 
				<div id="" class="tit-mess">
					<input id="addSub" class="mess" type="button" value="确认添加"/>
					<input id="addRes" class="mess" type="reset" value="重新填写"/>
				</div>
            </div>
        </form>  
        
	<script type="text/javascript">
		$("#addRes").click(function(){
			$(".tip").text("");
			$("#clientName").focus();
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
				$.ajax({
					type:"post",
					url:"client.do",
					data:"clientName="+clientName+"&clientAddress="+clientAddress+"&mn=addClient",
					async:true,
					success:function(res){
						if(res==0){
							$("#nameTip").text("公司名已经存在");
							$("#clientName").focus();
						}else{
							$("#home").load("client.do?mn=showClient");
						}
					}
				})
			}
		})
	</script>
 </body>