<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Styled Comment Section with Flexbox</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* Custom styles */
.comment_box {
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	padding: 10px;
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.cmt_list li {
	border-bottom: 1px solid #ced4da;
	padding: 10px 0;
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.cmt_info {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 10px;
}

.cmt_txtbox {
	flex: 1;
}

.reply_box {
	margin-left: 20px; /* 댓글이 들여쓰기되도록 설정 */
}

.reply_box2 {
	margin-left: 40px; /* 대댓글이 들여쓰기되도록 설정 */
}

.reply_box3 {
	margin-left: 60px; /* 대대댓글이 들여쓰기되도록 설정 */
}
.loader {
  border: 16px solid #f3f3f3; /* Light grey */
  border-top: 16px solid #3498db; /* Blue */
  border-radius: 50%;
  width: 120px;
  height: 120px;
  animation: spin 2s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
</head>
<body>
	<div class="view_comment" id="focus_cmt"
		style="padding: 5%; width: 90%;">
		<h2 class="blind">댓글</h2>
		<div id="comment_wrap_915289" class="comment_wrap show"
			data-article-lv="10" data-sort-type="" data-comment-cnt="0"
			data-article-no="915289">
			<div class="comment_count">
				<div class="fl num_box">
					전체 댓글 <em class="font_red"><span id="comment-total">2</span></em>개
					<div class="select_box array_latest">
						<select name="selCommentSort">
							<option value="D">등록순</option>
							<option value="N">최신순</option>
							<option value="R">답글수</option>
						</select>

						<ul class="option_box" id="commentSortLayer_915289"
							data-no="915289" style="left: -1px; top: 19px; display: none">
							<!--<li class="comment_sort" data-sort="I">등록순</li>-->
							<li class="comment_sort" data-sort="D">등록순</li>
							<li class="comment_sort" data-sort="N">최신순</li>
							<li class="comment_sort" data-sort="R">답글순</li>
						</ul>
					</div>
					<button type="button" class="btn_setreply" style="display: none">
						<span class="blind">답글 펼침 설정</span><em
							class="sp_img icon_setreply"></em>
					</button>
				</div>
			</div>
			<div class="comment_box">
				<ul class="cmt_list">
					<!-- 댓글 리스트 -->
					<li class="loader"></li>
				</ul>
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<!-- 페이지네이션 -->
					</ul>
				</nav>
				<div id="review-form" style="padding: 20px; box-sizing: border-box;">
					<label for="review-content">댓글 입력</label>
					<textarea id="review-content" name="content" 
						style="resize: none; border: 1px solid #ccc;"></textarea>
					<div style="display: flex; justify-content: space-between; align-items: stretch;">
						<button type="button" class="btn btn-warning" onclick="imojiList()">이모티콘</button>
						<button type="button" class="btn btn-primary" onclick="review()">등록</button>
					</div>
					<div class="main-imoji-list" style="border: 1px soild black; width: 50%;">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS (optional) -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		
	<script>
		const contentTextArea = document.getElementById('review-content');
		const commentList = document.getElementsByClassName('cmt_list')[0];
		const pageNavigation = document.getElementsByClassName('pagination')[0];
		const commentTotal = document.getElementById('comment-total');
	
		// 이모티콘 불러오기
		function imojiList(){
			alert('내 이모티콘!');
			
			/*
			$.ajax({    
				type : 'get',               
				url : '/imoji/user',            
				headers : {          
					"Content-Type" : "application/json"    
				},    
				success : function(result) {      
					
				},    
				error : function(request, status, error) {     
					console.log(error)    
				}});
			*/
			
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
					"content" : content
				}),    
				success : function(result) {  
					console.log(result);
					
					let comment = ''; // 동적 태그
					const commentData = result; // 데이터
					
					// 태그 삽입
					comment = createComment(commentData, comment);
					
					// 댓글 목록 맨 밑에 삽입
					commentList.insertAdjacentHTML('beforeend', comment);
					
				},    
				error : function(request, status, error) {     
					console.log(error)    
				}});
			
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
		
		// 댓글 목록 출력
		document.addEventListener("DOMContentLoaded", function() {
			
			const id = getParams();
			const size = 10;
			let reviewPage = 1;
			
			$.ajax({    
				type : 'post',               
				url : '/freeBoard/detail/review',            
				headers : {          
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({  
					"id": id,
					"pg": reviewPage,
					"size": size
				}),
				success : function(result) {  
					console.log(result);
					
					if(result !== null){
						tagList(result);
						commentTotal.textContent = result.total;
					}
					
				},
				error : function(request, status, error) {     
					console.log(error)    
				}
			
			});
			
			
		});
		
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
			console.log('last : '+last);
			
			
			// 댓글 목록
			for(let i=0; i < result.dtoList.length; i++){
				let commentData = result.dtoList[i];
				comment = createComment(commentData, comment);
			}
			
			// 화면에 보내기
			commentList.innerHTML = comment;
			
			// 댓글 페이징 처리
			
			if(start > 1){
				pageNum += '<li class="page-item"><span class="page-link" onclick="startPage('+start+')">이전</span></li>';
			}
			for(let j=start; j <= end; j++){
				pageNum += '<li class="page-item"><span class="page-link" onclick="nextPage('+j+')">'+j+'</span></li>';
			}
			if(end < last){
				pageNum += '<li class="page-item"><span class="page-link" onclick="endPage('+end+')">이후</span></li>';
			}
			
			// 페이지네이션 화면에 내보내기
			pageNavigation.innerHTML = pageNum;
			
		}
		
		// 댓글 등록 태그(등록, 목록)
		function createComment(commentData, comment){
			
			comment += '<li id="comment_li_6807114" class="ub-content">';
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
			comment	+=	'<button type="button" class="btn_cmt_delete">삭제</button>';
			comment +=	'</div>';
			comment +=	'</div>';
			comment += '</div>';
			comment +=	'</li>';
			
			return comment;
		}
		
		// 페이지 넘기기
		function nextPage(start){
			
			
		}
		
		// 이전 10개 페이지 넘기기
		function startPage(num){
			
		}
		
		// 이후 10개 페이지 넘기기
		function endPage(end){
			
		}
		
	</script>
</body>
</html>