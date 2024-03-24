const inputs = document.querySelectorAll(".notice-detail-td");
const updateBtn = document.querySelector(".admin-notice-update-btn");
const deleteBtn = document.querySelector(".admin-notice-delete-btn");

let userInfo = getSession();
if (userInfo == "" || userInfo.role == "USER" || userInfo.role == "") {
	alert("잘못된 접근입니다.");
	window.history.back();
}

let address = location.pathname.split("/")[5];

load();

function load() {
	$.ajax({
		type: "get",
		url: "/cs/api/notice/detail/" + address,
		success: function(data) {
			if (data != "") {
				innerFun(data);
			}
		},
		error: function() {
			Swal.fire({
				icon: "error",
				title: "Oops...",
				text: "서버 에러가 발생하였습니다!",
			});
		}
	});
}

function innerFun(data) {
	inputs[0].textContent = data.title;
	inputs[1].textContent = data.createAt;
	inputs[2].textContent = data.content;
}

updateBtn.onclick = () => {
	location.href = "/cs/notice/update/admin/" + address;
}

deleteBtn.onclick = () => {
	if (confirm("삭제하시겠습니까?")) {
		$.ajax({
			type: "delete",
			url: "/cs/api/notice/delete/" + address,
			success: function(data) {
				if (data == true) {
					alert("삭제완료");
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
}
