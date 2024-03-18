<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/product/userProduct.css">

<style>
/* 추가적인 CSS 스타일링은 여기에 추가할 수 있습니다. */
/* 검색창 스타일링 */
.form-control {
	width: calc(30% - 5px); /* 검색창 폭 조절 */
}

.form-select {
	width: calc(13% - 5px); /* 셀렉트 박스 폭 조절 */
}

h2 {
	background-color: #f2f2f2;
	padding: 10px;
	margin-top: 20px;
}

.card2 .cardA {
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	transition: transform 0.3s ease;
	position: relative;
	display: flex;
	flex-direction: column;
	border: 1px solid rgba(0, 0, 0, 0.125);
	margin-bottom: 10px;
}

.card2 {
	border: 1px solid #ccc; /* 테두리 스타일과 색상 지정 */
	border-radius: 10px; /* 카드의 모서리를 둥글게 만듦 */
	padding: 10px; /* 내부 여백 추가 */
	margin-top: 30px;
}

/* CSS */
.txt-wrap {
	display: flex;
	flex-direction: column;
}

.txt-wrap a {
	margin-bottom: 20px;
	margin-left: 5px;
}

.txt-wrap .user, .txt-wrap .cnt {
	display: flex;
}

.txt-wrap .user span, .txt-wrap .cnt span {
	margin-right: 10px;
	margin-left: 5px;
}

.board-img::before {
	background-image: url(/customAssets/images/common_img_sprite.png);
	background-repeat: no-repeat;
	display: block;
	position: relative;
}

.cnt .view::before {
	content: "";
	top: 8px;
	margin: 0 3px 0 0;
	width: 14px;
	height: 9px;
	background-position: -299px -11px;
}

.cnt .like::before {
	content: "";
	top: 4px;
	margin: 0 4px 0 85px;
	width: 17px;
	height: 15px;
	background-position: -326px -7px;
}

.cnt span {
	margin-right: 10px;
	position: relative;
	display: flex;
}

.txt-wrap .user span.layerNickName {
	font-size: 14px;
	color: gray;
}

.txt-wrap a.subject-link {
	font-weight: bold;
}
</style>

