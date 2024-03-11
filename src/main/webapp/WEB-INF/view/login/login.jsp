<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>

<style>
.log-container {
	width: 500px;
	margin: 100px auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center; /* 수정된 부분 */
}

.log-form-group {
	margin-bottom: 20px;
}

.log-form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.log-form-group input, .log-form-group button {
	width: calc(100% - 22px);
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.log-form-group button {
	margin-top: 10px;
	background: #06BBCC;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.log-form-group button:hover {
	background-color: #0056b3;
}

.remember-me-group {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	margin: 0 10px 10px 0;
}

.remember-me-group>label {
	font-weight: bold;
	margin-left: 5px;
}
</style>


<!-- 메인 시작 -->
<!-- Header Start -->
<div class="container-fluid bg-warning py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">로그인</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->

<div class="log-container">
	<h2>소셜 로그인</h2>
	<div class="log-form-group">
		<a href="/oauth2/authorization/kakao"> <img alt="kakao"
			src="/assets/images/kakao_login_medium_narrow.png" height="38">
		</a> <a href="/oauth2/authorization/naver"><img height="38"
			width="154.53" src="/assets/images/btnG_완성형.png" /></a>
		<p>
			<a href="/oauth2/authorization/google"> <img alt=""
				src="/assets/images/web_light_sq_ctn@4x.png" height="38"
				class="mt-3">
			</a>
		</p>
	</div>
</div>
<!-- 메인 종료 -->

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>