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
</style>

<!-- 메인 컨텐츠 -->
<div class="container mt-4">
	<div class="row justify-content-center">
		<section class="section nopad cac text-center" style="width: 67%;">
			<a href="#"><h3>아마도 광고 들어갈 예정</h3></a>
		</section>
		<div class="col-lg-4">
			<h2>베스트 사진게시물</h2>
			<div class="row">
				<div class="col-md-6 mb-3">
					<div class="card2">
						<a href="/#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1">
							<p>제목</p>
						</a>
					</div>
				</div>
				<div class="col-md-6 mb-3">
					<div class="card2">
						<a href="/#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1">
							<p>제목</p>
						</a>
					</div>
				</div>
				<div class="col-md-6 mb-3">
					<div class="card2">
						<a href="/#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1">
							<p>제목</p>
						</a>
					</div>
				</div>
				<div class="col-md-6 mb-3">
					<div class="card2">
						<a href="/#"> <img src="/assets/images/cat-1.png"
							class="card2-img-top" alt="이미지 1">
							<p>제목</p>
						</a>
					</div>
				</div>

			</div>
		</div>

		<!-- 리스트 형식의 글 목록 -->
		<div class="col-lg-4">
			<h2>베스트 게시물</h2>
			<ul class="list-group">
				<li class="list-group-item">
					<td><a href=""> 어려운 자유게시판<span class="badge bg-secondary">[0]</span></a>
				</td>
					<td class="text-center"><span class="badge bg-primary"
						style="float: right;">105</span></td>
				</li>
				<li class="list-group-item">
					<td><a href=""> 어려운 자유게시판<span class="badge bg-secondary">[0]</span></a>
				</td>
					<td class="text-center"><span class="badge bg-primary"
						style="float: right;">105</span></td>
				</li>
				<li class="list-group-item">
					<td><a href=""> 어려운 자유게시판<span class="badge bg-secondary">[0]</span></a>
				</td>
					<td class="text-center"><span class="badge bg-primary"
						style="float: right;">105</span></td>
				</li>
				<li class="list-group-item">
					<td><a href=""> 어려운 자유게시판<span class="badge bg-secondary">[0]</span></a>
				</td>
					<td class="text-center"><span class="badge bg-primary"
						style="float: right;">105</span></td>
				</li>
				<li class="list-group-item">
					<td><a href=""> 어려운 자유게시판<span class="badge bg-secondary">[0]</span></a>
				</td>
					<td class="text-center"><span class="badge bg-primary"
						style="float: right;">105</span></td>
				</li>
				<li class="list-group-item">
					<td><a href=""> 어려운 자유게시판<span class="badge bg-secondary">[0]</span></a>
				</td>
					<td class="text-center"><span class="badge bg-primary"
						style="float: right;">105</span></td>
				</li>
			</ul>
		</div>

		<div class="container mt-8">
			<div class="row justify-content-center">
				<!-- 첫 번째 섹션 -->
				<div class="col-lg-3" style="width: 22%;">
					<h2>카테고리</h2>
					<div class="row">
						<div class="col-md-6 mb-3">
							<div class="card2">
								<a href="/#"> <img src="/assets/images/cat-1.png"
									class="card2-img-top" alt="이미지 1">
									<p>제목</p>
								</a>
							</div>
						</div>
						<div class="col-md-6 mb-3">
							<div class="card2">
								<a href="/#"> <img src="/assets/images/cat-1.png"
									class="card2-img-top" alt="이미지 1">
									<p>제목</p>
								</a>
							</div>
						</div>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href=""> 어려운 자유게시판<span
								class="badge bg-secondary">[0]</span></a> <span
							class="badge bg-primary" style="float: right;">105</span></li>
						<li class="list-group-item"><a href=""> 어려운 자유게시판<span
								class="badge bg-secondary">[0]</span></a> <span
							class="badge bg-primary" style="float: right;">105</span></li>
						<li class="list-group-item"><a href=""> 어려운 자유게시판<span
								class="badge bg-secondary">[0]</span></a> <span
							class="badge bg-primary" style="float: right;">105</span></li>
					</ul>
				</div>

				<!-- 두 번째 섹션 -->
				<div class="col-lg-3" style="width: 22%;">
					<h2>카테고리</h2>
					<div class="row">
						<div class="col-md-6 mb-3">
							<div class="card2">
								<a href="/#"> <img src="/assets/images/cat-1.png"
									class="card2-img-top" alt="이미지 1">
									<p>제목</p>
								</a>
							</div>
						</div>
						<div class="col-md-6 mb-3">
							<div class="card2">
								<a href="/#"> <img src="/assets/images/cat-1.png"
									class="card2-img-top" alt="이미지 1">
									<p>제목</p>
								</a>
							</div>
						</div>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href=""> 어려운 자유게시판<span
								class="badge bg-secondary">[0]</span></a> <span
							class="badge bg-primary" style="float: right;">105</span></li>
						<li class="list-group-item"><a href=""> 어려운 자유게시판<span
								class="badge bg-secondary">[0]</span></a> <span
							class="badge bg-primary" style="float: right;">105</span></li>
						<li class="list-group-item"><a href=""> 어려운 자유게시판<span
								class="badge bg-secondary">[0]</span></a> <span
							class="badge bg-primary" style="float: right;">105</span></li>
					</ul>
				</div>

				<!-- 세 번째 섹션 -->
				<div class="col-lg-3" style="width: 22%;">
					<h2>카테고리</h2>
					<div class="row">
						<div class="col-md-6 mb-3">
							<div class="card2">
								<a href="/#"> <img src="/assets/images/cat-1.png"
									class="card2-img-top" alt="이미지 1">
									<p>제목</p>
								</a>
							</div>
						</div>
						<div class="col-md-6 mb-3">
							<div class="card2">
								<a href="/#"> <img src="/assets/images/cat-1.png"
									class="card2-img-top" alt="이미지 1">
									<p>제목</p>
								</a>
							</div>
						</div>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><a href=""> 어려운 자유게시판<span
								class="badge bg-secondary">[0]</span></a> <span
							class="badge bg-primary" style="float: right;">105</span></li>
						<li class="list-group-item"><a href=""> 어려운 자유게시판<span
								class="badge bg-secondary">[0]</span></a> <span
							class="badge bg-primary" style="float: right;">105</span></li>
						<li class="list-group-item"><a href=""> 어려운 자유게시판<span
								class="badge bg-secondary">[0]</span></a> <span
							class="badge bg-primary" style="float: right;">105</span></li>
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

<!-- 부트스트랩 자바스크립트 및 필수 자바스크립트 -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>
