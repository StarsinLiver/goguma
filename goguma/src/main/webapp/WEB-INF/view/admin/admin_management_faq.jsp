<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />

<style>
.user-page .payment-container {
	width: 800px;
	height: auto;
	padding: 40px;
	border-radius: 5px;
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
		<h1>자주 묻는 질문 관리</h1>
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
<div class="user-page"
	style="width: 95%; height: 80%; margin: 5% 5% 53% 5%">
	<!-- aside -->
	<%@ include file="/WEB-INF/view/admin/admin_aside.jsp"%>
	<!-- aside end -->
	<div class="payment-container" style="width: 70%; margin-right: 15%;">
		<h4 class="user-page-title">자주 묻는 질문 관리</h4>

		<div class="col-sm-12">
			<div class="search-div mb-2" style="text-align: right;">
				<a href="/cs/faq/write/admin" class="btn btn-warning btn-complete">등록<a>
			</div>
		</div>
		<div class="card mb-3">
			<div class="card-header text-white">
				<!-- 카드 헤더 -->
				<h5 class="card-title" style="height: 24px"></h5>
			</div>

			<div class="card-body">
				<table class="table text-center">
					<thead>
						<tr>
							<th>질문 번호</th>
							<th>제목</th>
							<th>작성자 번호</th>
							<th>작성일</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${faqList}" var="faq">
							<tr id="dataRow">
								<td id="">${faq.id}</td>
								<td id="">${faq.title}</td>
								<td id="">${faq.getUId()}</td>
								<td id="">${faq.createAt}</td>
								<td id=""><a href="/admin/faq/${faq.id}"
									class="btn btn-warning btn-complete">상세조회</a></td>
								<td id="">
									<form action="/admin/faq/${faq.id}" method="post">
										<input type="hidden" name="_method" value="delete" />
										<button class="btn btn-warning btn-complete" style="margin-bottom: -5px; margin-top: -5px; background-color: #DC3545;" onclick="if(!confirm('정말 삭제하시겠습니까??')) return false">삭제</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
		</div>
	</div>
</div>
</div>

<!-- 승인 모달 end -->
<%@ include file="/WEB-INF/view/footer.jsp"%>