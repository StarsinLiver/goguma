<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/product/userProduct.css">
<style>
/* 추가적인 CSS 스타일링은 여기에 추가할 수 있습니다. */
/* 검색창 스타일링 */
.search-form {
	width: calc(50% - 5px); /* 검색창 폭 조절 */
}

/* 검색 유형 선택 셀렉트 박스 스타일링 */
.search-select {
	width: calc(50% - 5px); /* 셀렉트 박스 폭 조절 */
}

h2 {
	background-color: #f2f2f2;
	padding: 10px;
	margin-top: 20px;
}

.card2 a {
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	transition: transform 0.3s ease;
	position: relative;
	display: flex;
	flex-direction: column;
	border: 1px solid rgba(0, 0, 0, 0.125);
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
	margin: 0px 0px -9px -20px;
	width: 14px;
	height: 9px;
	background-position: -299px -11px;
}

.cnt .like::before {
	content: "";
	top: 4px;
	margin: 0px 15px -15px -20px;
	width: 17px;
	height: 15px;
	background-position: -326px -7px;
}

.list-group-item {
	display: flex; /* Flexbox를 사용하여 수평 정렬 설정 */
	justify-content: space-between; /* 요소 간의 간격을 최대로 설정하여 오른쪽 정렬 */
	align-items: center; /* 수직 가운데 정렬 설정 */
}

.list-group-item .text-center {
	flex-grow: 1; /* 남은 공간을 모두 차지하도록 설정 */
	text-align: right; /* 텍스트를 오른쪽 정렬 */
}

.list-group-item .cnt {
	display: flex; /* Flexbox를 사용하여 내부 요소를 수평 정렬 */
	align-items: center; /* 수직 가운데 정렬 설정 */
}

.list-group-item .cnt .board-img {
	margin-left: 30px; /* 이미지와 텍스트 사이에 간격 추가 */
}

.list-group-item a {
	display: block;
	width: 220px; /* 원하는 너비 설정 */
	white-space: nowrap; /* 줄 바꿈 방지 */
	overflow: hidden; /* 내용이 넘칠 경우 숨김 처리 */
	text-overflow: ellipsis; /* 넘친 내용을 ...으로 표시 */
}

.card-details {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	color: #fff;
	padding: 10px;
	text-align: center;
}
</style>

<!-- 메인 컨텐츠 -->
<!-- aside 시작 -->
<div style="display: flex;">
<div
	style="width: 13.6%; width: 13.6%; display: flex; flex-direction: column; align-items: flex-start; border-right: 1px solid;">
	<%@ include file="/WEB-INF/view/free_board/free_board_aside.jsp"%>
