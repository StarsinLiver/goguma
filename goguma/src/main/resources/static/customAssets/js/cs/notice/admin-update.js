const title = document.querySelector(".cs-notice--input");
const content = document.querySelector(".cs-notice--textarea");
const btn = document.querySelector(".cs-notice--insert-btn");

btn.onclick = () => {
	if(title.value == ""){
		alert("제목을 입력해주세요!");
		title.focus();
		return;
	}else if(content.value == ""){
		alert("내용을 입력해주세요!");
		content.focus();
		return;
	}
	$.ajax({
		type : "post",
		url : "/cs/api/notice/write",
		data : {
			title : title.value,
			content : content.value
		},
		success : function(data){
			if(data == true){
				alert("등록되었습니다.");
			}
		},
		error : function(){
			alert("error!!");
		}
	});
}