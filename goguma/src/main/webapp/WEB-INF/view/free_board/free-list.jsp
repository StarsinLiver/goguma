<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>

<!-- 부트스트랩 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
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

/* background 적용 css */
.mt-4 {
	margin-top: -0.5rem !important;
	/* background-image: url("/images/upload/bg1.jpg"); */
	background-image: url("/images/upload/${type.backGround}");
	background-size: cover; /* 이미지를 요소에 맞게 조절 */
	background-repeat: no-repeat; /* 이미지 반복을 하지 않음 */
}

/* 폰트 적용을 위한 css */
.col-lg-8 {
	font-family: ${	type.font},sans-serif;
	font-size:large;
}

.h2font {
	font-family: ${	type.font},sans-serif;
	font-size:large;
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
	background: white;
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

.cardType{
    display: flex;
    flex-wrap: wrap;

}

/* 폰트 적용을 위한 css end */
</style>

<div class="container mt-4"
	style="display: flex; width: 5000px; max-width: 100%">
	<!-- aside 시작 -->
	<div
		style="width: 13.6%; width: 13.6%; display: flex; flex-direction: column; align-items: flex-start; border-right: 1px solid;">
		<%@ include file="/WEB-INF/view/free_board/free_board_aside.jsp"%>
	</div>
	<!-- aside 끝 -->
	<div class="row justify-content-center" style="width: 2500px;">
	<!-- 배너 출력 start -->
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="max-height: 200px; max-width: 1000px; margin: 20px">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <a href="#"><img src="/images/upload/bg1.jpg" class="d-block w-100" alt="..." style="max-height: 200px; max-width: 1000px"></a>
		    </div>
		    <div class="carousel-item">
		      <a href="#"><img src="/images/upload/bg2.jpg" class="d-block w-100" alt="..." style="max-height: 200px; max-width: 1000px"></a>
		    </div>
		    <div class="carousel-item">
		      <a href="#"><img src="/images/upload/bg3.jpg" class="d-block w-100" alt="..." style="max-height: 200px; max-width: 1000px"></a>
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
		<!-- 배너 출력 end -->
		<div class="col-lg-8">
			<h2 class="h2font">
				게시판 - 카테고리 이름 <a href="/freeBoard/main" style="float: right;">메인으로</a>
			</h2>
			<!-- 리스트 테이블 -->
			<input type="text" value="${type.listType}" id="listType" />
			<button style="display: none;" class="typeValue" id="typeValue"
				data-value="${type.listType}"></button>
				
				<!-- 카드타입 출력 위치 -->
				<div class="cardType" >
				</div>
				
				<!-- 리스트 타입 출력 위치 -->
				<div class="listData" >
				</div>
			
			<!-- 글 작성 버튼 및 검색창 -->
			<div class="d-flex justify-content-between mt-3 align-items-center">
				<!-- 페이징 버튼 -->
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<!-- 여기서 부터 페이징 생성 예정 -->


					</ul>
				</nav>
				<!-- 글 작성 버튼 -->
				<a class="btn btn-outline-secondary" href="/freeBoard/write">글쓰기</a>
			</div>
			<!-- 검색창 -->
			<form class="d-flex justify-content-center mt-3">
				<select class="form-select me-2 selectOption" aria-label="검색 유형">
					<option selected>검색 유형 선택</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="author">작성자</option>
				</select> <input class="form-control me-2 search" type="search"
					placeholder="검색어를 입력하세요" aria-label="검색어">
				<button class="btn btn-outline-secondary" type="submit">검색</button>
			</form>
		</div>
	</div>
</div>
<!-- 부트스트랩 자바스크립트 및 필수 자바스크립트 -->
<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
	
<script src="/customAssets/js/free-board/free_list.js"></script>

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>