<!-- 메인 컨텐츠 -->
<div class="container mt-4">
	<div class="row justify-content-center">
		<section class="section nopad cac text-center" style="width: 67%;">
			<a href="#"><h3>아마도 광고 들어갈 예정</h3></a>
		</section>
		<div class="col-lg-8">
			<h2>
				카테고리 <a href="/freeBoard/main" style="float: right;">메인으로</a>
			</h2>
			<div class="row">
				<div class="col-md-3">
					<div class="card2">
						<a class="cardA" href="#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1" style="height: 182px;">
							<div class="txt-wrap">
								<a href="" class="subject-link tit">제목입니다!!!!<span
									data-opinion-bbs-comeidx="2775" data-opinion-bbs-uid="92831"
									data-opinion-bbs-opi="1" class="con-comment">[1]</span></a>
								<div class="user">
									<span class="layerNickName" onclick="" style="">작성자</span>
								</div>
								<div class="cnt">
									<span class="view board-img">626</span> <span
										class="like board-img">1</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card2">
						<a class="cardA" href="#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1" style="height: 182px;">
							<div class="txt-wrap">
								<a href="" class="subject-link tit">제목입니다!!!!<span
									data-opinion-bbs-comeidx="2775" data-opinion-bbs-uid="92831"
									data-opinion-bbs-opi="1" class="con-comment">[1]</span></a>
								<div class="user">
									<span class="layerNickName" onclick="" style="">작성자</span>
								</div>
								<div class="cnt">
									<span class="view board-img">626</span> <span
										class="like board-img">1</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card2">
						<a class="cardA" href="#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1" style="height: 182px;">
							<div class="txt-wrap">
								<a href="" class="subject-link tit">제목입니다!!!!<span
									data-opinion-bbs-comeidx="2775" data-opinion-bbs-uid="92831"
									data-opinion-bbs-opi="1" class="con-comment">[1]</span></a>
								<div class="user">
									<span class="layerNickName" onclick="" style="">작성자</span>
								</div>
								<div class="cnt">
									<span class="view board-img">626</span> <span
										class="like board-img">1</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card2">
						<a class="cardA" href="#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1" style="height: 182px;">
							<div class="txt-wrap">
								<a href="" class="subject-link tit">제목입니다!!!!<span
									data-opinion-bbs-comeidx="2775" data-opinion-bbs-uid="92831"
									data-opinion-bbs-opi="1" class="con-comment">[1]</span></a>
								<div class="user">
									<span class="layerNickName" onclick="" style="">작성자</span>
								</div>
								<div class="cnt">
									<span class="view board-img">626</span> <span
										class="like board-img">1</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card2">
						<a class="cardA" href="#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1" style="height: 182px;">
							<div class="txt-wrap">
								<a href="" class="subject-link tit">제목입니다!!!!<span
									data-opinion-bbs-comeidx="2775" data-opinion-bbs-uid="92831"
									data-opinion-bbs-opi="1" class="con-comment">[1]</span></a>
								<div class="user">
									<span class="layerNickName" onclick="" style="">작성자</span>
								</div>
								<div class="cnt">
									<span class="view board-img">626</span> <span
										class="like board-img">1</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card2">
						<a class="cardA" href="#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1" style="height: 182px;">
							<div class="txt-wrap">
								<a href="" class="subject-link tit">제목입니다!!!!<span
									data-opinion-bbs-comeidx="2775" data-opinion-bbs-uid="92831"
									data-opinion-bbs-opi="1" class="con-comment">[1]</span></a>
								<div class="user">
									<span class="layerNickName" onclick="" style="">작성자</span>
								</div>
								<div class="cnt">
									<span class="view board-img">626</span> <span
										class="like board-img">1</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card2">
						<a class="cardA" href="#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1" style="height: 182px;">
							<div class="txt-wrap">
								<a href="" class="subject-link tit">제목입니다!!!!<span
									data-opinion-bbs-comeidx="2775" data-opinion-bbs-uid="92831"
									data-opinion-bbs-opi="1" class="con-comment">[1]</span></a>
								<div class="user">
									<span class="layerNickName" onclick="" style="">작성자</span>
								</div>
								<div class="cnt">
									<span class="view board-img">626</span> <span
										class="like board-img">1</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card2">
						<a class="cardA" href="#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1" style="height: 182px;">
							<div class="txt-wrap">
								<a href="" class="subject-link tit">제목입니다!!!!<span
									data-opinion-bbs-comeidx="2775" data-opinion-bbs-uid="92831"
									data-opinion-bbs-opi="1" class="con-comment">[1]</span></a>
								<div class="user">
									<span class="layerNickName" onclick="" style="">작성자</span>
								</div>
								<div class="cnt">
									<span class="view board-img">626</span> <span
										class="like board-img">1</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card2">
						<a class="cardA" href="#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1" style="height: 182px;">
							<div class="txt-wrap">
								<a href="" class="subject-link tit">제목입니다!!!!<span
									data-opinion-bbs-comeidx="2775" data-opinion-bbs-uid="92831"
									data-opinion-bbs-opi="1" class="con-comment">[1]</span></a>
								<div class="user">
									<span class="layerNickName" onclick="" style="">작성자</span>
								</div>
								<div class="cnt">
									<span class="view board-img">626</span> <span
										class="like board-img">1</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card2">
						<a class="cardA" href="#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1" style="height: 182px;">
							<div class="txt-wrap">
								<a href="" class="subject-link tit">제목입니다!!!!<span
									data-opinion-bbs-comeidx="2775" data-opinion-bbs-uid="92831"
									data-opinion-bbs-opi="1" class="con-comment">[1]</span></a>
								<div class="user">
									<span class="layerNickName" onclick="" style="">작성자</span>
								</div>
								<div class="cnt">
									<span class="view board-img">626</span> <span
										class="like board-img">1</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card2">
						<a class="cardA" href="#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1" style="height: 182px;">
							<div class="txt-wrap">
								<a href="" class="subject-link tit">제목입니다!!!!<span
									data-opinion-bbs-comeidx="2775" data-opinion-bbs-uid="92831"
									data-opinion-bbs-opi="1" class="con-comment">[1]</span></a>
								<div class="user">
									<span class="layerNickName" onclick="" style="">작성자</span>
								</div>
								<div class="cnt">
									<span class="view board-img">626</span> <span
										class="like board-img">1</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="card2">
						<a class="cardA" href="#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1" style="height: 182px;">
							<div class="txt-wrap">
								<a href="" class="subject-link tit">제목입니다!!!!<span
									data-opinion-bbs-comeidx="2775" data-opinion-bbs-uid="92831"
									data-opinion-bbs-opi="1" class="con-comment">[1]</span></a>
								<div class="user">
									<span class="layerNickName" onclick="" style="">작성자</span>
								</div>
								<div class="cnt">
									<span class="view board-img">626</span> <span
										class="like board-img">1</span>
								</div>
							</div>
						</a>
					</div>
				</div>

			</div>
			<!-- 글 작성 버튼 및 검색창 -->
			<div class="d-flex justify-content-between mt-3 align-items-center">
				<!-- 글 작성 버튼 -->
				<a class="btn btn-outline-secondary" href="/freeBoard/write">글쓰기</a>
			</div>
			<!-- 검색창 -->
			<form class="d-flex justify-content-center mt-3">
				<select class="form-select me-2" aria-label="검색 유형">
					<option selected>검색 유형 선택</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="author">작성자</option>
				</select> <input class="form-control me-2" type="search"
					placeholder="검색어를 입력하세요" aria-label="검색어">
				<button class="btn btn-outline-secondary" type="submit">검색</button>
			</form>
		</div>

	</div>
</div>

<!-- 부트스트랩 자바스크립트 및 필수 자바스크립트 -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>
