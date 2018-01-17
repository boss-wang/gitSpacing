var cat = {
	goods:[{
		count:2,
		price:100,
		smallTotalPrice:0
	},{
		count:3,
		price:200,
		smallTotalPrice:0
	},{
		count:1,
		price:500,
		smallTotalPrice:0
	}],
	totalPrice:0,
	totalCount:0
}
function reflush(){
	var goods = cat.goods;
	var $lis=$(".shop li");
	cat.totalPrice=0;
	cat.totalCount=0;
	for(var i=0;i<$lis.length;i++){
		var good=goods[i];
		good.smallTotalPrice=good.count*good.price;
		cat.totalPrice+=good.smallTotalPrice;
		cat.totalCount+=good.count;
		$($lis[i]).find(".J_inputCount").val(good.count);
		$($lis[i]).find(".J_smallTotalPrice").text(good.smallTotalPrice);
	}
	$(".J_totalPrice").text("¥"+cat.totalPrice);
	$(".J_totalCount").text("("+cat.totalCount+")");
}

$(".J_btnAddCount").click(function(){
	var $li = $(this).parents("li");
	var index = $(".shop li").index($li);
	cat.goods[index].count++;
	reflush();
});

$(".J_btnDelCount").click(function(){
	var $li = $(this).parents("li");
	var index = $(".shop li").index($li);
	if(cat.goods[index].count<=1){
		var flag=confirm("确认要删除吗？");
		if(flag){
			cat.goods.splice(index,1);
			$li.remove();
			reflush();
		}
	}else{
		cat.goods[index].count--;
		reflush();
	}
});

$(".J_btnDelete").click(function(){
	var $li = $(this).parents("li");
	var index = $(".shop li").index($li);
	var flag=confirm("确认要删除吗？");
		if(flag){
			cat.goods.splice(index,1);
			$li.remove();
			reflush();
		}
});

function gundong(){
	$("#express")[0].scrollTop++;
	var height=$("#express").height();
	if($("#express")[0].scrollTop>=height){
		$("#express")[0].scrollTop=0;
	}
}
var stop=window.setInterval("gundong()",50);

$("#express").hover(function(){
	clearInterval(stop);
},function(){
	stop=window.setInterval("gundong()",50);
})

$(".fj").hover(function(){
	$(this).next(".zj").show();
	$(this).addClass("nuw");
},function(){
	$(this).next(".zj").hide();
	$(this).removeClass("nuw");
})
var stop2;
var index=0;
function tab(index){
	var $num=$(".num li");
	$($num[index]).addClass("active");
	$($num[index]).siblings().removeClass("active");
	$($(".slide_box li")[index]).show(1000);
	$($(".slide_box li")[index]).siblings().hide(1000);
}

$(".num li").hover(function(){
	index=$(this).index();
	tab(index);
	window.clearInterval(stop2);
},function(){
	stop2=window.setInterval("aut()",2000);
})


function aut(){
	tab(index);
	index++;
	if(index>=3)	index=0;
}
stop2=window.setInterval("aut()",2000);