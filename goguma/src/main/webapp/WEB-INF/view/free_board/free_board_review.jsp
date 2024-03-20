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
					전체 댓글 <em class="font_red"><span id="comment_total_915289">2</span></em>개
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
					<li id="comment_li_6807114" class="ub-content">
						<div class="cmt_info clear" data-no="6807114" data-rcnt="1"
							data-article-no="915289">
							<div class="cmt_nickbox">
								<div>
									<img src="/customAssets/images/no_product.png"
										style="border-radius: 50%; overflow: hidden; width: 40px; height: 40px; border: 1px solid #ccc;">
								</div>
								<span class="gall_writer ub-writer" data-nick="ㅇㅇ" data-uid=""
									data-ip="1.214"> <span class="nickname"><em
										title="ㅇㅇ">ㅇㅇ</em><span class="ip">(1.214)</span></span>
								</span>
							</div>
							<div class="clear cmt_txtbox btn_reply_write_all">
								<p class="usertxt ub-word">딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어</p>
							</div>
							<div class="fr clear">
								<span class="date_time">03.18 15:10:18</span>
								<div class="cmt_mdf_del" data-type="cmt" re_no="6807114"
									data-my="N" data-article-no="915289" data-pwd-pop="Y"
									data-uid="">
									<button type="button" class="btn_cmt_delete">삭제</button>
								</div>
							</div>
						</div>
					</li>
					<li id="comment_li_6807114" class="ub-content reply_box">
						<div class="cmt_info clear" data-no="6807114" data-rcnt="1"
							data-article-no="915289">
							<div class="cmt_nickbox">
								<div>
									<img src="/customAssets/images/no_product.png"
										style="border-radius: 50%; overflow: hidden; width: 40px; height: 40px; border: 1px solid #ccc;">
								</div>
								<span class="gall_writer ub-writer" data-nick="ㅇㅇ" data-uid=""
									data-ip="1.214"> <span class="nickname"><em
										title="ㅇㅇ">ㅇㅇ</em><span class="ip">(1.214)</span></span>
								</span>
							</div>
							<div class="clear cmt_txtbox btn_reply_write_all ">
								<p class="usertxt ub-word">대댓글은 reply_box class 명을 단 태그가
									오른쪽으로 padding을 줘서 구현했음 상위 li태그의 class에 reply_box를 주었음 댓글 대댓글 대대댓글을 위해 reply_box2,3,4 까지 작성해 두었음</p>
							</div>
							<div class="fr clear">
								<span class="date_time">03.18 15:10:18</span>
								<div class="cmt_mdf_del" data-type="cmt" re_no="6807114"
									data-my="N" data-article-no="915289" data-pwd-pop="Y"
									data-uid="">
									<button type="button" class="btn_cmt_delete">삭제</button>
								</div>
							</div>
						</div>
					</li>
					<li id="comment_li_6807114" class="ub-content reply_box2">
						<div class="cmt_info clear" data-no="6807114" data-rcnt="1"
							data-article-no="915289">
							<div class="cmt_nickbox">
								<div>
									<img src="/customAssets/images/no_product.png"
										style="border-radius: 50%; overflow: hidden; width: 40px; height: 40px; border: 1px solid #ccc;">
								</div>
								<span class="gall_writer ub-writer" data-nick="ㅇㅇ" data-uid=""
									data-ip="1.214"> <span class="nickname"><em
										title="ㅇㅇ">ㅇㅇ</em><span class="ip">(1.214)</span></span>
								</span>
							</div>
							<div class="clear cmt_txtbox btn_reply_write_all ">
								<p class="usertxt ub-word">대댓글은 reply_box class 명을 단 태그가
									오른쪽으로 padding을 줘서 구현했음 상위 li태그의 class에 reply_box를 주었음</p>
							</div>
							<div class="fr clear">
								<span class="date_time">03.18 15:10:18</span>
								<div class="cmt_mdf_del" data-type="cmt" re_no="6807114"
									data-my="N" data-article-no="915289" data-pwd-pop="Y"
									data-uid="">
									<button type="button" class="btn_cmt_delete">삭제</button>
								</div>
							</div>
						</div>
					</li>

					<li id="comment_li_6807114" class="ub-content">
						<div class="cmt_info clear" data-no="6807114" data-rcnt="1"
							data-article-no="915289">
							<div class="cmt_nickbox">
								<div>
									<img src="/customAssets/images/no_product.png"
										style="border-radius: 50%; overflow: hidden; width: 40px; height: 40px; border: 1px solid #ccc;">
								</div>
								<span class="gall_writer ub-writer" data-nick="ㅇㅇ" data-uid=""
									data-ip="1.214"> <span class="nickname"><em
										title="ㅇㅇ">ㅇㅇ</em><span class="ip">(1.214)</span></span>
								</span>
							</div>
							<div class="clear cmt_txtbox btn_reply_write_all">
								<p class="usertxt ub-word">딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어
									딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면
									좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면
									좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면
									좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어</p>
							</div>
							<div class="fr clear">
								<span class="date_time">03.18 15:10:18</span>
								<div class="cmt_mdf_del" data-type="cmt" re_no="6807114"
									data-my="N" data-article-no="915289" data-pwd-pop="Y"
									data-uid="">
									<button type="button" class="btn_cmt_delete">삭제</button>
								</div>
							</div>
						</div>
					</li>
					<li id="comment_li_6807114" class="ub-content">
						<div class="cmt_info clear" data-no="6807114" data-rcnt="1"
							data-article-no="915289">
							<div class="cmt_nickbox">
								<div>
									<img src="/customAssets/images/no_product.png"
										style="border-radius: 50%; overflow: hidden; width: 40px; height: 40px; border: 1px solid #ccc;">
								</div>
								<span class="gall_writer ub-writer" data-nick="ㅇㅇ" data-uid=""
									data-ip="1.214"> <span class="nickname"><em
										title="ㅇㅇ">ㅇㅇ</em><span class="ip">(1.214)</span></span>
								</span>
							</div>
							<div class="clear cmt_txtbox btn_reply_write_all">
								<p class="usertxt ub-word">딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어
									딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면
									좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면
									좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면
									좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어</p>
							</div>
							<div class="fr clear">
								<span class="date_time">03.18 15:10:18</span>
								<div class="cmt_mdf_del" data-type="cmt" re_no="6807114"
									data-my="N" data-article-no="915289" data-pwd-pop="Y"
									data-uid="">
									<button type="button" class="btn_cmt_delete">삭제</button>
								</div>
							</div>
						</div>
					</li>
					<li id="comment_li_6807114" class="ub-content">
						<div class="cmt_info clear" data-no="6807114" data-rcnt="1"
							data-article-no="915289">
							<div class="cmt_nickbox">
								<div>
									<img src="/customAssets/images/no_product.png"
										style="border-radius: 50%; overflow: hidden; width: 40px; height: 40px; border: 1px solid #ccc;">
								</div>
								<span class="gall_writer ub-writer" data-nick="ㅇㅇ" data-uid=""
									data-ip="1.214"> <span class="nickname"><em
										title="ㅇㅇ">ㅇㅇ</em><span class="ip">(1.214)</span></span>
								</span>
							</div>
							<div class="clear cmt_txtbox btn_reply_write_all">
								<p class="usertxt ub-word">딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어
									딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면
									좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면
									좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면
									좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어</p>
							</div>
							<div class="fr clear">
								<span class="date_time">03.18 15:10:18</span>
								<div class="cmt_mdf_del" data-type="cmt" re_no="6807114"
									data-my="N" data-article-no="915289" data-pwd-pop="Y"
									data-uid="">
									<button type="button" class="btn_cmt_delete">삭제</button>
								</div>
							</div>
						</div>
					</li>
					<li id="comment_li_6807114" class="ub-content reply_box">
						<div class="cmt_info clear" data-no="6807114" data-rcnt="1"
							data-article-no="915289">
							<div class="cmt_nickbox">
								<div>
									<img src="/customAssets/images/no_product.png"
										style="border-radius: 50%; overflow: hidden; width: 40px; height: 40px; border: 1px solid #ccc;">
								</div>
								<span class="gall_writer ub-writer" data-nick="ㅇㅇ" data-uid=""
									data-ip="1.214"> <span class="nickname"><em
										title="ㅇㅇ">ㅇㅇ</em><span class="ip">(1.214)</span></span>
								</span>
							</div>
							<div class="clear cmt_txtbox btn_reply_write_all">
								<p class="usertxt ub-word">딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어
									딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면
									좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면
									좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면
									좋겠어딴소리긴한데 쿄서트하면 회차별 1인2매로 제한했으면 좋겠어</p>
							</div>
							<div class="fr clear">
								<span class="date_time">03.18 15:10:18</span>
								<div class="cmt_mdf_del" data-type="cmt" re_no="6807114"
									data-my="N" data-article-no="915289" data-pwd-pop="Y"
									data-uid="">
									<button type="button" class="btn_cmt_delete">삭제</button>
								</div>
							</div>
						</div>
					</li>
				</ul>
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
		
	
		// 이모티콘 불러오기
		function imojiList(){
			alert('내 이모티콘!');
			
			/*
			$.ajax({    
				type : 'get',               
				url : '/user#',            
				headers : {          
					"Content-Type" : "application/json"    
				},    
				data : JSON.stringify({  
					"id" : id,
					"content" : content
				}),    
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
					"fId": postId,
					"content" : content
				}),    
				success : function(result) {  
					console.log(result);
					
				},    
				error : function(request, status, error) {     
					console.log(error)    
				}});
			
		}
		
		// 현재 게시글 번호 가져오기
		function getParams() {
			let currentUrl = window.location.href;
			
			let matches = currentUrl.match(/\/freeBoard\/detail\/(\d+)/);
			let postId = 0;
			
			if (matches && matches.length > 1) {
				postId = matches[1];
			} else {
			    alert("게시글 번호를 가져올 수 없습니다.");
			    return;
			}
			return postId;
		}
		
		// 댓글 목록 출력
	</script>
</body>
</html>