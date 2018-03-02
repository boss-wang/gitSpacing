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
</style>

	
			<div class="index-title">
				<a href="" title="下单">下单</a>
			</div>
			<div class="cont">
				<form action="" method="">
					<div class="tit-mess">
						<span class="mess">发货时间</span>
						<input class="inpu Wdate" name="" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" />
						<span class="mess">发货地点</span> <input class="inpu" name=""
							placeholder="发货地点" />
					</div>
					<div class="tit-mess" >
						<span class="mess">目&nbsp;&nbsp;的&nbsp;&nbsp;港</span> <input
							class="inpu" name="" placeholder="目的港" /> <span class="mess">货物件数</span>
						<input class="inpu" name="" placeholder="货物件数" />
					</div>
					<div class="tit-mess" >
						<span class="mess">货物重量</span> <input class="inpu" name=""
							placeholder="货物重量" /> <span class="mess">货物体积</span> <input
							class="inpu" name="" placeholder="货物体积" />
					</div>
					<div class="tit-mess">
						<span class="mess">贸易方式</span> <select class="inpu" name="">
							<option value="1">CIF</option>
							<option value="2">FOB</option>
							<option value="3">EXW</option>
							<option value="4">DDU</option>
							<option value="5">DDP</option>
							<option value="6">DAP</option>
						</select> <span class="mess">联&nbsp;&nbsp;系&nbsp;&nbsp;人</span> <select
							class="inpu" name="">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</select>
					</div>
					<div class="tit-mess">
						<input id="addSub" class="mess" type="button" value="确认下单" /> <input
							id="addRes" class="mess" type="reset" value="重新填写" />
					</div>
				</form>
			</div>

	<!--about end-->
	

<script type="text/javascript" src="My97DatePicker/My97DatePicker/WdatePicker.js"></script>
