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
	      if (width >= 100) {
	        clearInterval(id);
	        i = 0;
	      } else {
	        width++;
	        elem.style.width = width + "%";
	        elem.innerHTML = width + "%";
	        
	     	// 그라데이션 색상 계산
            let color;
			if (width >= 80) {
			    let red = 0; // 초록색에서는 빨간색은 항상 0
			    let green = Math.floor((width - 80) * 3.1875); // 초록색 계산
			    color = "rgb(" + red + ", " + (255 - green) + ", 0)";
			} else if (width >= 40 && width <= 79) {
			    let red = Math.floor(255 - (width - 40) * 2); // 노랑에서 초록으로 자연스럽게 계산
			    let green = 255;
			    color = "rgb(" + red + ", " + green + ", 0)";
			} else {
			    let red = 255;
			    let green = Math.floor(width * 6.375);
			    color = "rgb(" + red + ", " + green + ", 0)";
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