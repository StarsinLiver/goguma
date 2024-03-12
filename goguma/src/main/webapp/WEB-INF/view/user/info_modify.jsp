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
<!--  
    Stylesheets
    =============================================
    
    -->
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');

/* 로그인폼 스타일 */
* {
	box-sizing: border-box;
}

h2 {
	text-align: center;
	margin: 0 0 20px;
}

.sbody {
	display: block;
}

.form {
	padding: 30px 40px;
}

.register-form {
	margin-bottom: 10px;
	padding-bottom: 20px;
	position: relative;
}

.register-form label {
	color: #777;
	display: block;
}

.register-form input {
	border: 2px solid #f0f0f0;
	border-radius: 4px;
	display: block;
	width: 100%;
	padding: 10px;
	font-size: 14px;
}

.register-form input:focus {
	outline: 0;
	border-color: #777;
}

.register-form.success input {
	border-color: var(--success-color);
}

.register-form.error input {
	border-color: var(--error-color);
}

.register-form small {
	color: var(--error-color);
	position: absolute;
	bottom: 0;
	left: 0;
	visibility: hidden;
}

.register-form.error small {
	visibility: visible;
}

/* 라디오 버튼 */
.form_radio_btn {
	width: 47%;
	height: 45px;
	border: 1px solid #EAE7E7;
	border-radius: 10px;
	float: left;
}

.form_radio_btn input[type=radio] {
	display: none;
}

.form_radio_btn label {
	display: block;
	border-radius: 10px;
	margin: 0 auto;
	text-align: center;
	height: -webkit-fill-available;
	line-height: 45px;
}

/* Checked */
.form_radio_btn input[type=radio]:checked+label {
	background: #777;
	color: #fff;
}

/* Hover */
.form_radio_btn label:hover {
	color: #666;
}

/* Disabled */
.form_radio_btn input[type=radio]+label {
	background: #F9FAFC;
	color: #666;
}
</style>

<!-- Header Start -->
<div class="all-page-title" style="background-image:url(/assets/images/pattern-4.png);">
        <div class="container text-center">
            <h1>마이페이지</h1>
        </div>
        <!--End Page-->
    </div><!-- end section -->

    <svg id="clouds" class="hidden-xs" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100" viewBox="0 0 85 100" preserveAspectRatio="none">
        <path d="M-5 100 Q 0 20 5 100 Z
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

<!--   회원가입 폼 시작 -->
<section class="module">
	<div class="container"
		style="background: #fff; border-radius: 5px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3); width: 550px; margin-top: 5%; margin-bottom: 5%">
			<h2 style="margin-top: 10px;">Register With Us</h2>
			<form action="/user/modify" id="form" class="form" method="post" enctype="multipart/form-data">
			<div class="register-form">
				<div style="margin-bottom: 10px;">
					<img class="rounded-circle mt-5" id="profileImage"
					style="border-radius: 50%; overflow: hidden; width: 180px; height: 180px; border:1px solid #ccc;"
					src="/assets/images/goguma_mascot.png">
					<label for="file">profile</label>
					<input type="file" name="file" onchange="readURL(this);"/>
					<span>사진 크기 권장 사이즈 128px,용량 최대 250KB</span>
				</div>
				<label for="Address">Address</label> <input type="text" name="zip"
					id="zip" placeholder="Enter Adress" onclick="zipcode()" readonly />
				<span class="msgZip"></span>
				<div>
					<input type="text" name="addr1" id="addr1" size="50"
						placeholder="Search Address" readonly />
				</div>
				<div>
					<input type="text" name="addr2" id="addr2" size="50"
						placeholder="Address Detail" />
				</div>
			</div>
			<div class="register-form">
				<label for="usertel">tel</label> <input type="text" name="tel"
					id="tel" placeholder="Enter tel" /> <span class="msgTel"> - 포함
					13자리를 입력하세요.</span>
				</td>
			</div>
			<br> 
			<br> 
			<br> 
			<br>
			<!-- TODO: 버튼에 좌우 마진 잡혀 있어서 그런지 크기가 안커짐 나중에 수정 요망 -->
			<button type="submit" class="btn btn-warning" id="socialRegister"
				name="socialRegister"
				style="margin: auto; display: block; width:250px; padding: 20px; border-radius: 10px;">수정하기</button>
		</form>
	</div>
</section>
<!-- 회원가입 폼 종료 -->
<!-- 메인 종료 -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/customAssets/js/oauth/zipcode.js"></script>

<script>
	function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('profileImage').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('profileImage').src = "";
	  }
	}
</script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>