let currentRoomId = 0;
function openModal(roomNumber) {
		currentRoomId = roomNumber;
		var chatRoomContent = document.getElementById("chatRoom" + roomNumber).innerHTML;
		var modalContent = document.getElementById("modalContent");
		modalContent.innerHTML = chatRoomContent;
		var modal = document.getElementById("myModal");
		modal.style.display = "block";
		// 스크롤을 항상 아래로 이동
		var modalContentElement = document.querySelector('.modal-content');
		modalContentElement.scrollTop = modalContentElement.scrollHeight;

		// 모달 바깥을 클릭하여 모달 닫기
		modal.onclick = function(event) {
			if (event.target == modal) {
				closeModal();
				currentRoomId = 0;
			}
		};
	}

	function closeModal() {
		var modal = document.getElementById("myModal");
		modal.style.display = "none";
	}
	


// --------------------------------------------------- 소켓
const socket = new SockJS("http://localhost:80/ws"); // 이 부분 교체 작업 진행해야함
const stompClient = Stomp.over(socket);

stompClient.connect({}, (frame) => {
console.log("Connected to WebSocket");
console.log("Session ID: " + frame.headers["user-name"]);


// 모든 숨겨진 방 번호 입력 필드를 선택합니다.
var hiddenInputs = document.querySelectorAll('input[type=hidden][id="chatRoomId"]');


// 각 입력 필드의 값을 가져옵니다.
hiddenInputs.forEach(function(input) {
    var chatRoomId = input.value;    
    // 여기에서 가져온 값을 사용하거나 처리할 수 있습니다.
    subscribe(chatRoomId);
});
	
}); // connect 종료
             // 연결 , 구독
const subscribe = (roomId) => {
stompClient.subscribe(`/sub/chat/${roomId}`, (message) => {
    let body = JSON.parse(message.body);
    let img = jsonImage(body);
	var room = document.querySelector(`#chatRoom${body.roomId}`)
	var res = addMessage(body , img);
//	room.innerHTML += res;
	// "beforeend" 위치에 새로운 HTML을 추가합니다.
room.insertAdjacentHTML('beforeend', res);
// 모달 업데이트
currentRoomId == 0 ? null : openModal(currentRoomId);
}); // 구독 ( subscribe ) 종료



} // 함수 종료

// 소켓 종료 함수
socket.addEventListener("close", (event) => {
    console.log("WebSocket connection closed.");
});

// 이미지
const jsonImage = (res) => {
	
	let img = res.chatMessageType == 'IMAGE'? "/images/upload/" + res.file : "/images/upload/emoji/" + res.emoji;
	return img;
}


  // 소켓으로 받은 데이터 올리기
    const addMessage = (res , img) => {
		let message = "";
		
		if(res.chatMessageType == "LEAVE") {
			message += `<div class="container text-center">
  							<div class="received_msg">
     							 <div>
         							 <span class="time_date" style="background-color: seagreen; border-radius: 10px; color: white;">` + res.userName + `님 께서 채팅방을 나갔습니다.</span>
    							 </div>
 							 </div>
						</div>
					<br/>`
			return message;
		}
		
		message = `<p>${res.userName}&nbsp;:&nbsp;${res.text}</p>`
		message += res.chatMessageType == 'TEXT'? "" : `<img src="${img}" style="width : 200px ; height : 100px;"/>`;
		message += `<p>${res.createAt}</p><br/>`
//			message += `<br/><div class="outgoing_msg"> 
//											<div class="sent_msg"><b style="text-align: right;">${res.userName}</b>`
//			// 만약 이미지가 있다면
//			message += res.chatMessageType == 'TEXT'? "" : `<img src="${img}" style="width : 200px ; height : 100px;"/>`;													
//			message +=	`<p>${res.text}</p><span class="time_date">${res.createAt}</span>
//							</div>
//						</div>`;	
		return message;
	}