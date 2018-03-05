<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
.mess {
	display: inline-block;
	line-height: 30px;
	height: 30px;
	width: 100px;
	text-align: center;
	margin-left:20px;
}

.inpu {
	background: rgba(0, 0, 0, 0.2);
	margin-left: 0px;
	text-indent: 10px;
	height: 30px;
	width: 240px;
	border: 1px solid rgba(0, 0, 0, 0.35);
}
#weight{
	margin-left: 4px;
}

.tit-mess {
	padding-bottom:20px;
	text-align:center;
}
#status1{
    position: absolute;
    top: 898px;
    left: 439px;
    color: red;
    font-size: 13px;
}
#status3{
position: absolute;
    top: 842px;
    right: 483px;
    color: red;
    font-size: 13px;
}
#status2{
    position: absolute;
    top: 897px;
    right: 483px;
    color: red;
    font-size: 13px;
}
.termsDiv{
	display:none;
	left:10px;
	top:-80px;
	font-size:14px;
	line-height:20px;
	height:80px;
	width:700px;
	border-radius:8px;
	position:absolute;
	padding:0px 10px;
	text-align:left;
	background:rgba(216,166,143,0.9);
}
.termsTip{
	left:345px;
	top:3px;
	border-radius:8px;
	position:absolute;
	cursor:pointer;
}
</style>

	<body>
			<div class="index-title">
				<a  title="下单">下单</a>
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
							placeholder="货物重量单位kg" /> <span class="mess">货物体积</span><span id="status2"></span> <input
							class="inpu"   required="required" id="volume" placeholder="货物体积m³" />
					</div>
					<div class="tit-mess">
						
						
						<div class="mess" style="position:relative">贸易方式
							<img src="img/wenhao.jpg" width="25px" class="termsTip"></img>
							<div class="termsDiv"></div>
						</div>
						<select class="inpu" id="typetrading">
							<c:forEach var="terms" items="${termsList }">
								<option value="${terms.id }">${terms.code }</option>
							</c:forEach>
						</select> <span class="mess">联&nbsp;&nbsp;系&nbsp;&nbsp;人</span> 
						<select class="inpu" id="contact">
							<c:forEach var="clientcontact" items="${clientcontactList }">
								<option value="${clientcontact.clientContactId }">${clientcontact.clientContactName }</option>
							</c:forEach>
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
	});
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
	//下单
	$("form").submit(function(){
		var departDate= $("#departDate").val();
		var loadingPort=$("#loadingPort").val();
		var destination=$("#destination").val();
		var cargoPiece=$("#cargoPiece").val();
		var weight=$("#weight").val();
		var volume=$("#volume").val();
		var typetrading=$("#typetrading").val();
		var contactId=$("#contact").val();
		var customerId =${customer.id};
		if(reg.test(weight)&&reg.test(volume)&&reg2.test(cargoPiece)){
			$.ajax({
				url:"custorder.do?mn=addCustomerOrder",
				data:"departDate="+departDate+"&loadingPort="+loadingPort+"&destination="+destination+"&cargoPiece="+cargoPiece+"&weight="+weight+"&volume="+volume+"&typetrading="+typetrading+"&contactId="+contactId+"&customerId="+customerId,
				type:"post",
				success:function(res){
					if(res=='true'){
						$("#homeDiv").load("custorder.do","mn=showCustomerOrdersByClientId");
					}
				}
			});
		}
		return false;
	});
	//贸易术语提示
	$(".termsTip").hover(function(){
		var termsId = $("#typetrading").val();
		var txt="";
		var id="";
		<c:forEach var="terms" items="${termsList }">
			id="${terms.id }";
			if(termsId==id){
				txt="${terms.name }"+"——"+"${terms.description}";
			}
		</c:forEach>
		$(".termsDiv").text(txt);
		$(".termsDiv").show();
	},function(){
		$(".termsDiv").hide();
	});
</script>
