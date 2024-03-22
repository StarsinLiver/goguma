const deleteBtn = document.querySelector(".admin-notice-delete-btn");

const onclickDelete = (id) => {
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			type : "delete",
			url : "/cs/api/notice/delete/" + id,
			success : function(data){
				if(data == true){
					alert("삭제완료");
					location.href = "/admin/notice";
				}
			},
			error : function(){
				alert("에러");
			}
		})
	}
}
