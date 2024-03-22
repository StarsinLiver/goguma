const onclickMasterAutorityChange = (userId) => {
	if(!confirm('마스터 권한을 양도하시겠습니까?')) return false;
	
	
	console.log(userId);
	
	let data = {
		userId : userId	
	}
	
	// 권한 양도
	$.ajax({
		url : "/admin/authority-master" ,
		type : "put" ,
		data : data ,
		success : function (data) {
			console.log(data);
			window.location.href="/logout";
		} , error : function (error) {
			console.log(error);
		}
	})// end of ajax
	
}