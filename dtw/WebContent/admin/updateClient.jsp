<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.messdiv input{
		background-color:rgba(0,0,0,0.7);
		display:inline-block;
		border:none;
	}
</style>
<body>
	<!-- 修改客户信息 -->
	<div class="tit">
		<div class="col-md-3 col-xs-6">
			<div class="tile quick-stats">
				<h3
					style="text-align: center; background-color: rgba(0, 0, 0, 0.15); padding: 10px;">客户管理</h3>
			</div>
		</div>
	</div>
	<hr class="whiter" />
	<input type="hidden" value="client" class="searchPage" />
	<!-- 表单内容 -->
	<table border="1" id="clientUpdate" style="width: 970px; height: 350px">

		<tr class="tit-mess3">
			<td class="mess1" style="width: 150px;">客户公司抬头</td>
			<td class="mess1" style="width: 160px;">客户公司地址</td>
			<td class="mess1" style="width: 120px;">联系人</td>
			<td class="mess1" style="width: 120px;">联系人操作</td>
			<td class="mess1" style="width: 120px;">操作栏</td>
		</tr>
		<c:forEach var="client" items="${list }">
			<tr class="tit-mess3" style="height: 40px">
				<td class="mess2">${client.clientName }</td>
				<td class="mess2">${client.clientAddress }</td>

				<td class="mess2"><c:forEach var="clientcontact"
						items="${client.clientContactlist}">
						<div class="ccName">
							<a class="nameContent" contactId="${clientcontact.clientContactId }">${clientcontact.clientContactName}</a>
							<div class="messdiv">
								<p>电话：${clientcontact.clientContactTel}</p>
								<p>邮箱：${clientcontact.clientContactEmail}</p>
								<p>Q Q：${clientcontact.clientContactQQ}</p>
								<p>
									<a class="ccOperation modifyCC"  modName="${clientcontact.clientContactName }" tel="${clientcontact.clientContactTel }" email="${clientcontact.clientContactEmail }" qq="${clientcontact.clientContactQQ }">修改</a> 
									<a class="ccOperation delCC"  clientId="${client.clientId }"  contactId="${clientcontact.clientContactId }">删除</a>
								</p>
							</div>
						</div>
					</c:forEach></td>
				<td class="mess2"><a class="addCC" addId="${client.clientId }"
					addName="${client.clientName }">增加</a></td>
				<td class="mess2"><a class="updateClient"
					updateId="${client.clientId }">修改</a>&nbsp;&nbsp;<a class="delclient" modifyId="${client.clientId }">删除</a></td>
			</tr>
		</c:forEach>

		<tr id="last" style="height: 50px;">
			<td colspan="5"><a id="firstPage">首页</a><a id="prePage">上一页</a><a
				id="nextPage">下一页</a><a id="lastPage">末页</a></td>

		</tr>
	</table>
	<script type="text/javascript">
		$("#clientUpdate").on(
				"click",
				".updateClient",
				function() {
					var curpage = ${curpage};
					var clientId = $(this).attr("updateId");
					$("#home").load("client.do?&mn=gotoUpdateClient&currentpage=" +curpage+ "&clientId=" + clientId);
				});
		$("#clientUpdate").on("mouseover", ".ccName", function() {
			$(this).find(".nameContent").css("color", "yellow");
			$(this).find(".messdiv").show();
		});
		$("#clientUpdate").on("mouseout", ".ccName", function() {
			$(this).find(".nameContent").css("color", "white");
			$(this).find(".messdiv").hide();
		});

		$("#clientUpdate").on("click", "#delContact", function() {
			var delId = $(this).attr("delId");
			alert(delId);
		});
		$("#clientUpdate").on(
				"click",
				".addCC",
				function() {
					var curpage = ${curpage};
					var clientId = $(this).attr("addId");
					var clientName = $(this).attr("addName");
					$("#home").load(
							"/dtw/admin/addClientContact.jsp?clientId="
									+ clientId + "&clientName=" + clientName
									+ "&currentpage=" + curpage);
				})
		//分页
		$("#prePage").click(function() {
			var curpage = ${curpage - 1};
			if(curpage==0){
				$(".homeTip").text("已经是第一页了");
				$(".homeTip").show(200);
				setTimeout(function(){
					$(".homeTip").fadeOut(1000);
				},1000);
			}else{
				var serchContent = ${param.serchContent };
				if(serchContent!=null&&serchContent!=""){
					$("#home").load("/dtw/client.do?mn=searchClient&currentpage=" + curpage+"&serchContent="+serchContent);
				}else{
					$("#home").load("/dtw/client.do?mn=showClient&currentpage=" + curpage);
				}
			
			}
		})
		$("#nextPage").click(function() {
			var curpage = ${curpage + 1};
			var totalPage = ${totalPage }+1;
			if(totalPage==curpage){
				$(".homeTip").text("已经是最后一页了");
				$(".homeTip").show(200);
				setTimeout(function(){
					$(".homeTip").fadeOut(1000);
				},1000);
			}else{
				var serchContent = ${param.serchContent };
				if(serchContent!=null&&serchContent!=""){
					$("#home").load("/dtw/client.do?mn=searchClient&currentpage=" + curpage+"&serchContent="+serchContent);
				}else{
					$("#home").load("/dtw/client.do?mn=showClient&currentpage=" + curpage);
				}
			}
		})
		$("#firstPage").click(function() {
			var curpage = 1;
			var serchContent = ${param.serchContent };
			if(serchContent!=null&&serchContent!=""){
				$("#home").load("/dtw/client.do?mn=searchClient&currentpage=" + curpage+"&serchContent="+serchContent);
			}else{
				$("#home").load("/dtw/client.do?mn=showClient&currentpage=" + curpage);
			}
		})
		$("#lastPage").click(function() {
			var curpage = ${totalPage};
			var serchContent = ${param.serchContent };
			if(serchContent!=null&&serchContent!=""){
				$("#home").load("/dtw/client.do?mn=searchClient&currentpage=" + curpage+"&serchContent="+serchContent);
			}else{
				$("#home").load("/dtw/client.do?mn=showClient&currentpage=" + curpage);
			}
		})
		//修改联系人
		var modeName;
		$("#clientUpdate").on("click",".modifyCC",function(){
			if($("#clientUpdate").find("input").length>1){
				$(".homeTip").text("正在修改`"+modeName+"`");
				$(".homeTip").show(200);
				setTimeout(function(){
					$(".homeTip").fadeOut(1500);
				},1000);
			}else{
				modeName = $(this).attr("modName");
				var messdiv = $(this).parents(".messdiv");
				var oldContent = messdiv.children();
				var tel = $(this).attr("tel");
				var email = $(this).attr("email");
				var qq = $(this).attr("qq");
				var newContent = $('<p>电话：<input value='+tel+'></p><p>邮箱：<input class="email" value='+email+'></p><p>Q Q：<input value='+qq+'></p><p><a class="ccOperation saveCC"}">保存</a><a class="ccOperation giveUp">取消</a></p><div class="emailTip"></div>');
				messdiv.empty();
				messdiv.append(newContent);
				$(".messdiv").on("click",".giveUp",function(){
					messdiv.empty();
					messdiv.append(oldContent);
				});
		}
		});
		//保存联系人修改
		$("#clientUpdate").on("click",".saveCC",function(){
			var parent = $(this).parents(".ccName");
			var contactId = parent.find(".nameContent").attr("contactId");
			var tel = parent.find("input").eq(0).val();
			var email = parent.find("input").eq(1).val();
			var qq = parent.find("input").eq(2).val();
			
			var reg=new RegExp("^\\w+@\\w+(\\.[a-zA-Z]{2,3}){1,2}$")
			if(email!==""&&email!=null&&!reg.test(email)){
				$(".emailTip").text("邮箱格式不正确");
				$(".emailTip").fadeIn(200);
				$(".email").focus();
				setTimeout(function(){
					$(".emailTip").fadeOut(2000);
				},1000);
			}else{
				$.ajax({
					type:"post",
					url:"client.do",
					data:"mn=updateContact&contactId="+contactId+"&tel="+tel+"&email="+email+"&qq="+qq,
					success:function(res){
						if(res==1){
							var currentPage = ${curpage };
							$("#home").load("client.do?mn=showClient&currentpage="+currentPage);
						}else{
							alert("修改失败");
						}
					}
				});
			}
		});
		//删除联系人
		$("#clientUpdate").on("click",".delCC",function(){
			var clientId = $(this).attr("clientId");
			var contactId = $(this).attr("contactId");
			var thisEle = $(this);
			if(confirm("确认删除？")){
				$.ajax({
					type:"post",
					url:"client.do",
					data:"mn=deleContact&clientId="+clientId+"&contactId="+contactId,
					success:function(res){
						if(res==1){
							thisEle.parents(".ccName").remove();
						}else{
							alert("删除失败");
						}
					}
				});
			}
		});
		//删除客户
		$("#clientUpdate").on("click",".delclient",function(){
			if(confirm("确认删除？")){
				var currentPage = ${curpage };
				var clientId = $(this).attr("modifyId");
				$.ajax({
					url:"client.do",
					type:"post",
					data:"mn=delclient&clientId="+clientId,
					success:function(res){
						if(res==1){
							$(".homeTip").text("删除成功！");
							$(".homeTip").show(200);
							$("#home").load("client.do?mn=showClient&currentpage="+currentPage);
							setTimeout(function(){
								$(".homeTip").fadeOut(1500);
							},1500);
						}else{
							alert("删除失败");
						}
					}
				});
			}
		})
	</script>
</body>