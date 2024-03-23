const onclickMasterAutorityChange = (userId) => {
	Swal.fire({
		title: "두 번 확인해요!",
		text: "정말로 마스터 권한을 양도하시겠습니까?",
		icon: "warning",
		showCancelButton: true,
		confirmButtonColor: "#3085d6",
		cancelButtonColor: "#d33",
		confirmButtonText: "네 양도할래요!"
	}).then((result) => {
		if (result.isConfirmed) {
			let data = {
				userId: userId
			}

			// 권한 양도
			$.ajax({
				url: "/admin/authority-master",
				type: "put",
				data: data,
				success: function(data) {
					console.log(data);
					window.location.href = "/logout";
				}, error: function(error) {
					console.log(error);
				}
			})// end of ajax
		}
	});
}

