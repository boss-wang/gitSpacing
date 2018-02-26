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
	<table id="tabhead">
		<% 
		Object obj= request.getAttribute("size");
		int m = (Integer)obj;
		int row=0;
		if(m%3==0){
			row=m/3;
		}else if(m%3!=0){
			row=m/3+1;
		}
		for(int i =0;i<row;i++){
			%>
			<tr>
			
			<c:forEach  var="headsc"  items="${list }"  begin="<%=i*3 %>" end="<%=i*3+2 %>" >
			<td><img alt="" src="${headsc.picturePath }" picId="${headsc.id }"></td>
			</c:forEach>
			
			</tr>
			<%
		}
		%>

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
		var userId =${user.userId};
			if(window.FileReader){
				var fr= new FileReader();
				fr.readAsDataURL(this.files[0]);
				
				fr.onloadend=(function(e){
					$.ajax({
					url:"user.do?mn=sendPic",
					type:"post",
					data:"imagedate="+e.target.result+"&userId="+userId,
					success:function(res){
						if(res!=1){
							$("#headpics").hide();
							$(".homeTip").text("上传失败,图片格式不兼容");
							$(".homeTip").show(200);
							setTimeout(function(){
								$(".homeTip").fadeOut(1000);
							},1000);
						}else if(res==1){
							$("#headpics").hide();
							$("#profile-menu").click();
							
						}
					}
					})
				})
				
			}else{
				$("#headpics").hide();
				$(".homeTip").text("不支持此文件类型");
				$(".homeTip").show(200);
				setTimeout(function(){
					$(".homeTip").fadeOut(1000);
				},1000);
			}
		})
</script>