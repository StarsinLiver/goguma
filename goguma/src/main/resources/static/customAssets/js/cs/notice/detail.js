const inputs = document.querySelectorAll(".notice-detail-td");
let address = location.pathname.split("/")[4];

load();

function load(){
	$.ajax({
		type : "get",
		url : "/cs/api/notice/detail/" + address,
		success : function(data){
			if(data != ""){
				innerFun(data);
			}
		},
		error : function(){
			alert("error!!");
		}
	});
}

function innerFun(data){
	inputs[0].textContent = data.title;
	inputs[1].textContent = data.createAt;
	inputs[2].textContent = data.content;
}