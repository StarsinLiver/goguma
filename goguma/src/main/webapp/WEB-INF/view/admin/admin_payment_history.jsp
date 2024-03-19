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
<div class="user-page" style="width: 80%; height: 80%">
	<!-- aside -->
	<%@ include file="/WEB-INF/view/admin/admin_aside.jsp"%>
	<!-- aside end -->
	<div class="payment-container"
		style="margin-right: 3%; width: 2500px; max-width: 75%;">
		<h4 class="user-page-title">결제 내역</h4>
		<div class="col-sm-12">
			<div class="card mb-3">
				<div class="card-header text-white">
					<!-- 카드 헤더 -->
					<h5 class="card-title">이모티콘 구매</h5>
				</div>
				<div class="card-body">
					<table class="table text-center">
						<thead>
							<tr>
								<th>결제 번호</th>
								<th>구매일자</th>
								<th>구매상품명</th>
								<th>구매<br />여부
								</th>
								<th>환불 완료</th>
								<th>환불 신청</th>
							</tr>
						</thead>
						<tbody>
							<!-- 데이터가 없을 때 표시될 행 -->
							<tr id="noDataMessage" style="display: none;">
								<td colspan="5">내역이 없습니다.</td>
							</tr>
							<!-- 실제 데이터 행 -->
							<c:forEach var="history" items="${histories}">
								<tr id="dataRow">
									<td id="id">${history.merchantId}</td>
									<td id="purchaseDate">${history.createAt}</td>
									<td id="pointName">${history.mainEmojiName}</td>
									<td id="refundYn">${history.confirmYn}</td>
									<td id="refundYn">${history.cancelYn}</td>
									<td><c:if test="${history.cancelYn == 'N'}">
											<button id="refundButton" data-value="${history.merchantId}"
												class="btn btn-warning btn-complete cancel-request">승인하기</button>
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="pagination">
						<!-- 페이지 처리 -->
						<c:if test="${start > 1}">
							<a href="/admin/history?pg=${start - 1}">&laquo;</a>
						</c:if>
						<!-- 페이지 번호 -->
						<c:forEach var="i" begin="${start}" end="${end}">
							<a href="/admin/history?pg=${i}" class="${pg == i ? 'active':''}">${i}</a>
						</c:forEach>
						<c:if test="${end < last}">
							<a href="/admin/history?pg=${end + 1}">&raquo;</a>
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
						<label for="password">이유를 적어주세요.</label> <br> <br>
						<textarea rows="12" cols="60" id="reasonText"></textarea>
						<br /> <input type="hidden" id="hidMerchant" readonly="readonly" />
						<input type="hidden" id="amount" readonly="readonly" />
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
			var merchantId = $(this).data('value');

			$('#modalReason').modal('show'); // 모달 창을 보여줌

			// AJAX 호출
			$.ajax({
				type : 'POST',
				url : '/admin/payment-reason', // 컨트롤러 주소
				data : {
					merchantId : merchantId
				},
				dataType : 'json',
				success : function(data) {
					// 성공적으로 데이터를 받아왔을 때 모달 창의 텍스트 업데이트
					// $('#reasonText').val(data.cancelReason); // 예시로 받아온 데이터를 재확인 비밀번호 필드에 넣음
					$('#hidMerchant').val(data.merchantId);
					$('#amount').val(data.price);
				},
				error : function(xhr, status, error) {
					// 에러 처리
					console.error(xhr.responseText);
				}
			});
		});

		$('#confirm').click(function() {

			var merchantId = $('#hidMerchant').val();
			var reason = $('#reasonText').val();
			var amount = $('#amount').val();

			console.log('머천트 아이디 값: ' + merchantId);
			//AJAX 호출
			$.ajax({
				type : 'POST',
				url : '/admin/payment-cancel', // 컨트롤러 주소
				data : {
					merchantId : merchantId,
					reason : reason,
					amount : amount
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
				},
				error : function(xhr, status, error) {
					// 에러 처리
					console.log(xhr.status)

					if (xhr.status == 400) {
						alert("이유를 적어주세요.");
					}
					if (xhr.status == 404) {
						alert("거래내역을 찾을 수 없습니다.");
					}

					if (xhr.status == 500) {
						alert("서버 에러가 발생하였습니다.");
					}
					window.location.reload();
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