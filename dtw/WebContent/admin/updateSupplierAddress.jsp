<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<body>
		  <!-- 修改供应商 -->
                <div class="tit">
                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats">
                            <h3 style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">修改供应商</h3>
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
 					<p id="addressTip" class="tip"></p>
            	</div> 
				<div id="" class="tit-mess">
					<input id="addSub" class="mess" type="button" value="确认修改"/>
					<input id="addRes" class="mess" type="button" value="放弃修改"/>
				</div>
            </div>
        </form>  
        
	<script type="text/javascript">
		$("#addRes").click(function(){
			$("#home").load("/dtw/admin/updateSupplier.jsp");
		});
		$("#addSub").click(function(){
			$(".tip").text("");
			
			var supplierName = $("#supplierName").val();
			var supplierAddress = $("#supplierAddress").val();
			if(supplierName==""||supplierName==null){
				$("#nameTip").text("公司名不能为空");
				$("#supplierName").focus();
			}else if(supplierAddress==""||supplierAddress==null){
				$("#AddressTip").text("地址不能为空");
				$("#supplierAddress").focus();
			}else{
				$.ajax({
					type:"post",
					url:"",
					data:"supplierName="+supplierName+"&supplierAddress="+supplierAddress,
					async:true,
					success:function(res){
						if(res==0){
							$("#nameTip").text("公司名已经存在");
							$("#supplierName").focus();
						}else{
							$("#home").load("");
						}
					}
				})
			}
		})
	</script>
 </body>