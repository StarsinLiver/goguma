const inputs = document.querySelectorAll(".notice-detail-td");
const updateBtn = document.querySelector(".admin-notice-update-btn");
const deleteBtn = document.querySelector(".admin-notice-delete-btn");

let userInfo = getSession();


let address = location.pathname.split("/")[5];

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

updateBtn.onclick = () => {
	location.href = "/cs/notice/update/admin/" + address;
}

deleteBtn.onclick = () => {
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			type : "delete",
			url : "/"
		})
	}
}
