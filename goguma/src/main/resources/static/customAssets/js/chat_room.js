// 각 채팅방 리스트 요소들을 가져옵니다.
const chatListItems = document.querySelectorAll('.chat_list');
// 채팅에 관한 클래스
let msgHistory = document.querySelector(".msg_history");
let mesgs = document.querySelector(".mesgs");
const userId = document.getElementById("userId").value;

let messageRoomId = 0;
const chatListItemsFunc = (roomId) => {
	
	    // 모든 채팅방 요소를 선택합니다.
    var chatListItems = document.querySelectorAll('.chat_list');

    // 선택된 채팅방을 나타내는 요소를 찾습니다.
    var selectedChatRoom = document.querySelector('.chat_list[data-roomid="' + roomId + '"]');

    // 모든 채팅방 요소에서 active 클래스를 제거합니다.
    chatListItems.forEach(function(item) {
        item.classList.remove('active_chat');
    });

    // 선택된 채팅방 요소에 active 클래스를 추가합니다.
    selectedChatRoom.classList.add('active_chat');
	
	
	messageRoomId = roomId;

        	// 채팅창을 표시하도록 화면 상태를 변경할 수 있습니다.
       		// ajax 통신
            $.ajax({
                type : "GET",            // HTTP method type(GET, POST) 형식이다.
                url : "http://localhost/chat/message/" + roomId,      // 컨트롤러에서 대기중인 URL 주소이다.
                success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    displayChat(res);
                },
                error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    alert("통신 실패.")
                }
            }); // ajax 완료
		   
		   // stomp 연결
		   connectStomp(roomId);
}


// 처음 채팅 화면에 뿌리기
const displayChat = (res) => {
	// 메세지 부분 디스플레이
	mesgs.style.display = 'block';

	let message = "";
	for(var i = 0; i < res.length; i++) {
		// 메시지 저장하기
		message += addMessage(res[i] , "all");
	}
	
	//  채팅 넣기
	msgHistory.innerHTML = message;
	// 스크롤 내리기
	prepareScroll();
}// displayChat 종료



// 스크롤 함수
// 준비 함수, 약간의 시간을 두어 scroll 함수를 호출하기
function prepareScroll() {
  window.setTimeout(scrollUl, 50);
}

