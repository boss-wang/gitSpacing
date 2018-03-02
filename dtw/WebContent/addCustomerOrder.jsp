<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<style type="text/css">
.mess {
	display: inline-block;
	line-height: 30px;
	height: 30px;
	width: 100px;
	text-align: center;
}

.inpu {
	background: rgba(0, 0, 0, 0.2);
	margin-left: 0px;
	text-indent: 10px;
	height: 30px;
	width: 240px;
	border: 1px solid rgba(0, 0, 0, 0.35);
}

.tit-mess {
	padding-bottom:20px;
	text-align:center;
}
#status1{
position:absolute;
top:947px;
color:red;
}
#status3{
position:absolute;
top:890px;
color:red;
}
#status2{
position:absolute;
top:947px;
color:red;
}
</style>

	<body>
			<div class="index-title">
				<a href="" title="下单">下单</a>
			</div>
			<div class="cont">
				<form action="" method="">
					<div class="tit-mess">
						<span class="mess">发货时间</span>
						<input class="inpu Wdate" id="departDate" required="required" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" />
						<span class="mess">发货地点</span> <input class="inpu" id="loadingPort"  required="required"
							placeholder="发货地点" />
					</div>
					<div class="tit-mess" >
						<span class="mess">目&nbsp;&nbsp;的&nbsp;&nbsp;港</span> <input
							class="inpu" id="destination"  required="required"  placeholder="目的港" /> <span class="mess" >货物件数</span><span id="status3"></span>
						<input class="inpu"  required="required" id="cargoPiece" placeholder="货物件数" />
					</div>
					<div class="tit-mess" >
						<span class="mess">货物重量</span><span id="status1"></span><input class="inpu"  required="required"  id="weight"
							placeholder="货物重量" /> <span class="mess">货物体积</span><span id="status2"></span> <input
							class="inpu"   required="required" id="volume" placeholder="货物体积" />
					</div>
					<div class="tit-mess">
						<span class="mess">贸易方式</span> <select class="inpu" id="typetrading">
							<option value="1">CIF</option>
							<option value="2">FOB</option>
							<option value="3">EXW</option>
							<option value="4">DDU</option>
							<option value="5">DDP</option>
							<option value="6">DAP</option>
						</select> <span class="mess">联&nbsp;&nbsp;系&nbsp;&nbsp;人</span> <select
							class="inpu" id="contact">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
					</div>
					<div class="tit-mess">
						<input id="addSub" class="mess" type="submit" value="确认下单" /> <input
							id="addRes" class="mess" type="reset" value="重新填写" />
					</div>
				</form>
			</div>

	<!--about end-->
	</body>

<script type="text/javascript" src="My97DatePicker/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
	var reg=/^\d*(\.\d*){0,1}$/;
    var reg2 =/^\d+$/;
	$("#weight").blur(function(){
		var weight=$("#weight").val();
		if(!reg.test(weight)){
			$("#status1").text("格式错误");
		}else{
			$("#status1").text("");
		}
	})
	$("#volume").blur(function(){
		var volume=$("#volume").val();
		if(!reg.test(volume)){
		
			$("#status2").text("格式错误");
		}else{
			$("#status2").text("");
		}
	});
	$("#cargoPiece").blur(function(){
		var cargoPiece=$("#cargoPiece").val();
		if(!reg2.test(cargoPiece)){
			
			$("#status3").text("格式错误");
		}else{
			$("#status3").text("");
		}
	});
	$("form").submit(function(){
		var departDate= $("#departDate").val();
		var loadingPort=$("#loadingPort").val();
		var destination=$("#destination").val();
		var cargoPiece=$("#cargoPiece").val();
		var weight=$("#weight").val();
		var volume=$("#volume").val();
		var typetrading=$("#typetrading").val();
		var contact=$("#contact").val();
		var customerId =${customer.id};
		if(reg.test(weight)&&reg.test(volume)&&reg2.test(cargoPiece)){
			alert(customerId);
			$.ajax({
				url:"",
				data:"",
				type:"",
				success:function(res){
					
				}
			})
		}
		return false;
	})
</script>
