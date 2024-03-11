const inputs = document.querySelectorAll(".inputs");
const btn = document.querySelector(".emoji--upload-btn");
const formData = new FormData();

let fileValue = "";
const fileArray = new Array();
inputs[2].onchange = (event) => {
	for(let i = 0; i < event.target.files.length; i++){
		if(event.target.files[i].size > 5242880){ // 5 mb 까지만 가능
			alert("첨부파일은 5mb 이하만 가능합니다.");
			inputs[2].value = "";
			return;
		}
		
		const reader = new FileReader();
        
        reader.readAsDataURL(event.target.files[i]);
        reader.onload = () => {
        	fileValue = event.target.files[i];
        	fileArray.push(fileValue);
        }
	}
}

btn.onclick = () => {
	if(inputs[0].value == ""){
		alert("대표 이름을 입력해주세요!");
		inputs[0].focus();
		return;
	}else if(inputs[1].value == 0){
		alert("가격을 입력해주세요!");
		inputs[1].focus();
		return;
	}else if(inputs[2].value == ""){
		alert("파일을 첨부해 주세요!");
		inputs[2].focus();
		return;
	}
	const obj = {
		name : inputs[0].value,
		price : inputs[1].value
	}
	formData.append("obj", new Blob([JSON.stringify(obj)], {type: "application/json"}));
	formData.append("file", new Blob([JSON.stringify(fileArray)], {type: "application/json"}));
	
	$.ajax({
		type : "post",
		url : "/emoji/api/upload",
		encType : "multipart/form-data",
		processData : false,
		contentType : false,
		data : formData,
		success : function(data){
			if(data == true){
				alert("업로드가 완료되었습니다.");
				//location.href = "/";
			}else{
				alert("업로드 실패");
			}
		},
		error : function(){
			alert("에러");
		}
	});
}







