const title = document.querySelector(".qna-write-input");
const content = document.querySelector(".qna-write-textarea");
const btn = document.querySelector(".qna-write-insert-btn");


let userInfo = getSession();

if (userInfo == "" || userInfo.role == "USER" || userInfo.role == "") {
	alert("잘못된 접근입니다.");
	location.href = "/";
}

btn.onclick = () => {
	if (title.value == "") {
		Swal.fire({
			icon: "error",
			title: "Oops...",
			text: "제목을 입력해주세요!",
		});
		title.focus();
		return;
	} else if (content.value == "") {
		Swal.fire({
			icon: "error",
			title: "Oops...",
			text: "내용을 입력해주세요!",
		});
		content.focus();
		return;
	}
	$.ajax({
		type: "post",
		url: "/cs/api/faq/write",
		data: {
			uId: userInfo.uid,
			title: title.value,
			content: content.value
		},
		success: function(data) {
			if (data == true) {
				alert("등록완료!");
				location.href = "/admin/faq";
			}
		},
		error: function() {
			Swal.fire({
			icon: "error",
			title: "Oops...",
			text: "서버 에러가 발생하였습니다!",
		});
		}
	})
}