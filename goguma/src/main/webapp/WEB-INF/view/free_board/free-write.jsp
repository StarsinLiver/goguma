<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/product/userProduct.css">

<!-- 부트스트랩 5 CSS 파일 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.form-control {
	width: calc(30% - 5px); /* 검색창 폭 조절 */
}

.form-select {
	width: calc(13% - 5px); /* 셀렉트 박스 폭 조절 */
}

h2 {
	background-color: #f2f2f2;
	padding: 10px;
	margin-top: 20px;
}

</style>


<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<div class="container mt-4" style="display: flex; max-width: 100%; width: 2500px">
	<!-- aside 시작 -->
	<div
		style="width: 13.6%; width: 13.6%; display: flex; flex-direction: column; align-items: flex-start; border-right: 1px solid;">
		
	</div>
	<!-- aside 끝 -->
	<div class="row justify-content-center" style="    margin: 0 10%;">
		<section class="section nopad cac text-center" style="width: 67%;">
			<a href="#"><h3>아마도 광고 들어갈 예정</h3></a>
		</section>
		<div class="col-lg-8">
			<div class="row">
				<form class="row" action="/freeBoard/write" method="post" enctype="multipart/form-data">
					<!-- 카테고리 선택 셀렉트 박스 -->
					<div class="mb-3 col-md-5">
						<label for="categorySelect" class="form-label">메인 카테고리</label> <select
							class="form-select"  name="mainCategory" id="main--category" onchange="onclickMain(this.value)"
							style="width: calc(30%);">
							<!-- 여기에 다른 카테고리 옵션을 추가할 수 있습니다 -->
						</select>
						<label for="categorySelect" class="form-label">서브 카테고리</label> <select
							class="form-select"  name="subCategory" id="sub--category"
							style="width: calc(30%);">
							<!-- 여기에 다른 카테고리 옵션을 추가할 수 있습니다 -->
						</select>
					</div>
					
					<!-- 제목 입력 폼 -->
					<div class="mb-3 col-md-12">
						<label for="titleInput" class="form-label">제목</label> <input
							type="text" class="form-control" id="titleInput" name="title"
							placeholder="제목을 입력하세요">
					</div>
					<!-- Summernote를 사용할 textarea 요소 -->
					<div class="mb-3 col-md-12">
						<label for="summernote" class="form-label">내용</label>
						<textarea class="form-control" name="content" id="summernote"></textarea>
					</div>
					<!-- 파일등록 -->
					<div class="mb-3 col-md-12">
						<label for="summernote" class="form-label">메인 이미지</label>
						<input type="file" name="multipartFile"/>
					</div>
					<!-- 글 작성 버튼 -->
					<div class="col-12 text-end" style="margin: -20px 30px 10px 0;">
						<button type="submit" class="btn btn-primary">글 작성</button>
						<button type="button" class="btn btn-secondary ms-2">취소</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</div>

<!-- Summernote 초기화 스크립트 -->
<script src="/customAssets/js/free-board/free_write.js"></script>
<!-- include Summernote CSS -->
<script src="/assets/js/summernote-ko-KR.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@ include file="/WEB-INF/view/footer.jsp"%>