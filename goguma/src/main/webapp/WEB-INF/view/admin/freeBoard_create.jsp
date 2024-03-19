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

th {
	border-right: 1px solid #dee2e6;
	width: 30%;
	padding: none;
	height: 30%;
	vertical-align: middle;
}

thead {
	height: 50px
}

select {
	height: 100%;
}

label {
	vertical-align: middle;
}

.form-select {
	font-size: 1.5rem;
}

.form-check-input {
	margin-top: 1em;
}

input[type="checkbox"] {
	vertical-align: middle;
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
<div class="user-page"
	style="width: 80%; height: 80%; justify-content: normal;">
	<!-- aside -->
	<%@ include file="/WEB-INF/view/admin/admin_aside.jsp"%>
	<!-- aside end -->
	<div class="payment-container" style="width: 100%; height: 100%">
		<h4 class="user-page-title">게시판 생성하기</h4>
		<form action="">
			<div class="col-sm-12">
				<div class="card mb-12">
					<div class="card-header text-white">
						<!-- 카드 헤더 -->
						<h3 class="card-title">게시판 생성</h3>
					</div>
					<div class="card-body">
						<table class="table text-center">
							<thead>
								<tr>
									<th>게시판 이름 입력</th>
									<td>
										<div class="form-floating mb-3">
											<input type="email" class="form-control"
												placeholder="name@example.com"
												style="font-size: 2rem; padding: 0;">
										</div>
									</td>
								</tr>
								<tr>
									<th>1차 카테고리 선택</th>
									<td><select class="form-select"
										aria-label="Default select example">
											<option selected>1번 카테고리</option>
											<option value="1">2번 카테고리</option>
											<option value="2">3번 카테고리</option>
											<option value="3">4번 카테고리</option>
									</select></td>
								</tr>
								<tr>
									<th>2차 카테고리 선택</th>
									<td><select class="form-select"
										aria-label="Default select example">
											<option selected>1번 카테고리</option>
											<option value="1">2번 카테고리</option>
											<option value="2">3번 카테고리</option>
											<option value="3">4번 카테고리</option>
									</select></td>
								</tr>
								<tr>
									<th>폰트 선택</th>
									<td>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox"
												id="inlineCheckbox1" value="option1"> <label
												class="form-check-label" for="inlineCheckbox1">1번 폰트</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox"
												id="inlineCheckbox2" value="option2"> <label
												class="form-check-label" for="inlineCheckbox2">2번 폰트</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox"
												id="inlineCheckbox3" value="option3" disabled> <label
												class="form-check-label" for="inlineCheckbox3">3번 폰트
												(disabled)</label>
										</div>
									</td>
								</tr>
								<tr>
									<th>배치 형식</th>
									<td>
										<div class="form-check-inline form-switch">
											<input class="form-check-input" type="checkbox" role="switch"
												id="flexSwitchCheckDefault"
												style="margin-left: -11.5em; margin-top: -2px"> <label
												class="form-check-label" for="flexSwitchCheckDefault"
												style="float: left;">카드형식</label>
										</div>
										<div class="form-check-inline form-switch">
											<input class="form-check-input" type="checkbox" role="switch"
												id="flexSwitchCheckDefault"
												style="margin-left: -24.5em; margin-top: -6px" disabled>
											<label class="form-check-label" for="flexSwitchCheckDefault"
												style="float: left;">리스트형식 (disabled)</label>
										</div>
									</td>
								</tr>
								<tr>
									<th>배경 이미지 선택</th>
									<td>
										<div class="mb-3" style="padding: 5px 0px 0px 0px;">
											<input class="form-control" type="file" id="formFileMultiple"
												multiple style="font-size: 1.5rem">
										</div>
									</td>
								</tr>
							</thead>



							<tbody>
								<!-- 데이터가 없을 때 표시될 행 -->
								<tr id="noDataMessage" style="display: none;">
									<td colspan="5">내역이 없습니다.</td>
								</tr>
								<!-- 실제 데이터 행 -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<button type="submit" class="btn btn-warning"
				style="margin: 5% 50%; width: 8%; height: 50px; border-radius: 7%; font-size: large; background-color: #ffe0009c;">게시판
				생성</button>
		</form>
	</div>
</div>
<div class="modal fade" id="modalReason" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<!-- 이메일 변경 내용을 입력하는 폼 -->
				<div style="display: flex; flex-direction: column;">
					<div class="register-form">
						<label for="password">Confirm Password</label> <br> <br>
						<textarea rows="12" cols="12" id="reasonText" readonly="readonly"
							style="border: none"></textarea>
						<input type="hidden" id="hideId">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="confirm"
						data-dismiss="modal">승인</button>
					<button type="button" class="btn btn-secondary" id="cancel"
						data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- 메인 종료 -->

<!-- 푸터 -->

<%@ include file="/WEB-INF/view/footer.jsp"%>