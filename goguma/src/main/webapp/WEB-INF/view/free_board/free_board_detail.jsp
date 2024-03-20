<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	width: 80%;
	border-collapse: collapse;
	margin: 5% 5%;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
	width: 25%;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

textarea {
	width: 100%;
	height: 150px;
	padding: 12px 20px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	background-color: #f8f8f8;
	font-size: 16px;
	resize: none;
	overflow: hidden; /* 스크롤바를 보이지 않도록 함 */
	border: none; /* 테두리 스타일 설정 */
}

.b-view-title {
	border-top: 1px solid #343a40; /* 볼더를 주고 */
	border-bottom: 1px solid #343a40; /* 볼더를 주고 */
	background: linear-gradient(to bottom, #f8f9fa, #e9ecef);
	/* 그라데이션 배경 추가 */
	padding: 20px;
}

.b-profile {
	background-color: #f8f9fa; /* 내부 배경색 회색으로 변경 */
	border-radius: 15px; /* 테두리를 둥글게 */
	padding: 10px;
}
</style>
</head>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>

<!-- 메인 시작 -->
<body>

	<div style="width: 100%; display: flex;">
		<!-- aside 시작 -->
		<div
			style="width: 13.6%; width: 13.6%; display: flex; flex-direction: column; align-items: flex-start; border-right: 1px solid;">
			<%@ include file="/WEB-INF/view/free_board/free_board_aside.jsp"%>
		</div>
		<!-- aside 끝 -->
		<div style="width: 100%;">

			<div class="container"
				style="max-width: 100%; width: 90%; margin-top: 3%; margin-bottom: 3%;">
				<div class="b-view-title" style="width: 90%;">
					<div class="row">
						<div class="col-md-2 b-profile">
							<div class="img" style="max-width: 380px; max-height: 130px;">
								<img
									src="/profile/${board.userFile}"
									class="img-fluid" style="width:100%; height: 100px;">
							</div>
						</div>
						<div class="col-md-10">
							<div class="b-title">
								<h2>${board.title}</h2>
								<h2>${freeBoard.title}</h2>
							</div>
							<div class="b-info">
								<div class="d-flex">
									<div class="me-3">
										<i class="bi bi-clock"></i>&nbsp; 
										<span>${board.createAt}</span>
										<i class="bi bi-clock"></i>&nbsp; <span>${freeBoard.createAt}</span>
									</div>
									<button type="button" class="btn btn-secondary"
										id="reportButton" data-bs-toggle="modal"
										data-bs-target="#reportModal">신고</button>
									<div class="modal fade" id="reportModal" tabindex="-1"
										aria-labelledby="reportModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header bg-danger text-white">
													<h5 class="modal-title" id="reportModalLabel"
														style="font-weight: bold; font-size: 1.25rem;">신고하기</h5>
													<button type="button" class="btn-close btn-close-white"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<form id="reportForm" action="addReport" method="post">
														<input type="hidden" name="pId" value="${freeBoard.id}">
														<div class="dropdown">
															<button class="btn btn-secondary dropdown-toggle"
																type="button" id="dropdownMenuButton"
																data-bs-toggle="dropdown" aria-expanded="false"
																style="width: 200px; height: 25px; margin-bottom: 10px; background-color: tomato;">신고
																이유 선택</button>
															<ul class="dropdown-menu"
																aria-labelledby="dropdownMenuButton">
																<li><a class="dropdown-item" href="#"
																	data-value="사기/광고성 상품">사기/광고성 상품</a></li>
																<li><a class="dropdown-item" href="#"
																	data-value="그냥 맘에 안듬">그냥 맘에 안듬</a></li>
																<li><a class="dropdown-item" href="#"
																	data-value="욕설/비속어">욕설/비속어</a></li>
																<li><a class="dropdown-item" href="#"
																	data-value="기타">기타</a></li>
															</ul>
														</div>
														<div id="selectedReason"
															style="font-weight: bold; color: red; margin-bottom: 10px;"></div>
														<textarea class="form-control" id="additionalReason"
															name="additionalReason" rows="3"
															style="resize: vertical;" placeholder="신고 이유를 작성해주세요"></textarea>
														<input type="hidden" id="resonInput" name="reason">
														<div class="d-grid gap-2 d-md-flex justify-content-md-end"
															style="margin-top: 8px;">
															<button type="submit" class="btn btn-danger">신고</button>
															<button type="button" class="btn btn-secondary"
																data-bs-dismiss="modal">취소</button>
														</div>
													</form>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
							<div class="col-md-6 b-user-info mt-3" style="margin-left: -0.8%">
								<div class="d-flex align-items-center">
									<div class="me-3">
										<i class="bi bi-hand-thumbs-up"></i> &nbsp;<span>추천수:
											${board.good}</span>
									</div>
									<div class="me-3">
										<i class="bi bi-person"></i> &nbsp;<span>조회수: ${board.view}</span>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<br> <br> <br>
			<!-- 게시글 시작 -->
			<div style="width: 81%; margin: 0% 5%;">
					${board.content}   
				<a href="#">sssssss</a>
				<p style="width: 100%;">${freeBoard.content}</p>
			</div>
			<br>
			<button style="margin: 0 41.5%">
				<i class='fab fa-gratipay' style='font-size: 48px; color: red;'></i>
			</button>
			<!-- 게시글 끝 -->
			<!-- 댓글 시작 -->
			<div>
				<%@ include file="/WEB-INF/view/free_board/free_board_review.jsp"%>
			</div>
			<!-- 댓글 끝 -->
			<!-- <div style="margin: 5%; display: flex;">
				
				<div>
					<label> 작성자 이름 </label> <label> 작성일 </label><br> <br>
					<textarea type="text">
					
					</textarea>
					<button>이모티콘</button><button>신고하기</button> <button>수정하기</button><button>삭제</button> 
				</div>
			</div> -->
		</div>
	</div>


</body>
<script>
	function autoResize(textarea) {
		textarea.style.height = 'auto'; // 일단 자동 높이로 설정
		textarea.style.height = (textarea.scrollHeight + 2) + 'px'; // 스크롤 높이에 2px를 더해줌
	}
</script>
<script>
	// 드롭다운 메뉴 항목을 클릭했을 때 호출되는 함수
	document.querySelectorAll('.dropdown-item').forEach(item => {
	    item.addEventListener('click', event => {
	        const selectedReason = event.target.getAttribute('data-value');
	        document.getElementById('selectedReason').innerText = selectedReason;
	    });
	});
	// 모달이 닫힐 때 초기화하는 함수
	function resetModal() {
	    document.getElementById('selectedReason').innerText = '';
	    document.getElementById('additionalReason').value = '';
	}
	document.getElementById('reportModal').addEventListener('hidden.bs.modal', function () {
	    resetModal();
	});
    // textarea에 작성된 내용도 reson으로 설정
    $("#additionalReason").on("input", function() {
        var additionalReason = $(this).val();
        $("#resonInput").val(additionalReason);
    });
</script>
<script>
    // 모달 닫힐 때 입력 필드 초기화
    $('#exampleModal').on('hidden.bs.modal', function () {
        // 입력 필드 초기화
        $('#exampleModal input[name="name"]').val('');
        $('#exampleModal input[name="pId"]').val('');
        $('#exampleModal input[name="hostId"]').val('');
    });
</script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>
</html>