<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<body>
		  <!-- 添加供应商 -->
                <div class="tit">
                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats">
                            <h3 style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">添加供应商</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
            <!-- 表单内容 -->
        <form action="aaa" method="post" style="position:relative;top:50px">
            <div id="">
            	<div id="" class="tit-mess">
            		<span class="mess">供&nbsp;应&nbsp;商</span>
            		<input id="supplierName" class="inpu" name="supplierName" placeholder="公司抬头" /><span style="margin-left: 10px;">*</span>
            		<p id="nameTip" class="tip"></p>
            	</div> 
            	<div class="tit-mess">
            		<span class="mess">地&nbsp;&nbsp;&nbsp;址</span>
 				 	<textarea id="supplierAddress" class="inpu" style="height: 50px;position:relative;top:18px" name="supplierAddress" placeholder="公司地址" /></textarea><span style="margin-left: 10px;">*</span>
 					<p id="addressTip" class="tip" style="margin-top:8px;"></p>
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
			$("#supplierName").focus();
		});
		$("#addSub").click(function(){
			$(".tip").text("");
			
			var supplierName = $("#supplierName").val();
			var supplierAddress = $("#supplierAddress").val();
			if(supplierName==""||supplierName==null){
				$("#nameTip").text("公司名不能为空");
				$("#supplierName").focus();
			}else if(supplierAddress==""||supplierAddress==null){
				$("#addressTip").text("地址不能为空");
				$("#supplierAddress").focus();
			}else{
				$.ajax({
					type:"post",
					url:"addSupplier",
					data:"supplierName="+supplierName+"&supplierAddress="+supplierAddress,
					async:true,
					success:function(res){
						if(res==0){
							$("#nameTip").text("公司名已经存在");
							$("#supplierName").focus();
						}else if(res==2){
							alert("添加失败");
						}else if(res==1){
							$("#home").load("showSupplier");
						}
					}
				})
			}
		})
	</script>
 </body>