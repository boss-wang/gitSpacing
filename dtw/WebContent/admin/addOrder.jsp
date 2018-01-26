<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body  style="background-color: rgba(0,0,0,0);">
		<!-- 添加订单 -->
		<div class="tit">
                    <div class="col-md-3 col-xs-6">
                        <div class="tile quick-stats">
                            <h3  style="text-align: center;  background-color: rgba(0,0,0,0.15); padding: 10px; ">添加订单</h3>
                    	</div>
					</div>
                </div>
                <hr class="whiter"/>
		<!-- 表单内容 -->
		<form action="aaa" method="post">
			<div >
				<div class="line">
					<div  class="tit-mess" style="display: inline-block;">
						<span class="mess">客&nbsp;&nbsp;&nbsp;&nbsp;户</span>
						<input id="client" class="inpu" name="clientId" placeholder="客户公司抬头"/>
						<p  class="tip"> </p>
					</div>
						<span class="mess"style="display: inline-block; position: absolute; left: 450px;">业务编号</span>
						<input  class="inpu" type="password" name="orderNo" placeholder="业务编号" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
						<p  class="tip"></p>
				</div>
				<div class="line">
					<div  class="tit-mess" style="display: inline-block;">
						<span class="mess">系&nbsp;&nbsp;统&nbsp;&nbsp;号</span>
						<input class="inpu" name="systemNo" placeholder="系统号" />
						<p  class="tip"></p>
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">主&nbsp;&nbsp;单&nbsp;&nbsp;号</span>
						<input class="inpu" name="mawbNo" placeholder="主单号" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
						<p class="tip"></p>
				</div>
				<div class="line">
					<div  class="tit-mess" style="display: inline-block;">
						<span class="mess">分&nbsp;&nbsp;单&nbsp;&nbsp;号</span>
						<input class="inpu" name="hawbNo" placeholder="分单号" />
						<p  class="tip"></p>
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">航&nbsp;&nbsp;班&nbsp;&nbsp;号</span>
						<input  class="inpu" name="flightNo" placeholder="航班号" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
						<p  class="tip"></p>
				</div>
				<div class="line">
					<div class="tit-mess" style="display: inline-block;">
						<span class="mess">航班日期</span>
						<input  class="inpu" name="departDate" type="date" />
						<p  class="tip"></p>
					</div>				
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">到港日期</span>
						<input  class="inpu" name="arriveDate" type="date" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
						<p class="tip"></p>				
				</div>
				<div class="line">
					<div class="tit-mess" style="display: inline-block;">
						<span class="mess">目&nbsp;&nbsp;的&nbsp;&nbsp;港</span>
						<input  class="inpu" name="destination" placeholder="目的港" />
						<p  class="tip"></p>
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">货物件数</span>
						<input  class="inpu" type="cargoPiece" name="userPwd" placeholder="货物件数" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
						<p  class="tip"></p>
				</div>
				<div class="line">
					<div class="tit-mess" style="display: inline-block;">
						<span class="mess">货物重量</span>
						<input class="inpu" type="cargoWeight" name="userPwd" placeholder="货物重量" />
						<p class="tip"></p>
					</div>	
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">计费重量</span>
						<input class="inpu" type="chargeWeight" name="userPwd" placeholder="计费重量" style="display: inline-block; position: absolute; left: 854px;top: 23px;"/>
						<p class="tip"></p>
				</div>
				<div class="line">
					<div class="tit-mess" style="display: inline-block;">
						<span class="mess">货物体积</span>
						<input  class="inpu" type="cargoVolume" name="userPwd" placeholder="货物体积" />
						<p class="tip"></p>
					</div>
						<span class="mess" style="display: inline-block; position: absolute; left: 450px;">报关单状态</span>
						<select  class="inpu" name="customsNo" style="display: inline-block; position: absolute; left: 854px;top: 23px;">
							<option value="0">未退</option>
							<option value="1">已退</option>
							<option value="2">已寄</option>
						</select><span style="margin-left: 10px;display: inline-block;position: absolute;left: 1095px;top: 30px;">*</span>
				</div>
				<div class="line" style="height: 80px;">
					<div  class="tit-mess" style="display: inline-block;">
						<span class="mess">订单状态</span>
						<select  class="inpu" name="orderStatus">
							<option value="0">未操作</option>
							<option value="1">已报关</option>
							<option value="2">已起飞</option>
							<option value="3">已到港</option>
						</select><span style="margin-left: 10px;">*</span>
					</div>
					<div class="tit-mess" style="display: inline-block; position: absolute; left: 450px;">
						<span class="mess" style="position: absolute;">备注内容</span>
						<textarea class="remarks" name="remarks" style=" height:30px;"></textarea>
					</div>
				</div>
				<div  class="tit-mess"style="position: relative; left: 230px;top: 20px;">
					<input id="addSub" class="mess" type="button" value="确认添加" />
					<input id="addRes" class="mess" type="reset" value="重新填写" />
				</div>
			</div>
		</form>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
			$("#addRes").click(function() {
				$(".tip").text("");
				$("#client").focus();
			});
			$("#addSub").click(function() {
				$(".tip").text("");

			})
		</script>
	</body>