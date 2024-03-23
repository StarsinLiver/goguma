const deleteBtn = document.querySelector(".admin-notice-delete-btn");

const onclickDelete = (id) => {

	Swal.fire({
		title: "삭제 요청?",
		text: "정말로 삭제하시겠습니까?!",
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#3085d6",
		cancelButtonColor: "#d33",
		confirmButtonText: "Yes, delete it!"
	}).then((result) => {
		if (result.isConfirmed) {

			$.ajax({
				type: "delete",
				url: "/cs/api/notice/delete/" + id,
				success: function(data) {
					if (data == true) {
						location.href = "/admin/notice";
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
	});
}
