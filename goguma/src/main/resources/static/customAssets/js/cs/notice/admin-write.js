const title = document.querySelector(".cs-notice--input");
const content = document.querySelector(".cs-notice--textarea");
const btn = document.querySelector(".cs-notice--insert-btn");
let userInfo = getSession();

if(userInfo == "" || userInfo.role == "USER" || userInfo.role == ""){
	alert("잘못된 접근입니다.");
	location.href = "/";
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
		type : "post",
		url : "/cs/api/notice/write",
		data : {
			title : title.value,
			content : content.value,
			uId : userInfo.uId
		},
		success : function(data){
			if(data == true){
				alert("등록되었습니다.");
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