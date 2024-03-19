<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Metas -->
<title>고구마 마켓</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="/assets/images/goguma_mascot.png"
	type="image/x-icon" />
<link rel="apple-touch-icon" href="/assets/images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/assets/css/bootstrap.min.css" />

<!-- Site CSS -->
<link rel="stylesheet" href="/assets/css/style.css" />
<!-- Colors CSS -->
<link rel="stylesheet" href="/assets/css/colors.css" />
<!-- ALL VERSION CSS -->
<link rel="stylesheet" href="/assets/css/versions.css" />
<!-- Responsive CSS -->
<link rel="stylesheet" href="/assets/css/responsive.css" />

<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />

<!-- Custom CSS -->
<link rel="stylesheet" href="/assets/css/custom.css" />
<link rel="stylesheet" href="/customAssets/css/market.css" />
<link rel="stylesheet" href="/customAssets/css/market2.css" />
<link rel="stylesheet" href="/customAssets/css/userProduct.css" />
<link rel="stylesheet" href="/customAssets/css/free.css" media="all" />
<link rel="stylesheet" href="/customAssets/css/emoji/list.css">
<link rel="stylesheet" href="/customAssets/css/emoji/upload.css">
<link rel="stylesheet" href="/customAssets/css/emoji/refund.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
<link rel="stylesheet" href="/customAssets/css/emoji/detail.css">
<link rel="stylesheet" href="/customAssets/css/cs/notice/list.css">
<link rel="stylesheet" href="/customAssets/css/cs/notice/detail.css">
<link rel="stylesheet" href="/customAssets/css/cs/notice/write.css">
<link rel="stylesheet" href="/customAssets/css/cs/qna/write.css">
<link rel="stylesheet" href="/customAssets/css/cs/faq/list.css">
<link rel="stylesheet" href="/customAssets/css/about/about.css">
<link rel="stylesheet" href="/customAssets/css/board/list.css">
<link rel="stylesheet" href="/customAssets/css/board/admin-cate-setting.css">
<!-- font-family -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<!-- ex 
.sunflower-light {
  font-family: "Sunflower", sans-serif;
  font-weight: 300;
  font-style: normal;
} 
-->
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Stylish&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<!-- 
.dongle-regular {
  font-family: "Dongle", sans-serif;
  font-weight: 400;
  font-style: normal;
}
 -->
 <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gamja+Flower&family=Stylish&family=Sunflower:wght@300&display=swap" rel="stylesheet">
 <!-- 
 .gamja-flower-regular {
  font-family: "Gamja Flower", sans-serif;
  font-weight: 400;
  font-style: normal;
}
  -->
 
<!-- font-family end -->
<!-- Custom CSS -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5275edbfc405960aad1f6f12211cdd04"></script>
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- stomp script -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<!-- bootstrap script -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/perfect-scrollbar/1.5.2/perfect-scrollbar.min.js"></script>
<!-- 토스티파이 -->	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="/customAssets/js/session.js"></script>
</head>
<body class="seo_version" style="background: #fff">
	<c:if test="${principal != null}">
		<input type="hidden" value="${principal.getUId()}" id="principal"/>
	</c:if>
	<header class="header header_style_01">
		<!-- nav 부분 navbar 가 안먹음 -->
		<nav
			class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0 navbar-start">
			<a href="/"
				class="navbar-brand d-flex align-items-center px-4 px-lg-5"> <img
				src="/assets/images/logo.png" style="width: 100%" height="100%">
			</a>
			<button type="button" class="navbar-toggler me-4"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav ms-auto p-4 p-lg-0">
					<a href="/" class="nav-item nav-link active">Home</a> <a href="/emoji/list"
						class="nav-item nav-link">이모티콘</a> <a href="/about"
						class="nav-item nav-link">회사 소개</a>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false">중고거래</a>
						<div class="dropdown-menu fade-down m-0">
							<a href="/product/product-list" class="dropdown-item">리스트</a> <a href="#"
								class="dropdown-item">통합검색</a>
						</div>
					</div>

					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false">고객센터</a>
						<div class="dropdown-menu fade-down m-0">
							<a href="/cs/notice/list" class="dropdown-item">공지사항</a> <a href="/cs/qna/write"
								class="dropdown-item">문의하기</a> <a href="/cs/faq/list" class="dropdown-item">자주
								묻는 질문</a>
						</div>
					</div>

					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false">자유게시판</a>
						<div class="dropdown-menu fade-down m-0">
							<a href="/board/list" class="dropdown-item">리스트</a>
							<a href="/board/cate-setting" class="dropdown-item">카테고리 수정</a>
							<a href="/" class="dropdown-item">ㅇㅇ</a>
						</div>
					</div>

					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false">채팅</a>
						<div class="dropdown-menu fade-down m-0">
							<a href="/chat/room" class="dropdown-item">채팅하기</a>
						</div>
					</div>
					<c:if test="${principal.role == 'USER'}">
					
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
						<div class="dropdown-menu fade-down m-0">
							<a href="/user/imoji" class="dropdown-item">이모티콘 목록</a> <a
								href="/user/product" class="dropdown-item">채팅 내역</a> <a href="#"
								class="dropdown-item">거래 내역</a> <a href="/user/info"
								class="dropdown-item">내 정보</a>
						</div>
					</div>
					</c:if>
					<!-- 이부분은 로그인 되었을 경우에만 표시되게 설정 -->
				</div>
				<!-- 이부분은 관리자계정으로 로그인시 표시되게 설정해야함 -->
			</div>
			<c:if test="${principal.role == 'ADMIN'}">
							<a href="/admin/user"
						class="btn btn-warning py-4 px-lg-5 d-none d-lg-block btn--login">관리자 페이지<i
						class="fa fa-arrow-right ms-3"></i></a>
			</c:if>
			<!-- 이부분은 로그인하였을 경우 로그아웃 버튼으로, 로그인하지 않았을 경우 로그인/회원가입 버튼으로 -->
			<c:choose>
				<c:when test="${principal ne null}">
					<a href="/user/logout"
						class="btn btn-warning py-4 px-lg-5 d-none d-lg-block btn--login">로그아웃<i
						class="fa fa-arrow-right ms-3"></i></a>

				</c:when>
				<c:otherwise>
					<a href="/login"
						class="btn btn-warning py-4 px-lg-5 d-none d-lg-block btn--login">로그인/회원가입<i
						class="fa fa-arrow-right ms-3"></i></a>
				</c:otherwise>
			</c:choose>
		</nav>
	</header>

	<svg id="clouds" class="hidden-xs" xmlns="http://www.w3.org/2000/svg"
		version="1.1" width="100%" height="75" viewBox="0 0 85 100"
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