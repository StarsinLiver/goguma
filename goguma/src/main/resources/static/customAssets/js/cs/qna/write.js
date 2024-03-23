const select = document.querySelector(".qna-write-select");
const options = select.querySelectorAll("option");
const title = document.querySelector(".qna-write-input");
const content = document.querySelector(".qna-write-textarea");
const btn = document.querySelector(".qna-write-insert-btn");

let userInfo = getSession();
let optionFlag = 0;

btn.onclick = () => {
	for(let i = 1; i < options.length; i++){
		if(options[i].selected == true){
			optionFlag = i;
		}
	}
	if(userInfo == ""){
		alert("로그인이 필요한 서비스 입니다.");
		location.href = "/";
	}else if(title.value == ""){
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
	}else if(optionFlag == 0){
		Swal.fire({
			icon: "error",
			title: "Oops...",
			text: "문의하실 분류를 선택해주세요!",
		});
		return;
	}
	$.ajax({
		type : "post",
		url : "/cs/api/qna/write",
		data : {
			uId : userInfo.uid,
			title : title.value,
			content : content.value,
			optionName : options[optionFlag].value
		},
		success : function(data){
			if(data == true){
				alert("등록되었습니다.");
				location.href = "/";
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

