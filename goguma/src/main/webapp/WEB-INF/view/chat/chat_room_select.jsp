<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/chat_room.css" />

<div>
	<div id="home" class="parallax first-section"
		data-stellar-background-ratio="0.4"
		style="background-image: url('/assets/uploads/background-12.png');">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-12">
					<div class="big-tagline">
						<h2>
							당신 근처의 <br> 지역 생활 커뮤니티
						</h2>
						<p class="lead">고민없이 구매 가능한 마켓 고구마 마켓에서 가까운 이웃과 함께해요.</p>
						<a href="#support"
							class="btn btn-light btn-radius btn-brd ban-btn">중고 거래 이용하기</a>
					</div>
				</div>

				<div class="app_iphone_02 wow slideInUp hidden-xs hidden-sm"
					data-wow-duration="1s" data-wow-delay="0.5s">
					<img src="/assets/uploads/rocket.png" alt="" class="img-responsive">
				</div>
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
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

	<div id="about" class="section wb nopadtop">
		<div class="container">

<!-- 메인 시작 -->
<div id="main-cards" class="row">
    <div class="col-md-6 col-sm-12 mb-4">
        <div class="card shadow">
        <a href="/chat/room">
            <img class="card-img-top" src="/customAssets/images/sweet_potato_image.png" alt="고구마 이미지">
            <div class="card-body">
                <h5 class="card-title text-center">마켓 고구마</h5>
                <p class="card-text text-center">자신의 상품과 관련된 채팅</p>
                <div class="text-center">
                    <a href="#" class="btn btn-primary btn-sm">채팅 이용하기</a>
                </div>
            </div>
            </a>
        </div>
    </div>
    <div class="col-md-6 col-sm-12 mb-4">
        <div class="card shadow">
                <a href="/chat/room">
            <img class="card-img-top" src="/customAssets/images/sweet_potato_image2.png" alt="고구마 이미지">
            <div class="card-body">
                <h5 class="card-title text-center">마켓 고구마</h5>
                <p class="card-text text-center">자신이 사고싶은 상품과 관련된 채팅</p>
                <div class="text-center">
                    <a href="#" class="btn btn-primary btn-sm">채팅 이용하기</a>
                </div>
                
            </div>
        </div>
    </div>
</div>
<!-- 메인 종료 -->


			<!-- end section -->
		</div>
	</div>
</div>

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>