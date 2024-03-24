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
		<h1>배너 수정</h1>
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
		<h4 class="user-page-title">배너 수정 하기</h4>
		<form action="/admin/banner/update/${banner.id}" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="_method" value="put"/>
			<div class="col-sm-12">
				<div class="card mb-12">
					<div class="card-header text-white">
						<!-- 카드 헤더 -->
						<h3 class="card-title"></h3>
					</div>
					<div class="card-body">
						<table class="table text-center">
							<thead>
								<tr>
									<th>배너 제목 입력</th>
									<td>
										<div class="form-floating mb-3">
											<input type="text" class="form-control" name="title"
												value="${banner.title}" style="font-size: 2rem; padding: 0;">
										</div>
									</td>
								</tr>
								<tr>
									<th>URL 입력</th>
									<td>
										<div class="form-floating mb-3">
											<input type="text" class="form-control" name="url" 
												value="${banner.url}" style="font-size: 2rem; padding: 0;">
										</div>
									</td>
								</tr>
								<tr>
									<th>광고주/업체명</th>
									<td><div class="form-floating mb-3">
											<input type="text" class="form-control" name="client"
												value="${banner.client}"
												style="font-size: 2rem; padding: 0;">
										</div></td>
								</tr>
								<tr>
									<th>가격</th>
									<td><div class="form-floating mb-3">
											<input type="number" class="form-control" name="price"
												value="${banner.price}" step="10" min="0" value="0"
												style="font-size: 2rem; padding: 0;">
										</div></td>
								</tr>
								<tr>
									<th>광고 표시 여부</th>
									
									<td class="emoji--td"><select name="useYn"
										value="${banner.useYn}">
											<option value="Y" >사용</option>
											<option value="N" >사용 안함</option>
									</select></td>

								</tr>
								<tr>
									<th>배너 이미지 선택 <br/>(미첨부시 원래 이미지가 들어갑니다.)</th>
									<td>
										<div class="mb-3" style="padding: 5px 0px 0px 0px;">
											<input class="form-control" type="file" id="formFileMultiple"
												name="file" style="font-size: 1.5rem" accept="image/gif, image/jpeg, image/png"
												onchange="readURL(this);"> <img src=""
												id="bannerImage"
												style="margin: 2%; max-height: 200px; width: 98%; max-width: 2000px">
										</div>
									</td>
								</tr>
								<tr>
									<th>배너 위치</th>
									<td><select class="form-select"
										aria-label="Default select example" name="type">
											<option selected value="MAIN">사이트 메인 배너</option>
											<option value="FREEBOARD">자유게시판</option>
											<option value="LIST">자유게시판 리스트</option>
									</select></td>
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
				style="margin: 5% 50%; font-weight: bolder; width: 12%; height: 50px; border-radius: 7%; font-size: large; background-color: #ffe0009c;">업데이트</button>
		</form>
	</div>
</div>
<!-- 메인 종료 -->

<!-- 푸터 -->
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('bannerImage').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('bannerImage').src = "";
		}
	}
</script>
<%@ include file="/WEB-INF/view/footer.jsp"%>