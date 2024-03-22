/**
 * 댓글
 */

const contentTextArea = document.getElementById('review-content');
const commentList = document.getElementsByClassName('cmt_list')[0];
const pageNavigation = document.getElementsByClassName('pagination')[0];
const commentTotal = document.getElementById('comment-total');
const deleteSubForm = document.getElementById('delete-sub-form');
const mainImojiList = document.getElementById('comment-main-imoji'); // 메인 이모티콘
const subEmojiList = document.getElementById('comment-sub-imoji'); // 이모티콘 서브
const displayClickEmoji = document.getElementById('display-click-emoji'); // 이모지를 display
let reviewPg = 0; // 현재 페이지 번호

let emojiFile = ""; // 유저가 선택한 이모지

let dataEmoji;

// 댓글 목록 출력
document.addEventListener("DOMContentLoaded", function() {
	// 상세 페이지에 들어왔을 시점
	reviewPg = 1;
	reviewList(reviewPg);
});

// 이모티콘 불러오기
function imojiList(){
	
	
	$.ajax({    
		type : 'post',               
		url : '/freeBoard/imoji',            
		headers : {          
			"Content-Type" : "application/json"    
		},    
		success : function(result) {      
			
			// 전체 list 객체 담기
			dataEmoji = result;
			
			// 메인 이모티콘 뿌리기
			for(var i = 0; i < result.length; i++) {
				mainImojiList.innerHTML += `<img src="/images/upload/emoji/${result[i].mainEmoji.file}" onclick="displaySubEmoji(${i})"/>`
			// 	subEmojiList.innerHTML += displaySubEmoji(result[i].subEmoji);
			}
			
		},    
		error : function(request, status, error) {     
			console.log(error)    
		}});
		
		
	
}

// subEmoji To display 
const displaySubEmoji = (index) => {
	
	let data = dataEmoji[index].subEmoji;	
	
	let display = "";
	for(var i = 0; i < data.length; i++) {
		display +=  `<img src="/images/upload/emoji/${data[i].file}" onclick="onclickEmoji('${data[i].file}')"/>`
	}
	
	
	subEmojiList.innerHTML = display;
	//	return display;
}



// 이모지를 클릭했을 시 발생하는 이벤트
const onclickEmoji = (file) => {
	
	emojiFile = file;
	console.log(emojiFile);
	
	// 화면에 뿌려주는 이벤트
	displayClickEmoji.innerHTML = `<img src="/images/upload/emoji/${emojiFile}"/>`
}

// 댓글 전송
function review(){
	
	// 추후에 이모티콘 같이 전송
	const content = contentTextArea.value;
	console.log(content);
	
	const postId = getParams();
	console.log('현재 번호 : '+postId);
	
	$.ajax({    
		type : 'post',               
		url : '/freeBoard/review',
		headers : {          
			"Content-Type" : "application/json"    
		},
		data : JSON.stringify({  
			"freeBoardId": postId,
			"content" : content ,
			"file" : emojiFile
		}),    
		success : function(result) {  
			console.log(" 현재 페이지 : "+reviewPg);
			reviewList(reviewPg);
		},    
		error : function(request, status, error) {     
			console.log(error);
		}});
	
	
	
}

const clearReview = () => {
	const content = contentTextArea.value;
	emojiFile = "";
	content = "";
	// display.none
}

// 현재 게시글 번호 가져오기
function getParams() {
	let currentUrl = window.location.href;
	let url = new URL(currentUrl);
	let id = url.searchParams.get("id");
	console.log('id 값 '+id);
	
	if(id == null){
		alert("게시글 번호가 존재하지 않습니다.");
		window.location.href = '/freeBoard/list';
	}
	
	return id;
}

