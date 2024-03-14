function getSession(){
	let userData = "";
	$.ajax({
		type : "get",
		url : "/session",
		async : false,
		success : function(data){
			if(data != null){
				userData = data;
			}else{
				console.log("유저정보 없음");
			}
		},
		error : function(){
			alert("에러");
		}
	});
	return userData;
}