<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />


<style>
	#myProgress {
	  width: 450px;
	  background-color: #e9ecef;
	}
	

	#myBar {
	  width: 10%;
	  height: 30px;
	  text-align: center; 
	  line-height: 30px;
	  color: white;
	}
</style>

<!-- 메인 시작 -->
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

<div class="user-page">

	<!-- aside -->
	<%@ include file="/WEB-INF/view/user/myPageAside.jsp"%>
	<!-- aside end -->
	
	<div class="info-container">
		<h4 class="user-page-title">내 정보</h4>
		<div class="top-info">
			
			<img class="rounded-circle mt-5" id="profileImage"
				style="border-radius: 50%; overflow: hidden; width: 180px; height: 180px; border:1px solid #ccc;"
				src="/profile/${user.file}" onerror="this.src='/assets/images/goguma_mascot.png'">
				
			<table class="table-count">
				<thead>
					<tr>
					  <th>게시글 수</th>
					  <th>문의 수</th>
					  <th>찜 갯수</th>
					</tr>
				</thead>
				<tbody>
				    <tr>
				      <td>${user.countProduct}</td>
				      <td>${user.countQna}</td>
				      <td>${user.countWishList}</td>
				    </tr>
			    </tbody>
			</table>
			
			<!-- 내 평판 -->
			<div class="user-report" style="position: absolute;right: 40px;top: 230px;">
				<p style="display: inline-block;">내 온도</p>
				<div id="myProgress">
				  <div id="myBar"></div>
				</div>
			</div>
		</div>
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="row" colspan="2">내 정보</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">이메일</th>
		      <td>${user.email}</td>
		    </tr>
		    <tr>
		      <th scope="row">휴대폰</th>
		      <td>${user.tel}</td>
		    </tr>
		    <tr>
		      <th scope="row">우편번호</th>
		      <td>${user.zip}</td>
		    </tr>
		    <tr>
		      <th scope="row">주소</th>
		      <td>${user.address}</td>
		    </tr>
		    <tr>
		      <th scope="row">가입일자</th>
		      <td>${user.createAt}</td>
		    </tr>
		  </tbody>
		</table>
		<p style="color: #939393;font-size: 12px;">※ 정보 수정은 프로필 사진, 휴대폰 번호, 주소만 가능합니다.</p>
		
		<div class="links">
			<!-- <a href="#" class="btn btn-danger">탈퇴하기</a> -->
			<a href="/user/modify" class="btn btn-warning btn-complete"><i class="bi bi-gear-fill"></i>&nbsp;수정하기</a>
		</div>
	</div>
</div>
<!-- 메인 종료 -->

<script>
	let i = 0;
	function move() {
	  if (i == 0) {
	    i = 1;
	    let elem = document.getElementById("myBar");
	    let width = 1;
	    let id = setInterval(frame, 20);
	    function frame() {
	      if (width >= 100 || width == ${temperature}) {
	        clearInterval(id);
	        i = 0;
	      } else {
	        width++;
	        elem.style.width = width + "%";
	        elem.innerHTML = width + "%";
	        
	        let color;
	        if (width >= 80) {
	            color = "green"; // width가 80 이상이면 초록색
	        }
	        if (width >= 40 && width <= 79) {
	            color = "orange"; // width가 40에서 79 사이면 주황색
	        } 
	        if (width <= 30) {
	            color = "red"; // 그 외의 경우에는 빨간색
	        }

            // 배경색 변경
            elem.style.backgroundColor = color;
	        
	      }
	    }
	  }
	}
	move();
	
</script>

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>