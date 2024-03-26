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

<!--   회원가입 폼 시작 -->
<section class="module">
	<div class="container"
		style="background: #fff; border-radius: 5px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3); width: 550px; margin-top: 5%; margin-bottom: 5%">
		<form action="/oauth/register" id="form" class="form" method="post">
			<h2>Register With Us</h2>
			<div class="register-form">
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
                style="margin: auto; display: block;    font-size: large;   margin: auto;
                display: block;   height: 60px;    width: 150px;">가입 하기</button>
		</form>
	</div>
</section>
<!-- 회원가입 폼 종료 -->
<!-- 메인 종료 -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/customAssets/js/oauth/zipcode.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>