<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />

<style>
.user-page .payment-container {
	width: 70%;
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

.reason-column {
	
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 메인 시작 -->
<!-- Header Start -->
<div class="all-page-title"
	style="background-image: url(/assets/images/pattern-4.png);">
	<div class="container text-center">
		<h1>신고 내역</h1>
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
<div class="user-page" style="width: 80%; height: 80%">
	<!-- aside -->
	<%@ include file="/WEB-INF/view/admin/admin_aside.jsp"%>
	<!-- aside end -->
	<div class="payment-container" style="margin-right: 10%;">
		<h4 class="user-page-title">신고 내역</h4>
		<div class="col-sm-12">
			<div class="search-div">
				<form action="/admin/report">
					<select name="searchType">
						<option value="id">신고 번호</option>
						<option value="hostName">신고 대상 이름</option>
						<option value="userName">신고자 이름</option>
						<option value="hostEmail">신고 대상 이메일</option>
						<option value="callEmail">신고자 이메일</option>
					</select> <input type="text" name="search" placeholder="상품 이름을 검색해주세요" />
					<button type="submit" class="btn btn-warning btn-complete">검색</button>
				</form>
			</div>
			<div class="card mb-3">
				<div class="card-header text-white" style="height: 40px;"></div>
				<div class="card-body">
					<table class="table text-center">
						<thead>
							<tr>
								<th>신고 번호</th>
								<th>신고자</th>
								<th>신고 대상</th>
								<th>신고일</th>
								<th>신고 이유</th>
								<th>상세보기</th>
								<th>신고 취소</th>
							</tr>
						</thead>
						<tbody>
							<!-- 데이터가 없을 때 표시될 행 -->
							<tr id="noDataMessage" style="display: none;">
								<td colspan="5">내역이 없습니다.</td>
							</tr>
							<!-- 실제 데이터 행 -->
							<c:forEach var="report" items="${report}">
								<tr id="dataRow">
										<td id="id">${report.id}</td>
										<td id="pointName"><a href="/product/userProduct?uId=${report.callId}">${report.callName}(${report.hostEmail})</a></td>
										<td id="hostId"><a href="/product/userProduct?uId=${report.hostId}">${report.hostName}(${report.callEmail})</a></td>
										<td id="purchaseDate">${report.createAt}</td>
									<td id="reason"
										style="max-width: 400px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${report.reason}</td>
									<td><button type="button"
											class="btn btn-warning btn-complete" data-toggle="modal"
											data-target="#reportModal${report.id}">상세보기</button></td>
									<td>
										<form action="/admin/update-report/${report.id}" method="post">
											<input type="hidden" name="_method" value="put" />
											<button class="btn btn-warning btn-complete" style="margin-bottom: -5px; margin-top: -5px; background-color: #DC3545;"
												onclick="if(!confirm('취소하시겠습니까??')){return false;}">취소하기</button>
										</form>
									</td>

								</tr>
								<!-- 상세보기 모달 -->
								<div class="modal fade" id="reportModal${report.id}"
									tabindex="-1" role="dialog" aria-labelledby="reportModalLabel"
									aria-hidden="true">
									 <div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 700px;">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="reportModalLabel">신고 이유</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body"style="width: 700px; height: 500px; overflow-y: auto; text-overflow: ellipsis;">${report.reason}</div>

										</div>
									</div>
								</div>
							</c:forEach>
						</tbody>
					</table>
					<div class="pagination">
						<!-- 페이지 처리 -->
						<c:if test="${start > 1}">
							<a href="/admin/report?pg=${start - 1}">&laquo;</a>
						</c:if>
						<!-- 페이지 번호 -->
						<c:forEach var="i" begin="${start}" end="${end}">
							<a href="/admin/report?pg=${i}" class="${pg == i ? 'active':''}">${i}</a>
						</c:forEach>
						<c:if test="${end < last}">
							<a href="/admin/report?pg=${end + 1}">&raquo;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
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
<!-- 승인 모달 -->

<!-- 승인 모달 end -->
<!-- 푸터 -->
<script>
	$(document).ready(function() {
		$('.cancel-request').click(function() {
			var id = $(this).data('value');

			$('#modalReason').modal('show'); // 모달 창을 보여줌

			// AJAX 호출
			$.ajax({
				type : 'POST',
				url : '/admin/report-Reason', // 컨트롤러 주소
				data : {
					id : id
				},
				dataType : 'json',
				success : function(data) {
					// 성공적으로 데이터를 받아왔을 때 모달 창의 텍스트 업데이트
					$('#reasonText').val(data.reson); // 예시로 받아온 데이터를 재확인 비밀번호 필드에 넣음
					$('#hidMerchant').val(data.id);
				},
				error : function(xhr, status, error) {
					// 에러 처리
					console.error(xhr.responseText);
				}
			});
		});

		$('#confirm').click(function() {

			var id = $('#hideId').text();
			var host = $('#hostId').text();

			console.log('하이드 아이디 값: ' + id);
			console.log('호스트 아이디 값: ' + host);
			//AJAX 호출
			$.ajax({
				type : 'PUT',
				url : '/admin/reason-confirm', // 컨트롤러 주소
				data : {
					id : id,
					host : host
				},
				success : function(data) {

					window.location.href = '/admin/report';
				},
				error : function(xhr, status, error) {
					// 에러 처리
					console.error(xhr.responseText);
				}

			})

		})

		// "닫기" 버튼 클릭 시
		$('#cancel').click(function() {
			// 모달 닫기
			$('#modalReason').modal('hide');
		});
	});
</script>
<%@ include file="/WEB-INF/view/footer.jsp"%>