<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>

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
			<!-- 고구마마켓 둘러보기 시작 -->
			<div style="display: flex; align-items: center;">
				<h2 style="margin-right: auto;">
					<i class="fa-solid fa-flag me-3"></i>공지사항
				</h2>
				<a href="/notice/list" class="btn btn-warning">공지사항 바로가기</a>
				<!-- 공지사항 바로가기 버튼 -->
			</div>

			<div class="container">
				<table id="notice-table" class="table table-hover"
					style="margin-top: 30px; margin-bottom: 30px;">
					<thead class="thead-light text-center">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody class="text-center">
					</tbody>
				</table>
			</div>

			<hr class="hr1">

			<!-- Categories Start -->
			<div class="container-xxl py-5 category">
				<div class="container">
					<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
						<h6 class="section-title bg-white text-center text-primary px-3">고구마
							마켓 둘러보기</h6>
						<h1 class="mb-5">카테고리</h1>
					</div>
					<div class="row g-3">
						<div class="col-lg-7 col-md-6">
							<div class="row g-3">
								<div class="col-lg-12 col-md-12 wow zoomIn"
									data-wow-delay="0.1s">
									<a class="position-relative d-block overflow-hidden"
										href="/about"> <img class="img-fluid"
										src="/assets/images/cat-1.png" alt="">
										<div
											class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3"
											style="margin: 1px;">
											<h5 class="m-0">회사 소개</h5>
										</div>
									</a>
								</div>
								<div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.3s">
									<a class="position-relative d-block overflow-hidden"
										href="/book/list-all"> <img class="img-fluid"
										src="/assets/images/cat-2.png" alt="">
										<div
											class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3"
											style="margin: 1px;">
											<h5 class="m-0">이모티콘</h5>
										</div>
									</a>
								</div>
								<div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.5s">
									<a class="position-relative d-block overflow-hidden"
										href="/club/save"> <img class="img-fluid"
										src="/assets/images/cat-3.png" alt="">
										<div
											class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3"
											style="margin: 1px;">
											<h5 class="m-0">자유게시판</h5>
										</div>
									</a>
								</div>
							</div>
						</div>
						<div class="col-lg-5 col-md-6 wow zoomIn" data-wow-delay="0.7s"
							style="min-height: 350px;">
							<a class="position-relative d-block h-100 overflow-hidden"
								href="/share/write"> <img
								class="img-fluid position-absolute w-100 h-100"
								src="/assets/images/cat-4.png" alt="" style="object-fit: cover;">
								<div
									class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3"
									style="margin: 1px;">
									<h5 class="m-0">중고거래</h5>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Categories Start -->
		</div>
		<!-- end section -->

		<section class="section nopad cac text-center">
			<a href="#"><h3>아마도 광고 들어갈 예정</h3></a>
		</section>

		<div id="case" class="section wb">
			<div class="container">
				<div class="section-title text-center">
					<small>최신글</small>
					<h3>중고거래</h3>
					<p class="lead">We offer unlimited solutions to all your
						business needs. in the installation package we prepare search
						engine optimization, social media support, we provide corporate
						identity and graphic design services.</p>
				</div>
				<!-- end title -->

				<div class="owl-screenshots owl-carousel owl-theme text-center">
					<div class="owl-screen">
						<div class="service-widget">
							<div class="post-media entry wow fadeIn">
								<a href="/assets/uploads/version_01.jpg" data-rel="prettyPhoto[gal]"
									class="hoverbutton global-radius"><i
									class="flaticon-unlink"></i></a> <img src="/assets/uploads/version_01.jpg"
									alt="" class="img-responsive img-rounded">
								<div class="magnifier"></div>
							</div>

							<h3>Web Design Project</h3>
							<small>Landing Page</small>
						</div>
						<!-- end service -->
					</div>
					<!-- end col -->

					<div class="owl-screen">
						<div class="service-widget">
							<div class="post-media entry wow fadeIn">
								<a href="/assets/uploads/version_02.jpg" data-rel="prettyPhoto[gal]"
									class="hoverbutton global-radius"><i
									class="flaticon-unlink"></i></a> <img src="/assets/uploads/version_02.jpg"
									alt="" class="img-responsive img-rounded">
								<div class="magnifier"></div>
							</div>

							<h3>App Project</h3>
							<small>Landing Page</small>
						</div>
						<!-- end service -->
					</div>
					<!-- end col -->

					<div class="owl-screen">
						<div class="service-widget">
							<div class="post-media entry wow fadeIn">
								<a href="/assets/uploads/version_03.jpg" data-rel="prettyPhoto[gal]"
									class="hoverbutton global-radius"><i
									class="flaticon-unlink"></i></a> <img src="/assets/uploads/version_03.jpg"
									alt="" class="img-responsive img-rounded">
								<div class="magnifier"></div>
							</div>

							<h3>Watch Project</h3>
							<small>Landing Page</small>
						</div>
						<!-- end service -->
					</div>
					<!-- end col -->

					<div class="owl-screen">
						<div class="service-widget">
							<div class="post-media entry wow fadeIn">
								<a href="/assets/uploads/version_04.jpg" data-rel="prettyPhoto[gal]"
									class="hoverbutton global-radius"><i
									class="flaticon-unlink"></i></a> <img src="/assets/uploads/version_04.jpg"
									alt="" class="img-responsive img-rounded">
								<div class="magnifier"></div>
							</div>

							<h3>Hosting Project</h3>
							<small>Landing Page</small>
						</div>
						<!-- end service -->
					</div>
					<!-- end col -->

					<div class="owl-screen">
						<div class="service-widget">
							<div class="post-media entry wow fadeIn">
								<a href="/assets/uploads/version_05.jpg" data-rel="prettyPhoto[gal]"
									class="hoverbutton global-radius"><i
									class="flaticon-unlink"></i></a> <img src="/assets/uploads/version_05.jpg"
									alt="" class="img-responsive img-rounded">
								<div class="magnifier"></div>
							</div>

							<h3>SEO Project</h3>
							<small>Landing Page</small>
						</div>
						<!-- end service -->
					</div>
					<!-- end col -->
				</div>
				<!-- end owl -->
			</div>
			<!-- end container -->
		</div>
		<!-- end section -->

		<div class="parallax section lb">
			<div class="container">
				<div class="row text-center stat-wrap">
					<div class="col-md-3 col-sm-6 col-xs-12">
						<span data-scroll class="global-radius icon_wrap effect-1"><i
							class="flaticon-briefcase"></i></span>
						<p class="stat_count">1200</p>
						<h3>Complated Projects</h3>
					</div>
					<!-- end col -->

					<div class="col-md-3 col-sm-6 col-xs-12">
						<span data-scroll class="global-radius icon_wrap effect-1"><i
							class="flaticon-happy"></i></span>
						<p class="stat_count">3210</p>
						<h3>Happy Clients</h3>
					</div>
					<!-- end col -->

					<div class="col-md-3 col-sm-6 col-xs-12">
						<span data-scroll class="global-radius icon_wrap effect-1"><i
							class="flaticon-idea"></i></span>
						<p class="stat_count">3781</p>
						<h3>Customer Services</h3>
					</div>
					<!-- end col -->

					<div class="col-md-3 col-sm-6 col-xs-12">
						<span data-scroll class="global-radius icon_wrap effect-1"><i
							class="flaticon-customer-service"></i></span>
						<p class="stat_count">4300</p>
						<h3>Answered Questions</h3>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</div>
		<!-- end section -->
	</div>
</div>

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>