// scroll 함수
function scrollUl() {
  // 채팅창 form 안의 ul 요소, (ul 요소 안에 채팅 내용들이 li 요소로 입력된다.)
  let chatUl = document.querySelector('.msg_history');
  chatUl.scrollTop = chatUl.scrollHeight; // 스크롤의 위치를 최하단으로
}
    // 해당 파일
	let file = null;
    // 이미지 선택
    document.getElementById('imageInput').addEventListener('change', function(event) {	
	  // 원래 있던 이미지 전체 삭제
	  emoticonImg = null;
      file = event.target.files[0];
      displaySelectedImage(file);
    });

	// 이미지 미리보기
    function displaySelectedImage(image) {
		
      const reader = new FileReader();
      reader.onload = function(event) {
        const imageUrl = event.target.result;
        const selectedImagesContainer = document.getElementById('selectedImages');
        const selectedImageDiv = document.createElement('div');
        // 원래 있던 이미지 삭제
        selectedImagesContainer.innerHTML = '';
        selectedImageDiv.classList.add('selected-image');

        const img = document.createElement('img');
        img.src = imageUrl;
        img.style ="min-height : 100px; min-width : 200px"
        selectedImageDiv.appendChild(img);

        const removeText = document.createElement('span');
        removeText.classList.add('remove-image');
        removeText.textContent = 'x';
        removeText.addEventListener('click', function() {
         selectedImagesContainer.removeChild(selectedImageDiv);
         file = null;
         emoticonImg = null;
        });
        selectedImageDiv.appendChild(removeText);

        selectedImagesContainer.appendChild(selectedImageDiv);
      };
      reader.readAsDataURL(image);
    }
    
    // 이모티콘 미리보기
    // 이모티콘
    let emoticonImg = null;
    function displaySelectedEmoji(emoji) {
		const selectedImagesContainer = document.getElementById('selectedImages');
        const selectedImageDiv = document.createElement('div');
        // 원래 있던 이미지 삭제
        selectedImagesContainer.innerHTML = '';
        
        selectedImageDiv.classList.add('selected-emoji');
        
        const img = document.createElement('img');
        img.src = "/images/upload/emoji/" + emoji;
        img.style ="height : 100px; width : 100px"
        selectedImageDiv.appendChild(img);

        const removeText = document.createElement('span');
        removeText.classList.add('remove-image');
        removeText.textContent = 'x';
        removeText.addEventListener('click', function() {
         selectedImagesContainer.removeChild(selectedImageDiv);
         file = null;
         emoticonImg = null;
        });
        selectedImageDiv.appendChild(removeText);

        selectedImagesContainer.appendChild(selectedImageDiv);
	}

  // Show the selected section and hide others
  document.querySelectorAll('.emoticon-section button').forEach(button => {
    button.addEventListener('click', () => {
	   // 원래 있던 이미지 전체 삭제
	  resetFileAndEmoticon();
      // Handle the selected emoticon
      const emoticon = button.textContent.trim();
      emoticonImg = emoticon;
      console.log('Selected emoticon:', emoticon);
      // You can add your logic here to use the selected emoticon
	  displaySelectedEmoji(emoticonImg)
	  
      // Close the modal
      const modal = document.getElementById('emoticonModal');
      const bootstrapModal = bootstrap.Modal.getInstance(modal);
      bootstrapModal.hide();
    });
  });
    
    // 이모티콘 또는 파일 없애기
    const resetFileAndEmoticon = () => {
		 file = null;
         emoticonImg = null;
	}
    
    // 메시지 보낸 후 여러 없애기
    const resetText = () => {
        const messageInput = document.getElementById("messageInput");
        const message = messageInput.value;
        const selectedImagesContainer = document.getElementById('selectedImages');
		file = null;
		emoticonImg = null;
		messageInput.value = "";
		selectedImagesContainer.innerHTML = '';
	}
    
    // 소켓으로 받은 데이터 올리기
    const addMessage = (res , type) => {
		if(type == "one") {
			res = JSON.parse(res);
		}
		let message = "";
		
		// 만약 유저가 다른사람이라면
		if(res.userId != userId) {
			message += `<br/><div class="incoming_msg">
						 <div class="incoming_msg_img">
												<img src="${res.userFile}"
													alt="sunil">
											</div>
											
											<div class="received_msg"><h5>${res.userName}</h5>`
			// 만약 이미지가 있다면
			message += res.chatMessageType == 'IMAGE'? `<img src="/images/upload/${res.file}" style="width : 200px ; height : 100px; "/>` : '';					
			message += res.chatMessageType == 'EMOJI'? `<img src="/images/upload/emoji/${res.emoji}" style="width : 200px ; height : 100px;"/>` : '';					
								
			message += 		`
							<div class="received_withd_msg">
									  <p>${res.text}</p>
										<span class="time_date">${formatDate(res.createAt)}</span>
										</div>
									</div>
							</div>`;
			return message;
		}
		
		// 만약 유저가 자신이라면
		if(res.userId == userId) {
			message += `<br/><div class="outgoing_msg">
											<div class="sent_msg">`
			// 만약 이미지가 있다면
			message += res.chatMessageType == 'IMAGE'? `<img src="/images/upload/${res.file}" style="width : 200px ; height : 100px;"/>` : '';													
			message += res.chatMessageType == 'EMOJI'? `<img src="/images/upload/emoji/${res.emoji}" style="width : 200px ; height : 100px;"/>` : '';														
			
			message +=	`<p>${res.text}</p><span class="time_date">${formatDate(res.createAt)}</span>
							</div>
						</div>`;	
			return message;
		}
		
		return message;
	}
	
	
	
	
	// 메시지 에 들어갈 date 포맷	
	const formatDate = (createAt) => {
    const dateTimeString = createAt;
    const dateTime = new Date(dateTimeString);
    const currentTime = new Date();
    
    const timeDifferenceInMilliseconds = currentTime - dateTime;
    
    // 밀리초를 분, 시간, 일로 변환합니다.
    const timeDifferenceInMinutes = Math.floor(timeDifferenceInMilliseconds / (1000 * 60));
    const timeDifferenceInHours = Math.floor(timeDifferenceInMilliseconds / (1000 * 60 * 60));
    const timeDifferenceInDays = Math.floor(timeDifferenceInMilliseconds / (1000 * 60 * 60 * 24));
    
    let formattedTimeDifference;
    
    if (timeDifferenceInMinutes < 1) {
        formattedTimeDifference = '방금 전';
    } else if (timeDifferenceInMinutes < 60) {
        formattedTimeDifference = `${timeDifferenceInMinutes}분 전`;
    } else if (timeDifferenceInHours < 24) {
        formattedTimeDifference = `${timeDifferenceInHours}시간 전`;
    } else {
        formattedTimeDifference = `${timeDifferenceInDays}일 전`;
    }
    
    return formattedTimeDifference;
}

	
    // ---------------------------------- stomp
    // 소켓
      const socket = new SockJS("http://localhost:80/ws"); // 이 부분 교체 작업 진행해야함
      const stompClient = Stomp.over(socket);
    

		stompClient.connect({}, (frame) => {
        console.log("Connected to WebSocket");
        console.log("Session ID: " + frame.headers["user-name"]);
        }
      );
      
          // 연결 , 구독
    const connectStomp =(roomId) => {
        stompClient.subscribe(`/sub/chat/${roomId}`, (message) => {
            let text = addMessage(message.body , "one");
            	//  채팅 넣기
			msgHistory.innerHTML += text;
			scrollUl();
          });
	}
	
      socket.addEventListener("close", (event) => {
        console.log("WebSocket connection closed.");
      });


// 메시지 구분
const sendMessage = () => {
	// 일반 텍스트
	if(file == null && emoticonImg == null) {
		sendTextMessage(0);
		return ;
	} else 
	// 이미지
	if(file != null && emoticonImg == null) {
		sendImgMessage(1);
		return ;
	} else
	// 이모티콘
	if(emoticonImg != null && file == null) {
		sendTextMessage(2);
		return ;
	}
}

      // 일반 텍스트 메시지
      function sendTextMessage(messageType) {
        const messageInput = document.getElementById("messageInput");
        const message = messageInput.value;
        
        stompClient.send(
          "/pub/chat/sendMessage",
          {},
          JSON.stringify({
			userId : userId ,
            text: message,
            emoji : emoticonImg,
            roomId: messageRoomId,
            chatMessageType: messageType,
          })
        );
        resetText();
      }
      
// 이미지 메시지
const sendImgMessage = (messageType) => {
		const messageInput = document.getElementById("messageInput");
        const message = messageInput.value;

	    var formData = new FormData();
        formData.append("roomId", messageRoomId);
        formData.append("text", message);
        formData.append("file", file);
        formData.append("chatMessageType", messageType);

        $.ajax({
          url: "http://localhost:80/chat/image",
          type: "POST",
          data: formData,
          contentType: false,
          processData: false,
          success: function (response) {
            console.log("Success:", response);
            resetText();
          },
          error: function (xhr, status, error) {
            console.error("Error:", error);
          },
        });
}




