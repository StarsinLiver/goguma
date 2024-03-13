// AJAX GET 요청 보내기
// ajax 통신

let principal = 0;

let response = null;
document.addEventListener('DOMContentLoaded', function() {
 $.ajax({
      type : "GET",            // HTTP method type(GET, POST) 형식이다.
      url : "http://localhost:80/chat/user/room",      // 컨트롤러에서 대기중인 URL 주소이다.
       success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			console.log(res);
			if(res != 'USER_NOT_LOGIN') {
			principal = document.querySelector("#principal").value;
			for(let i = 0; i < res.length; i++) {
				subscribe(res[i].roomId);
			} // 반복문 종료
			}
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
           }
     }); // ajax 완료
});


// --------------------------------------------------- 소켓
const socket = new SockJS("http://localhost:80/ws"); // 이 부분 교체 작업 진행해야함
const stompClient = Stomp.over(socket);

stompClient.connect({}, (frame) => {
console.log("Connected to WebSocket");
console.log("Session ID: " + frame.headers["user-name"]);
}); // connect 종료
             // 연결 , 구독
const subscribe = (roomId) => {
stompClient.subscribe(`/sub/chat/${roomId}`, (message) => {
    let body = JSON.parse(message.body);
    let img = jsonImage(body);
    // 토스트 메시지
    // 새로운 div 엘리먼트를 생성합니다.
    var toastElement = document.createElement('div');
    // 클래스를 추가합니다.
    toastElement.classList.add('toast-message');

    // 토스트 메시지의 내용을 구성합니다.
    var toastContent = document.createElement('div');
    var userName = body.userName.length > 20 ? body.userName.substring(0, 17) + "..." : body.userName;
    var textContent = body.text.length > 20 ? body.text.substring(0, 17) + "..." : body.text;
    toastContent.innerHTML = "<h4><b>" + userName + "</b></h4><p>" + textContent + "</p>";

    // 생성한 엘리먼트를 토스트 메시지에 추가합니다.
    toastElement.appendChild(toastContent);

    // 이미지가 있는 경우에만 이미지를 추가합니다.
    if (img) {
        var toastImage = document.createElement('img');
        toastImage.src = img;
        toastImage.style.width = "100px";
        toastImage.style.height = "100px";
        toastImage.style.borderRadius = "50%";
        // 생성한 이미지 엘리먼트를 토스트 메시지에 추가합니다.
        toastElement.appendChild(toastImage);
    }

    // 닫기 버튼을 생성합니다.
    var closeButton = document.createElement('button');
    closeButton.innerHTML = "&times;";
    closeButton.style.border = "none";
    closeButton.style.background = "transparent";
    closeButton.style.color = "#999";
    closeButton.style.fontSize = "24px";
    closeButton.style.cursor = "pointer";
    closeButton.style.position = "absolute";
    closeButton.style.top = "10px";
    closeButton.style.right = "10px";

    // 닫기 버튼을 클릭할 때 토스트 메시지를 서서히 사라지게 합니다.
    closeButton.addEventListener('click', function() {
        var opacity = 1;
        var fadeOutInterval = setInterval(function() {
            opacity -= 0.1;
            toastElement.style.opacity = opacity;
            if (opacity <= 0) {
                clearInterval(fadeOutInterval);
                toastElement.remove();
            }
        }, 100);
    });

    // 토스트 메시지에 닫기 버튼을 추가합니다.
    toastElement.appendChild(closeButton);

    // 스타일을 추가합니다.
    toastElement.style.position = "fixed";
    toastElement.style.top = "20px";
    toastElement.style.right = "20px";
    toastElement.style.background = "#ffffff";
    toastElement.style.boxShadow = "0px 4px 8px rgba(0, 0, 0, 0.1)";
    toastElement.style.borderRadius = "10px";
    toastElement.style.padding = "20px";
    toastElement.style.zIndex = "9999";
    toastElement.style.display = "flex";
    toastElement.style.alignItems = "center";
    toastElement.style.gap = "20px";

    // 토스트 메시지를 body에 추가합니다.
    document.body.appendChild(toastElement);

    // 5초 후에 토스트 메시지를 제거합니다.
    setTimeout(function(){
        var opacity = 1;
        var fadeOutInterval = setInterval(function() {
            opacity -= 0.1;
            toastElement.style.opacity = opacity;
            if (opacity <= 0) {
                clearInterval(fadeOutInterval);
                toastElement.remove();
            }
        }, 100);
    }, 5000);
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
