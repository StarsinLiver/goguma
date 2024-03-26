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
				<!-- 배너 출력 start -->
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="max-height: 200px; max-width: 1000px; margin: 20px">
			<!--  광고 하단 버튼 생성 위치 -->
		  <div class="carousel-indicators btn" style="left: 0px">
		  </div>
		  <!-- 광고 이미지 생성 위치 -->
		  <div class="carousel-inner">
		   
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
		<!-- 배너 출력 end -->
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
	<script>
	function highlightCard(card) {
		var details = card.querySelector('.card-details');
		details.style.display = 'block';
	}

	function unhighlightCard(card) {
		var details = card.querySelector('.card-details');
		details.style.display = 'none';
	}
	
	
$(document).ready(function(){
	
	var type = "FREEBOARD"
	
		// banner ajax start
		$.ajax({
				    method: "GET",
				    url: "/banner",
				    data:{
						type: type,
					},
				    success: function(data) {
				        console.log('data확인 배너 리스트 석세스: ' + data); //
				        console.log('data확인 배너 리스트 석세스: ' + data.length); // 배열 길이 찍힘
				        console.log('data확인 배너 리스트 석세스: ' + data.length / 3);
				        // 배열 길이 찍힘 어딜가든 세군데 다 들어갈 것이고 그러면 무조건 3군데에 같은 배너가 들어갈테니 총량/3 만큼 버튼이 생기게 할예정
				
				        var btn = "";
				        var img = "";
				       
				
				        // banner 버튼 생성 for문
				        for (var i = 0; i < data.length; i++) {
				            var board = data[i];
				            var type = data[i].type;
				            var id = data[i].id;
				            
				            console.log('로그 확인 데이터 타입으로다가: ' + type);
				
				            if (type == 'FREEBOARD') {
				                // 첫 번째 버튼에만 active 클래스 추가
				                var isActive = i === 0 ? ' active' : '';
				                btn += '<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="' + i + '" class="' + isActive + '" aria-current="true" aria-label="Slide ' + i + '"></button>';
				
				                // 이미지 추가
				                img += '<div class="carousel-item' + isActive + '">';
				                img += '<a href="' + board.url + '"class="bannerTag"><img src="/images/upload/' + board.file + '" class="d-block w-100" alt="..." style="max-height: 200px; max-width: 1000px"></a>';
				                img += '</div>';
				               	img += '<input type="hidden" class="bannerId" value="'+id+'" />';
				            }
				        }
				
				        $('.carousel-indicators').html(btn);
				        $('.carousel-inner').html(img);
				    },
				    error: function() {
				        // 에러 처리
				    }
				});
});	

//배너 뷰카운트 증가
$(document).on("click", ".bannerTag", function() {
    var bannerId = $('.bannerId').val();  // 해당 배너의 ID를 가져옴
    alert('배너 아이디 캣치' + bannerId);

    $.ajax({
        method: "PUT",
        url: "/banner/viewCount",
        data: {
            id: bannerId
        },
        success: function(data) {
            // AJAX 요청 성공 시 동작
             alert('아작스 성공');
        },
        error: function() {
            // AJAX 요청 실패 시 동작
             alert('아작스 실패~~~');
        }
    });
});
	
</script>
<%@ include file="/WEB-INF/view/footer.jsp"%>