<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />

<style>
	.my-qna-container .reply.complete {
		color: #1ece3c;
		
	}
	.my-qna-container .reply {
		font-weight: bold;
	}
	
	.my-qna-container .search-div {
		display: flex;
		margin: 10px 0;
	}
	
	.my-qna-container .search-div input[type=text] {
	  width: 130px;
	  box-sizing: border-box;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  font-size: 16px;
	  background-color: white;
	  background-position: 10px 10px; 
	  background-repeat: no-repeat;
	  padding: 5px 10px;
	  -webkit-transition: width 0.4s ease-in-out;
	  transition: width 0.4s ease-in-out;
	}
	
	.my-qna-container .search-div input[type=text]:focus {
	  width: 90%;
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
	
	<div class="my-qna-container">
		<h4 class="user-page-title">문의내역</h4>
		
		<div class="search-div">
			<button type="button" class="btn btn-warning btn-complete">검색</button>
			<input type="text" name="search" placeholder="검색..."/>
		</div>
		<table class="table table-hover">
		  <tbody>
			    <tr class="board-title">
			  		<th></th>
			  		<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>확인여부</th>
			    </tr>
			    <tr>
			      <td><input type="checkbox" name="checkbox"/></td>
			      <td>11</td>
			      <td>테스트 제목</td>
			      <td>2024.03.01</td>
			      <td class="reply complete">답변완료</td>
			    </tr>
			    <tr>
			      <td><input type="checkbox" name="checkbox"/></td>
			      <td>11</td>
			      <td>테스트 제목</td>
			      <td>2024.03.01</td>
			      <td class="reply">답변 대기</td>
			    </tr>
			    <tr>
			      <td><input type="checkbox" name="checkbox"/></td>
			      <td>11</td>
			      <td>테스트 제목</td>
			      <td>2024.03.01</td>
			      <td class="reply">답변 대기</td>
			    </tr>
			    <tr>
			      <td><input type="checkbox" name="checkbox"/></td>
			      <td>11</td>
			      <td>테스트 제목</td>
			      <td>2024.03.01</td>
			      <td class="reply complete">답변완료</td>
			    </tr>
		  </tbody>
		</table>
		<div class="board-utils">
			<label>
				<input type="checkbox"/>&nbsp;
				<span>모두 선택</span>
			</label>
			
			<div>
				<button href="#" class="btn btn-warning btn-complete">삭제</button>
				<a href="#" class="btn btn-warning btn-complete">문의하기</a>
			</div>
		</div>
		<div class="pagination">
		  <a href="#">&laquo;</a>
		  <a href="#">1</a>
		  <a class="active" href="#">2</a>
		  <a href="#">3</a>
		  <a href="#">4</a>
		  <a href="#">5</a>
		  <a href="#">&raquo;</a>
		</div>
	</div>
</div>
<!-- 메인 종료 -->

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>