</div>
<!-- aside 끝 -->
<div class="container mt-4">

	<div class="row justify-content-center">
		<section class="section nopad cac text-center" style="width: 67%;">
			<a href="#"><h3>아마도 광고 들어갈 예정</h3></a>
		</section>
		<div class="col-lg-4">
			<h2>
				베스트 사진게시물<a href="/freeBoard/card" style="float: right;">더보기</a>
			</h2>
			<div class="row">
				<c:forEach var="board" items="${boardList}" varStatus="loop">
					<c:if test="${loop.index < 4}">
						<div class="col-md-6 mb-3">
							<div class="card2" onmouseover="highlightCard(this)"
								onmouseout="unhighlightCard(this)">
								<a href="#"> <img src="/images/upload/${board.file}"
									class="card2-img-top" alt="${board.title} 이미지"
									style="height: 105px">
									<div class="card-details">
										<p>${board.title}</p>
										<p>작성자닉네임</p>
									</div>
								</a>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>

		<!-- 리스트 형식의 글 목록 -->
		<div class="col-lg-4">
			<h2>
				베스트 게시물<a href="/freeBoard/list" style="float: right;">더보기</a>
			</h2>
			<ul class="list-group">
				<c:forEach var="board" items="${rDList}" varStatus="loop">
					<c:if test="${loop.index < 6}">
						<li class="list-group-item">
							<td><a href="">${board.title}</a></td>
							<td class="text-center">
								<div class="cnt">
									<span class="view board-img">626</span> <span
										class="like board-img">${board.goodCount}</span>
								</div>
						</td>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>

		<div class="container mt-8">
			<div class="row justify-content-center">
				<div class="col-lg-3" style="width: 22%;">
					<h2>카테고리</h2>
					<div class="row">
						<c:forEach var="board" items="${boardList}" varStatus="loop">
							<c:if test="${loop.index < 2}">
								<div class="col-md-6 mb-3">
									<div class="card2" onmouseover="highlightCard(this)"
										onmouseout="unhighlightCard(this)">
										<a href="#"> <img src="/images/upload/${board.file}"
											class="card2-img-top" alt="${board.title} 이미지"
											style="height: 105px">
											<div class="card-details">
												<p>${board.title}</p>
											</div>
										</a>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<ul class="list-group">
						<c:forEach var="board" items="${rDList}" varStatus="loop">
							<c:if test="${loop.index < 4}">
								<li class="list-group-item">
									<td><a href="">${board.title}</a></td>
									<td class="text-center">
										<div class="cnt">
											<span class="view board-img">626</span> <span
												class="like board-img">${board.goodCount}</span>
										</div>
								</td>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>

				<div class="col-lg-3" style="width: 22%;">
					<h2>카테고리</h2>
					<div class="row">
						<c:forEach var="board" items="${boardList}" varStatus="loop">
							<c:if test="${loop.index < 2}">
								<div class="col-md-6 mb-3">
									<div class="card2" onmouseover="highlightCard(this)"
										onmouseout="unhighlightCard(this)">
										<a href="#"> <img src="/images/upload/${board.file}"
											class="card2-img-top" alt="${board.title} 이미지"
											style="height: 105px">
											<div class="card-details">
												<p>${board.title}</p>
											</div>
										</a>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<ul class="list-group">
						<c:forEach var="board" items="${rDList}" varStatus="loop">
							<c:if test="${loop.index < 4}">
								<li class="list-group-item">
									<td><a href="">${board.title}</a></td>
									<td class="text-center">
										<div class="cnt">
											<span class="view board-img">626</span> <span
												class="like board-img">${board.goodCount}</span>
										</div>
								</td>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>

				<div class="col-lg-3" style="width: 22%;">
					<h2>카테고리</h2>
					<div class="row">
						<c:forEach var="board" items="${rDList}" varStatus="loop">
							<c:if test="${loop.index < 2}">
								<div class="col-md-6 mb-3">
									<div class="card2" onmouseover="highlightCard(this)"
										onmouseout="unhighlightCard(this)">
										<a href="#"> <img src="/images/upload/${board.file}"
											class="card2-img-top" alt="${board.title} 이미지"
											style="height: 105px">
											<div class="card-details">
												<p>${board.title}</p>
											</div>
										</a>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<ul class="list-group">
						<c:forEach var="board" items="${rDList}" varStatus="loop">
							<c:if test="${loop.index < 4}">
								<li class="list-group-item">
									<td><a href="">${board.title}</a></td>
									<td class="text-center">
										<div class="cnt">
											<span class="view board-img">626</span> <span
												class="like board-img">${board.goodCount}</span>
										</div>
								</td>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-6" style="width: 66.66%;">
			<div class="owl-screenshots owl-carousel owl-theme text-center">
				<div class="owl-screen">
					<div class="service-widget">
						<div class="post-media entry wow fadeIn">
							<a href="/images/upload/#" data-rel="prettyPhoto[gal]"
								class="hoverbutton global-radius"><i class="flaticon-unlink"></i></a>
							<img src="/images/upload/#" alt=""
								class="img-responsive img-rounded">
							<div class="magnifier"></div>
						</div>
						<h3>이름</h3>
						<small><a href="/product/productDetail?pId=1">지금 올라온 글</a></small>
					</div>
				</div>
				<div class="owl-screen">
					<div class="service-widget">
						<div class="post-media entry wow fadeIn">
							<a href="/images/upload/#" data-rel="prettyPhoto[gal]"
								class="hoverbutton global-radius"><i class="flaticon-unlink"></i></a>
							<img src="/images/upload/#" alt=""
								class="img-responsive img-rounded">
							<div class="magnifier"></div>
						</div>
						<h3>이름</h3>
						<small><a href="/product/productDetail?pId=1">지금 올라온 글</a></small>
					</div>
				</div>
				<div class="owl-screen">
					<div class="service-widget">
						<div class="post-media entry wow fadeIn">
							<a href="/images/upload/#" data-rel="prettyPhoto[gal]"
								class="hoverbutton global-radius"><i class="flaticon-unlink"></i></a>
							<img src="/images/upload/#" alt=""
								class="img-responsive img-rounded">
							<div class="magnifier"></div>
						</div>
						<h3>이름</h3>
						<small><a href="/product/productDetail?pId=1">지금 올라온 글</a></small>
					</div>
				</div>
				<div class="owl-screen">
					<div class="service-widget">
						<div class="post-media entry wow fadeIn">
							<a href="/images/upload/#" data-rel="prettyPhoto[gal]"
								class="hoverbutton global-radius"><i class="flaticon-unlink"></i></a>
							<img src="/images/upload/#" alt=""
								class="img-responsive img-rounded">
							<div class="magnifier"></div>
						</div>
						<h3>이름</h3>
						<small><a href="/product/productDetail?pId=1">지금 올라온 글</a></small>
					</div>
				</div>
				<div class="owl-screen">
					<div class="service-widget">
						<div class="post-media entry wow fadeIn">
							<a href="/images/upload/#" data-rel="prettyPhoto[gal]"
								class="hoverbutton global-radius"><i class="flaticon-unlink"></i></a>
							<img src="/images/upload/#" alt=""
								class="img-responsive img-rounded">
							<div class="magnifier"></div>
						</div>
						<h3>이름</h3>
						<small><a href="/product/productDetail?pId=1">지금 올라온 글</a></small>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- 부트스트랩 자바스크립트 및 필수 자바스크립트 -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<script>
	function highlightCard(card) {
		var details = card.querySelector('.card-details');
		details.style.display = 'block';
	}

	function unhighlightCard(card) {
		var details = card.querySelector('.card-details');
		details.style.display = 'none';
	}
</script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>
