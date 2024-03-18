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
	style="width: 95%; height: 80%; margin: 5% 5% 53% 5%">
	<!-- aside -->
	<%@ include file="/WEB-INF/view/admin/admin_aside.jsp"%>
	<!-- aside end -->
	<div class="payment-container" style="width: 70%; margin-right: 15%;">
		<h4 class="user-page-title">거래 상품 관리</h4>
		<div class="col-sm-12">
			<div class="search-div">
				<form action="/admin/user/role-management">
					<input type="text" name="search" placeholder="검색..." />
					<button type="submit" class="btn btn-warning btn-complete">검색</button>
				</form>
			</div>
			<div class="card mb-3">
				<div class="card-header text-white">
					<!-- 카드 헤더 -->
					<h5 class="card-title">유저 상품 리스트</h5>
				</div>

				<div class="card-body">
					<table class="table text-center">
						<thead>
							<tr>
								<th>유저 번호</th>
								<th>유저 이름</th>
								<th>이메일</th>
								<th>소셜</th>
								<th>전화번호</th>
								<th>주소</th>
								<th>우편번호</th>
								<th>생성일</th>
								<th>삭제일</th>
								<th>권한</th>
								<th>권한 수정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList}" var="user">
								<tr id="dataRow">
									<td id=""><a href="/product/userProduct?uId=${user.getUId()}">${user.getUId()}</a></td>
									<td id=""><a href="/product/userProduct?uId=${user.getUId()}">${user.name}</a></td>
									<td id="">${user.email}</td>
									<td id="">${user.social}</td>
									<td id="">${user.tel}</td>
									<td id="">${user.address}</td>
									<td id="">${user.zip}</td>

									<td id="">${user.createAt}</td>
									<td id="">${user.deleteAt}</td>
									<td id="">${user.role}</td>

									<td><c:if test="${user.deleteAt == null}">
											<form action="/admin/user/role-management/${user.getUId()}"
												method="post">
												<input type="hidden" name="_method" value="PUT" /> <input
													type="hidden" name="role"
													value="${user.role == 'ADMIN'? 'USER' : 'ADMIN'}" />
												<button id="refundButton"
													onclick="if(!confirm('${user.role} 을 ${user.role == 'ADMIN'? 'USER' : 'ADMIN'} 으로 바꾸시겠습니까?')) return false; "
													class="btn btn-warning btn-complete cancel-request">권한
													수정</button>
											</form>
										</c:if></td>

								</tr>
							</c:forEach>
						</tbody>

					</table>
					<div class="pagination">
						<!-- 페이지 처리 -->
						<c:if test="${start > 1}">
							<a href="/admin/user/role-management?pg=${start - 1}">&laquo;</a>
						</c:if>
						<!-- 페이지 번호 -->
						<c:forEach var="i" begin="${start}" end="${end}">
							<a href="/admin/user/role-management?pg=${i}"
								class="${pg == i ? 'active':''}">${i}</a>
						</c:forEach>
						<c:if test="${end < last}">
							<a href="/admin/user/role-management?pg=${end + 1}">&raquo;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 이메일 변경 내용을 입력하는 폼 -->
<!-- <div class="modal fade" id="modalReason" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-body">

				<div style="display: flex; flex-direction: column;">
					<div class="register-form">
						<label for="password">Confirm Password</label> <br> <br>
						<textarea rows="12" cols="12" id="reasonText" readonly="readonly"
							style="border: none"></textarea>
						<input type="" id="hidMerchant">
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
</div> -->
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
					$('#reasonText').val(data.cancelReason); // 예시로 받아온 데이터를 재확인 비밀번호 필드에 넣음
					$('#hidMerchant').val(data.merchantId);
				},
				error : function(xhr, status, error) {
					// 에러 처리
					console.error(xhr.responseText);
				}
			});
		});

		$('#confirm').click(function() {

			var merchantId = $('#hidMerchant').val();

			console.log('머천트 아이디 값: ' + merchantId);
			//AJAX 호출
			$.ajax({
				type : 'POST',
				url : '/admin/payment-confirm', // 컨트롤러 주소
				data : {
					merchantId : merchantId
				},
				success : function(data) {

					window.location.href = '/admin/history';
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