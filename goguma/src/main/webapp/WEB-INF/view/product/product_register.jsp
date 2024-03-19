<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/product/userProduct.css">
<style>
.chat-button {
	border: 1px solid red;
	float: inline-end;
	margin-right: 5px;
}

.darken-on-hover:hover {
	filter: brightness(85%);
}
</style>

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
<!-- include Summernote CSS -->
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

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

<section class="module">
	<div class="container"
		style="background: #fff; border-radius: 5px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3); width: 800px; margin-top: 5%; margin-bottom: 5%">
		<form action="/product/write" id="form" class="form" method="post" enctype="multipart/form-data">
			<h2>상품 등록</h2>
			
			<div>
			    <div class="d-flex flex-column align-items-center text-center p-3 py-5"
			        style="position: relative;">
			        <label for="fileInput" style="">썸네일</label>
			        <img class="mt-5" id="profileImage" 
			            style="border: 1px solid #ccc;height: 200px;" src="/assets/images/goguma_mascot.png">
			        <input type="file" id="fileInput" name="file" multiple="multiple" style="display: none;" onchange="readURL(this);"  value="/assets/images/goguma_mascot.png" />
			    </div>
			</div>	
			<div class="register-form">
				<label for="name">제목</label> <input type="text" name="name"
					id="name" placeholder="Enter name" /> 
			</div>
			<div class="register-form">
				<label for="price">비용</label> <input type="number" name="price" min="0" value="0" step="1000"
					id="price" placeholder="Enter price" /> 
			</div>
			<div class="register-form">
				<label for="Address">주소</label> <input type="text" name="zip"
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
				<label for="summernote">설명</label>
				<textarea id="summernote" style="width: 100%;" name="description"></textarea>
			</div>
			<br> 
			<br> 
			<br> 
			<br>
			<!-- TODO: 버튼에 좌우 마진 잡혀 있어서 그런지 크기가 안커짐 나중에 수정 요망 -->
			<button type="submit" class="btn btn-warning" id="socialRegister"
				style="margin: auto; display: block; background-color: #FFD800; width:250px;">등록하기</button>
		</form>
	</div>
</section>
<!-- 메인 섹션 종료 -->
<!-- Summernote 초기화 스크립트 -->
<script>

	// 썸머노트
	$('#summernote').summernote(
			{
				placeholder : '상세 내용을 적어주세요.',
				tabsize : 2,
				height : 120,
				toolbar : [ [ 'style', [ 'style' ] ],
						[ 'font', [ 'bold', 'underline', 'clear' ] ],
						[ 'color', [ 'color' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'table', [ 'table' ] ],
						[ 'insert', [ 'link', 'picture', 'video' ] ],
						[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
			});
</script>
<script>
// 중첩
 $('#profileImage').click(function() {
        
        $('#fileInput').click();
    });
    
    // 사진 미리보기
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/customAssets/js/oauth/zipcode.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>