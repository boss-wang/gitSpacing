<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <style>
    #pics{
   			 width:410px;
   			 height:300px;
			overflow-y:scroll; 
		}
    .file-box{
    			text-align:center;
    			vertical-align:middle;
    			position:relative;
    			top:-7px;
    			display:inline-block;
   				  background: rgba(6,10,27,0.8);
   				 border: 1px solid rgba(0,0,0,0.2);
   					 width: 125px;
   					 height: 30px;
   				 font-size: 15px;
   				 margin-left: 50px;
   				 margin-top:10px;
    }
    .file-box:hover{
    			cursor:pointer;
   			 	background: rgba(0,0,0,0.5);
    }
    .file-btn{
    position:absolute;
    top:-10px;
    left:-50px;
    
    width:100%;
    height:100%;
	opacity: 0;
    }
     .file-btn:hover{
     cursor:pointer;
     }
    </style>
<body>
<div  id="pics">
	<table>
		<c:forEach  var="headsc"  items="${list }" varStatus="n" step="3" >
		<tr>
		<c:if test="${n.index==0 }">
		<c:forEach  var="headsc"  items="${list }" varStatus="m"  >
			
				<c:if test="${m.index==0 }">
					<td><img alt="" src="${headsc.picturePath }" picId="${headsc.id }"></td>
					</c:if>
				<c:if test="${m.index==1}">
					<td><img alt="" src="${headsc.picturePath }" picId="${headsc.id }"></td>
					</c:if>
					<c:if test="${m.index==2}">
					<td><img alt="" src="${headsc.picturePath }" picId="${headsc.id }"></td>
					</c:if>
			
		</c:forEach>
		</c:if>
		<c:if test="${n.index==3 }">
		<c:forEach  var="headsc"  items="${list }" varStatus="m"  >
			
				<c:if test="${m.index==3 }">
					<td><img alt="" src="${headsc.picturePath }" picId="${headsc.id }"></td>
					</c:if>
				<c:if test="${m.index==4}">
					<td><img alt="" src="${headsc.picturePath }" picId="${headsc.id }"></td>
					</c:if>
					<c:if test="${m.index==5}">
					<td><img alt="" src="${headsc.picturePath }" picId="${headsc.id }"></td>
					</c:if>
			
		</c:forEach>
		</c:if>
		<c:if test="${n.index==6 }">
		<c:forEach  var="headsc"  items="${list }" varStatus="m"  >
			
				<c:if test="${m.index==6 }">
					<td><img alt="" src="${headsc.picturePath }" picId="${headsc.id }"></td>
					</c:if>
				<c:if test="${m.index==7}">
					<td><img alt="" src="${headsc.picturePath }" picId="${headsc.id }"></td>
					</c:if>
					<c:if test="${m.index==8}">
					<td><img alt="" src="${headsc.picturePath }" picId="${headsc.id }"></td>
					</c:if>
			
		</c:forEach>
		</c:if>
		<c:if test="${n.index==9 }">
		<c:forEach  var="headsc"  items="${list }" varStatus="m"  >
			
				<c:if test="${m.index==9 }">
					<td><img alt="" src="${headsc.picturePath }" picId="${headsc.id }"></td>
					</c:if>
				<c:if test="${m.index==10}">
					<td><img alt="" src="${headsc.picturePath }" picId="${headsc.id }"></td>
					</c:if>
					<c:if test="${m.index==11}">
					<td><img alt="" src="${headsc.picturePath }" picId="${headsc.id }"></td>
					</c:if>
			
		</c:forEach>
		</c:if>
		</tr>
		</c:forEach>
		

	</table>
	</div>
	<table>
	<tr>
			<td >
			<div class="file-box">上传文件<input type="file" style="display: inline-block; " class="file-btn" id="sendpic"/></div>
			<input type="button" id="backhide" value="返回">
			</td>
	</tr>
	</table>
</body>
<script src="js/jquery-3.2.1.min.js" type="text/javascript" ></script>
<script >
	$("#pics").on("click","img",function(){
		var picId = $(this).attr("picId");
		var picpath =$(this).attr("src");
		var userId =${user.userId};
		if(confirm("确定修改？")){
			$.ajax({
				url:"user.do?mn=updateHeadPic",
				type:"post",
				data:"picId="+picId+"&userId="+userId+"&picpath="+picpath,
				success:function(res){
					if(res>0){
						$("#headimg").attr("src",picpath);
						$("#headpics").hide();
					}else{
						alert("修改失败");
					}
					
				}
				
			})
		}
		
	})
	
	$("#sendpic").change(function(){
			if(window.FileReader){
				var fr= new FileReader();
				fr.readAsDataURL(this.files[0]);
				
				fr.onloadend=(function(e){
					$.ajax({
					url:"",
					type:"post",
					data:"imagedate="+e.target.result,
					success:function(res){
					
					}
					})
				})
				
			}else{
				alert("浏览器不支持")
			}
		})
</script>