// 페이지 리스트
function reviewList(pg){
	const id = getParams();
	const size = 10;
	
	console.log('현재 댓글 페이지 : '+pg);
	
	$.ajax({    
		type : 'post',               
		url : '/freeBoard/detail/review',            
		headers : {          
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({  
			"id": id,
			"pg": pg,
			"size": size
		}),
		success : function(result) {  
			console.log(result);
			
			if(result !== null){
				tagList(result);
				commentTotal.textContent = result.total;
			}
			
		},
		error : function(error) {     
			console.log(error)    
		}
	
	});
}


// 동적 리스트 생성(댓글, 페이지네이션)
function tagList(result){
	// 동적 태그
	let comment = ''; 
	let pageNum = '';
	
	// 페이지네이션 변수
	let last = result.last;
	let pg = result.pg;
	let end = result.end;
	let start = result.start;
	
	
	// 댓글 목록
	for(let i=0; i < result.dtoList.length; i++){
		let commentData = result.dtoList[i];
		comment = createComment(commentData, comment);
	}
	
	// 화면에 보내기
	commentList.innerHTML = comment;
	
	// 댓글 페이징 처리
	if(start > 1){
		pageNum += '<li class="page-item"><span class="page-link" onclick="startPage('+start+')">&laquo;</span></li>';
	}
	for(let j=start; j <= end; j++){
		pageNum += '<li class="page-item"><span class="page-link" onclick="nextPage('+j+')">'+j+'</span></li>';
	}
	if(end < last){
		pageNum += '<li class="page-item"><span class="page-link" onclick="endPage('+end+')">&raquo;</span></li>';
	}
	
	// 페이지네이션 화면에 내보내기
	pageNavigation.innerHTML = pageNum;
	
}

// 댓글 등록 태그
function createComment(commentData, comment){
	
	if(commentData.reviewGroup !== null){
		comment += '<li id="comment_li" data-no="'+commentData.id +'" ';
		comment += 'data-group="'+commentData.reviewGroup+'" class="ub-content reply_box">';
	} else {
		comment += '<li id="comment_li" data-no="'+commentData.id +'" class="ub-content">';
	}
	comment +=	'<div class="cmt_info clear">';
	comment +=	'<div class="cmt_nickbox">';
	comment +=	'<div>';
	comment +=	'<img src="/profile/'+ commentData.userFile +'"';
	comment +=	'style="border-radius: 50%; overflow: hidden; width: 40px; height: 40px; border: 1px solid #ccc;">';
	comment +=		'</div>';
	comment +=	'<span class="gall_writer ub-writer"';
	comment +=	'data-ip="1.214"> <span class="nickname"><em';
	comment	+=	'title="ㅇㅇ">'+ commentData.userName +'</em></span>';
	comment	+=	'</span>';
	comment	+=	'</div>';
	comment	+=	'<div class="clear cmt_txtbox btn_reply_write_all">';
	if(commentData.file !== null){
		comment	+= '<img src="/images/upload/emoji/'+commentData.file+'" alt="" />';
	}
	comment	+=  '<p class="usertxt ub-word" style="margin-top: 10px;">'+commentData.content +'</p>';
	comment	+=	'</div>';
	comment	+=	'<div class="fr clear">';
	comment	+=	'<span class="date_time">'+commentData.createAt+'</span>';
	comment	+=	'<div class="cmt_mdf_del">';
	comment	+=	'<button type="button" class="btn_cmt_delete btn btn-warning">삭제</button>';
	comment	+=	'<button type="button" onclick="subComment('+commentData.id+')" class="btn_cmt_sub btn btn-warning">답글</button>';
	comment +=	'</div>';
	comment +=	'</div>';
	comment += '</div>';
	comment +=	'</li>';
	
	return comment;
}

// 이전 10개 페이지 넘기기
function startPage(start){
	start -= 1;
	reviewPg = start;
	console.log("start : "+reviewPg);
	reviewList(reviewPg);
}

// 페이지 넘기기
function nextPage(num){
	reviewPg = num;
	console.log("num : "+reviewPg);
	reviewList(reviewPg);
}

// 이후 10개 페이지 넘기기
function endPage(end){
	end += 1;
	reviewPg = end;
	console.log("end : "+reviewPg);
	reviewList(reviewPg);
}

// 답글 폼 생성
function subComment(number){
	const subCommentForm = document.getElementById('review-sub-form');
	
	console.log("부모 번호 : "+number);
	
	if(!subCommentForm){
	
		const commentForm = '<div id="review-sub-form" data-group="'+number+'" style="padding: 20px; box-sizing: border-box;">'+
						'<label for="review-content">댓글 입력</label>'+
						'<textarea id="sub-review-content" name="content" '+
							'style="resize: none; border: 1px solid #ccc;"></textarea>'+
						'<div style="display: flex; justify-content: space-between; align-items: stretch;">'+
							'<button type="button" class="btn btn-warning" onclick="imojiList()">이모티콘</button>'+
							'<div>'+
							'<button type="button" class="btn btn-danger" onclick="deleteTag()">닫기</button>'+
							'<button type="button" class="btn btn-primary" onclick="subCommentForm()">등록</button>'+
							'</div>'+
						'</div>'+
						'<div class="main-imoji-list">'+
						'</div>'+
					'</div>';
					
					
		// 현재 클릭된 답글 버튼의 부모 요소(li)를 찾음
	    const targetLi = document.querySelector('[data-no="' + number + '"]');
	
	    // 새로운 댓글 입력 폼을 해당 댓글 아래에 추가
	    targetLi.insertAdjacentHTML('afterend', commentForm);
	
	} else {
		alert('이미 답글 등록 란이 열려있습니다.');
	}
	
}

// 답글 폼 태그 삭제
function deleteTag() {
	const subCommentForm = document.getElementById('review-sub-form');
    if (subCommentForm) {
        subCommentForm.remove();
    }
}

// 답글 등록
function subCommentForm(){
	const subContent = document.getElementById('sub-review-content');
	
	// 추후에 이모티콘 같이 전송
	const content = subContent.value;
	console.log(content);
	
	const postId = getParams();
	console.log('현재 번호 : '+postId);
	
	const element = document.getElementById("review-sub-form");
	const groupNumber = element.dataset.group;
	
	console.log("data-group 속성 값:", groupNumber);
	
	$.ajax({    
		type : 'post',               
		url : '/freeBoard/review/sub',
		headers : {          
			"Content-Type" : "application/json"    
		},
		data : JSON.stringify({  
			"freeBoardId": postId,
			"content" : content,
			"reviewGroup":groupNumber
		}),    
		success : function(result) {  
			console.log(reviewPg);
			reviewList(reviewPg);
			
		},    
		error : function(request, status, error) {     
			console.log(error);
		}});
}