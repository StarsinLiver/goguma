const title = document.querySelector(".cs-notice--input");
const content = document.querySelector(".cs-notice--textarea");
const btn = document.querySelector(".cs-notice--update-btn");

let userInfo = getSession();
if(userInfo == "" || userInfo.role == "USER" || userInfo.role == ""){
	alert("잘못된 접근입니다.");
	//location.href = "/";
}

let address = location.pathname.split("/")[5];

load();
function load(){
	$.ajax({
		type : "get",
		url : "/cs/api/notice/detail/" + address,
		success : function(data){
			if(data != ""){
				console.log(data);
				title.value = data.title;
				content.value = data.content;
			}
		},
		error : function(){
			Swal.fire({
			icon: "error",
			title: "Oops...",
			text: "서버 에러가 발생하였습니다!",
		});
		}
	});
}

btn.onclick = () => {
	if(title.value == ""){
		Swal.fire({
			icon: "error",
			title: "Oops...",
			text: "제목을 입력해 주세요!",
		});
		title.focus();
		return;
	}else if(content.value == ""){
		Swal.fire({
			icon: "error",
			title: "Oops...",
			text: "내용을 입력해 주세요!",
		});
		content.focus();
		return;
	}
	$.ajax({
		type : "put",
		url : "/cs/api/notice/update",
		data : {
			title : title.value,
			content : content.value,
			id : address
		},
		success : function(data){
			if(data == true){
				alert("수정되었습니다.");
				location.href = "/admin/notice";
			}
		},
		error : function(){
			Swal.fire({
			icon: "error",
			title: "Oops...",
			text: "서버 에러가 발생하였습니다!",
		});
		}
	});
}