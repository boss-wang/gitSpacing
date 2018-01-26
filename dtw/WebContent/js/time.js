function getdate() {
	var m = new Date();
	n = document.getElementById("time");
	h=document.getElementById("second");
	var  hour=m.getHours();
	var min=m.getMinutes();
	if(m.getHours()<10){
		hour="0"+m.getHours(); 
	}
	if(min<10){
		min="0"+m.getMinutes();
	}
	n.innerText = m.getFullYear() + "-" + m.getMonth() + 1 + "-" + m.getDate() + " " + hour+ ":" + min;
	if(m.getSeconds()<10){
		h.innerText=":0"+m.getSeconds();
	}else{
		h.innerText=":"+m.getSeconds();
	}
	
	
}

flog = setInterval("getdate()", 1000)