<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />

<!-- 메인 시작 -->
<!-- Header Start -->
<div class="all-page-title"
	style="background-image: url(/assets/images/pattern-4.png);">
	<div class="container text-center">
		<h1>마이페이지</h1>
	</div>
	<!--End Page-->
</div>
<!-- end section -->

<svg id="clouds" class="hidden-xs" xmlns="http://www.w3.org/2000/svg"
	version="1.1" width="100%" height="100" viewBox="0 0 85 100"
	preserveAspectRatio="none">
        <path
		d="M-5 100 Q 0 20 5 100 Z
            M0 100 Q 5 0 10 100
            M5 100 Q 10 30 15 100
            M10 100 Q 15 10 20 100
            M15 100 Q 20 30 25 100
            M20 100 Q 25 -10 30 100
            M25 100 Q 30 10 35 100
            M30 100 Q 35 30 40 100
            M35 100 Q 40 10 45 100
            M40 100 Q 45 50 50 100
            M45 100 Q 50 20 55 100
            M50 100 Q 55 40 60 100
            M55 100 Q 60 60 65 100
            M60 100 Q 65 50 70 100
            M65 100 Q 70 20 75 100
            M70 100 Q 75 45 80 100
            M75 100 Q 80 30 85 100
            M80 100 Q 85 20 90 100
            M85 100 Q 90 50 95 100
            M90 100 Q 95 25 100 100
            M95 100 Q 100 15 105 100 Z">
        </path>
    </svg>
<!-- Header End -->

<div class="user-page"
	style="display: flex; margin: 100px auto; width: 100%; max-width: 1450px; height: auto; justify-content: space-between; align-items: flex-start;">
	<!-- aside -->
	<%@ include file="/WEB-INF/view/user/myPageAside.jsp"%>
	<!-- aside end -->
	<div id="flexBox" style="display: flex; flex-wrap: wrap; margin-left: 5%;">
		<!-- 개별 카드 시작 -->
		<div class="card-container">
			<h4 class="user-page-title">내 게시글</h4>
			<div class="w3-card-4">
				<img src="/customAssets/images/sweet_potato_image.png" alt="Alps">
				<div class="w3-container w3-center">
					<p>The Italian / Austrian Alps</p>
				</div>
			</div>
		</div>
		<!-- 개별 카드 엔드 -->
		<!-- 개별 카드 시작 -->
		<div class="card-container">
			<h4 class="user-page-title">내 게시글</h4>
			<div class="w3-card-4">
				<img src="/customAssets/images/sweet_potato_image.png" alt="Alps">
				<div class="w3-container w3-center">
					<p>The Italian / Austrian Alps</p>
				</div>
			</div>
		</div>
		<!-- 개별 카드 엔드 -->
		<!-- 개별 카드 시작 -->
		<div class="card-container">
			<h4 class="user-page-title">내 게시글</h4>
			<div class="w3-card-4">
				<img src="/customAssets/images/sweet_potato_image.png" alt="Alps">
				<div class="w3-container w3-center">
					<p>The Italian / Austrian Alps</p>
				</div>
			</div>
		</div>
		<!-- 개별 카드 엔드 -->
		<!-- 개별 카드 시작 -->
		<div class="card-container">
			<h4 class="user-page-title">내 게시글</h4>
			<div class="w3-card-4">
				<img src="/customAssets/images/sweet_potato_image.png" alt="Alps">
				<div class="w3-container w3-center">
					<p>The Italian / Austrian Alps</p>
				</div>
			</div>
		</div>
		<!-- 개별 카드 엔드 -->
		<!-- 개별 카드 시작 -->
		<div class="card-container">
			<h4 class="user-page-title">내 게시글</h4>
			<div class="w3-card-4">
				<img src="/customAssets/images/sweet_potato_image.png" alt="Alps">
				<div class="w3-container w3-center">
					<p>The Italian / Austrian Alps</p>
				</div>
			</div>
		</div>
		<!-- 개별 카드 엔드 -->
		<!-- 개별 카드 시작 -->
		<div class="card-container">
			<h4 class="user-page-title">내 게시글</h4>
			<div class="w3-card-4">
				<img src="/customAssets/images/sweet_potato_image.png" alt="Alps">
				<div class="w3-container w3-center">
					<p>The Italian / Austrian Alps</p>
				</div>
			</div>
		</div>
		<!-- 개별 카드 엔드 -->
		<!-- 개별 카드 시작 -->
		<div class="card-container">
			<h4 class="user-page-title">내 게시글</h4>
			<div class="w3-card-4">
				<img src="/customAssets/images/sweet_potato_image.png" alt="Alps">
				<div class="w3-container w3-center">
					<p>The Italian / Austrian Alps</p>
				</div>
			</div>
		</div>
		<!-- 개별 카드 엔드 -->
	</div>
</div>
<!-- 메인 종료 -->

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>