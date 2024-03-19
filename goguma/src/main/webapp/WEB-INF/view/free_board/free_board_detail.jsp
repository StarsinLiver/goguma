<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	width: 80%;
	border-collapse: collapse;
	margin: 5% 5%;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
	width: 25%;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

textarea {
	width: 100%;
	height: 150px;
	padding: 12px 20px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	background-color: #f8f8f8;
	font-size: 16px;
	resize: none;
    overflow: hidden; /* 스크롤바를 보이지 않도록 함 */
    border: none; /* 테두리 스타일 설정 */
}

.b-view-title {
	border-top: 1px solid #343a40; /* 볼더를 주고 */
	border-bottom: 1px solid #343a40; /* 볼더를 주고 */
	background: linear-gradient(to bottom, #f8f9fa, #e9ecef);
	/* 그라데이션 배경 추가 */
	padding: 20px;
}

.b-profile {
	background-color: #f8f9fa; /* 내부 배경색 회색으로 변경 */
	border-radius: 15px; /* 테두리를 둥글게 */
	padding: 10px;
}
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
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>

<!-- 메인 시작 -->
<body>

	<div style="width: 100%; display: flex;">
		<!-- aside 시작 -->
		<div
			style="width: 13.6%; width: 13.6%; display: flex; flex-direction: column; align-items: flex-start; border-right: 1px solid;">
			<%@ include file="/WEB-INF/view/free_board/free_board_aside.jsp"%>
		</div>
		<!-- aside 끝 -->
		<div style="width: 100%;">

			<div class="container"
				style="max-width: 100%; width: 90%; margin-top: 3%; margin-bottom: 3%;">
				<div class="b-view-title" style="width: 90%;">
					<div class="row">
						<div class="col-md-2 b-profile">
							<div class="img" style="max-width: 380px; max-height: 130px;">
								<img
									src="/customAssets/images/no_product.png"
									class="img-fluid" style="width:100%; height: 100px;">
							</div>
						</div>
						<div class="col-md-10">
							<div class="b-title">
								<h2>슈 이름이 도구입니다만</h2>
							</div>
							<div class="b-info">
								<div class="d-flex">
									<div class="me-3">
										<i class="bi bi-clock"></i>&nbsp; <span>2024.03.18
											15:19</span>
									</div>
									<button type="button" class="btn btn-secondary">
										Report</button>
								</div>
							</div>
							<div class="col-md-6 b-user-info mt-3" style="margin-left: -0.8%">
								<div class="d-flex align-items-center">
									<div class="me-3">
										<i class="bi bi-hand-thumbs-up"></i> &nbsp;<span>추천수:
											70</span>
									</div>
									<div class="me-3">
										<i class="bi bi-person"></i> &nbsp;<span>조회수: 70</span>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<br> <br> <br>
			<!-- 게시글 시작 -->
			<div style="width: 81%; margin: 0% 5%;">
			<a href="#">sssssss</a>
				<p style="width: 100%;">
					텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 <br>
					텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 <br>
					텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 <br>
					텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 <br>
					텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 <br>
					텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 <br>
					텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 <br>
					텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 <br>
					텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 텍스트 내용 <br>
					   
				</p>
			</div>
			<br> <button style="margin: 0 41.5%"><i class='fab fa-gratipay' style='font-size:48px;color:red; '></i></button>
			<!-- 게시글 끝 -->
			<!-- 댓글 시작 -->
			<div>
			<div class="view_comment" id="focus_cmt"
		style="padding: 5%; width: 90%;">
		<h2 class="blind">댓글 영역</h2>
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
			</div>
		</div>
	</div>
	<!-- Bootstrap JS (optional) -->
	
			</div>
			<!-- 댓글 끝 -->
			<!-- <div style="margin: 5%; display: flex;">
				
				<div>
					<label> 작성자 이름 </label> <label> 작성일 </label><br> <br>
					<textarea type="text">
					
					</textarea>
					<button>이모티콘</button><button>신고하기</button> <button>수정하기</button><button>삭제</button> 
				</div>
			</div> -->
		</div>
	</div>


</body>
<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
function autoResize(textarea) {
  textarea.style.height = 'auto'; // 일단 자동 높이로 설정
  textarea.style.height = (textarea.scrollHeight + 2) + 'px'; // 스크롤 높이에 2px를 더해줌
}
</script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>
</html>