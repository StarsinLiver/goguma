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
	background-color: #f2f2f2;
}

.reply_box2 {
	margin-left: 40px; /* 대댓글이 들여쓰기되도록 설정 */
}

.reply_box3 {
	margin-left: 60px; /* 대대댓글이 들여쓰기되도록 설정 */
}
.review-list-imoji {
	width: 100px;
	height: 100px;
}
.imoji-tab {
	display: none;
	padding: 10px;
    border: 1px solid black;
}
/* 메인 이모티콘 목록 */
.main-imoji-list {
	display: block;
	border: 1px solid black; 
	width: 400px; 
	height: 70px;
	overflow-x: auto;
  	white-space: nowrap;
}
.main-imoji-list img {
	width: 70px;
	height: 100%;
}

/* 서브 이모티콘 목록 */
.sub-imoji-list {
	width: 400px;
    height: 200px;
    overflow-y: scroll;
    border: 1px solid black;
}
.sub-imoji-list img {
	width: 70px;
	height: 70px;
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
						<button type="button" class="btn btn-warning" onclick="onclickReviewMainEmoji()">이모티콘</button>
						
						<button type="button" class="btn btn-primary" onclick="review()">등록</button>
					</div>
					<div class="imoji-tab" id="comment-tab">
						<div class="main-imoji-list" id="comment-main-imoji">
						</div>
						
						<div class="sub-imoji-list" id="comment-sub-imoji">
						</div>
						<div id="display-click-emoji"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS (optional) -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
	<!-- Custom JS -->
	<script src="/customAssets/js/session.js"></script>
	<script src="/customAssets/js/free-board/free_detail_review.js"></script>
</body>
</html>