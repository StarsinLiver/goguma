const priceDiv = document.querySelectorAll(".card-price");
const modal = document.getElementById("my-modal");
const close = document.getElementsByClassName("close")[0];
const btn = document.getElementsByClassName("btn-confirm")[0];
let user = getSession();

// 챗 리스트 생성
function openChatList() {
	let pid = btn.dataset.value;
	console.log(pid);


	$.ajax({
		type: 'get',
		url: '/user/chat/product?pId=' + pid,
		headers: {
			"Content-Type": "application/json"
		},
		success: function(result) {
			console.log(result);

			displayUserList(result, pid);

		},
		error: function(request, status, error) {
			console.log(error);
		}
	});
	// 모달창 보여주기
	modal.style.display = "block";
}

// 모달창 나가기
function deleteClose() {
	modal.style.display = "none";
}

// 상품 구매자 목록 화면에 뿌리기
function displayUserList(result, pid) {
	let tr = document.querySelector("#user--list");
	for (let i = 0; i < result.length; i++) {
		tr.innerHTML += `<tr><td>${result[i].name}</td>
    			<td><button type="button" class="btn btn-warning" onclick="selectedUser(${result[i].uid} , ${pid})">거래 완료</button></td>
    			</tr>`
	}
}

const selectedUser = (userId , pid) => {
	
	if(!confirm('거래 완료를 진행하시겠습니까?')) 
		return false;
	console.log(userId);
	console.log(user);
	console.log(pid);
	$.ajax({
		url: "/user/chat/product/selected",
		method : "post",
		data: {
			userId : userId ,
			hostId : user.uid ,
			pId : pid
		},
		//dataType: "json",
		success: function(data) {
			console.log(data);
			alert("완료되었습니다.")
			window.location.reload();
		}, error: function(xhr) {
			if(xhr.status == 500) {
				alert("서버 에러가 발생하였습니다.");
			}
			window.location.reload();
		}
	})
}