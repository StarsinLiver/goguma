<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />

<style>
.my-board-container .reply.complete {
	color: #1ece3c;
}

.my-board-container .reply {
	font-weight: bold;
}

.search-div form {
	display: flex;
	padding: 20px;
	box-sizing: border-box;
	justify-content: flex-end;
	align-items: center;
}

.search-div form>* {
	margin-left: 10px;
}

.search-div input {
	font-size: 16px;
	padding: 8px;
	border: 1px solid #ddd;
}

.search-div select {
	padding: 11px;
}
</style>

<!-- 메인 시작 -->
<!-- Header Start -->
<div class="all-page-title"
	style="background-image: url(/assets/images/pattern-4.png);">
	<div class="container text-center">
		<h1>마이페이지</h1>
	</div>
	<!--End Page-->
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
<!-- Header End -->

<div class="user-page">
	<!-- aside -->
	<%@ include file="/WEB-INF/view/user/myPageAside.jsp"%>
	<!-- aside end -->

	<div class="my-board-container">
		<h4 class="user-page-title">자유게시판 (나의 작성 목록)</h4>

		<div class="search-div">
			<form action="/user/board">
				<!-- 대분류 -->
				<select name="mainCategory" onchange="onclickMainCategory(this.value)">
					<option value="">대분류</option>
					<c:forEach items="${mainCategoryList}" var="category" >
						<option value="${category.id}" >${category.name}</option>
					</c:forEach>
				</select>
				<!-- 소분류 -->
				<select name="subCategory" id="sub--category">
					<option value="">소분류</option>
				</select> 
				<select name="searchType">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select> <input type="text" name="search" placeholder="검색..." />
				<button type="submit" class="btn btn-warning btn-complete">검색</button>
			</form>
		</div>
		<table class="table table-hover">
			<tbody>
				<tr class="board-title">
					<th></th>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>수정</th>
				</tr>
				<c:forEach var="board" items="${boardList}">
					<tr class="board--data">
						<td><input type="checkbox" name="checkbox" class="check"
							value="${board.id}" /></td>
						<td>${board.id}</td>
						<td><a href="/freeBoard/detail?id=${board.id}">${board.title}</a></td>
						<td>${board.formatCreatedAt()}</td>
						<td><a class="btn btn-warning btn-complete" href="/freeBoard/write/update/${board.id}">수정</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="board-utils">
			<label> <input type="checkbox" name="allChack"
				onchange="selectAll(this)" id="allChack" />&nbsp; <span>모두
					선택</span>
			</label>
			<div>
				<button id="delete-board" onclick="deleteFun()"
					class="btn btn-warning btn-complete">삭제</button>
				<a href="/freeBoard/write" class="btn btn-warning btn-complete">작성하기</a>
			</div>
		</div>
		<div class="pagination">
			<!-- 페이지 처리 -->
			<c:if test="${start > 1}">
				<a href="/user/board?pg=${start - 1}">&laquo;</a>
			</c:if>
			<!-- 페이지 번호 -->
			<c:forEach var="i" begin="${start}" end="${end}">
				<a href="/user/board?pg=${i}" class="${pg == i ? 'active':''}">${i}</a>
			</c:forEach>
			<c:if test="${end < last}">
				<a href="/user/board?pg=${end + 1}">&raquo;</a>
			</c:if>
		</div>
	</div>
</div>
<!-- 메인 종료 -->
<script src="/customAssets/js/user/board.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>