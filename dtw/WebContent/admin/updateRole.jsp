<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<body>
		<form action="aaa" method="post">
			<!-- 修改职位 -->
			 <div class="tit">
                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats">
                            <h3  style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">修改职位</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
			<!-- 表单内容 -->
			<div id="" class="tit-mess">
				<span class="mess">姓&nbsp;&nbsp;&nbsp;名</span>
				<input id="userName" class="inpu" name="userName" readonly="readonly"/>
				<p id="nameTip" class="tip"></p>
			</div>
			<div id="" class="tit-mess">
				<span class="mess">角&nbsp;&nbsp;&nbsp;色 </span>
				<select id="userSex" class="inpu" name="userSex" style="width: 130px;">
					<option value="管理员">管理员</option>
					<option value="主管" selected="selected">主管</option>
					<option value="普通员工">普通员工</option>
				</select>
			</div>
			<div id="" class="tit-mess">
				<input id="addSub" class="mess" type="button" value="确认修改" />
				<input id="addRes" class="mess" type="button" value="放弃修改" />
			</div>
		</div>
		</form>
		<script type="text/javascript">
			$("#addRes").click(function(){
				$("#home").load("/dtw/admin/updateUser.jsp");
			});
		</script>
	</body>