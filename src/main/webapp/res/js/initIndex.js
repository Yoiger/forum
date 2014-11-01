/**
*初始化框架时使用的js，包括日期、ajax登陆和一些跳转
*/
function time() {
		var t = document.getElementById("time");
		var d = new Date();
		var hour = d.getHours();
		var minute = d.getMinutes();
		var second = d.getSeconds();
		if(hour < 10)
			hour = "0" + hour;
		if(minute <10)
			minute = "0" + minute;
		if(second < 10)
			second = "0" + second;
		var time = (d.getMonth()+1) +"月" +d.getDate() + "日 " +hour + ":"+ minute +":" + second;
		t.innerHTML=time;
		setTimeout('time()', 1000);
	}

function toRegister() {
	jQuery('#myModal').modal('toggle');
}

function toPost(enabled) {
	if(enabled == 0) {
		alert("您已被管理员屏蔽，暂时无法发帖回帖！");
	}
	else {
		location.href="${path}/toPost";
	}
}

