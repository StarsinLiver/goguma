<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>

<!-- 부트스트랩 CSS -->
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

/* background 적용 css */
.mt-4 {
	margin-top: -0.5rem !important;
	/* background-image: url("/images/upload/bg1.jpg"); */
	background-image: url("/images/upload/${type.backGround}");
	background-size: cover; /* 이미지를 요소에 맞게 조절 */
	background-repeat: no-repeat; /* 이미지 반복을 하지 않음 */
}

/* 폰트 적용을 위한 css */
.col-lg-8 {
	font-family: ${type.font},sans-serif;
	font-size:large;
}
.h2font {
	font-family: ${	type.font},sans-serif;
    font-size: large;
}
/* 폰트 적용을 위한 css end */
</style>

<div class="container mt-4"
	style="display: flex; width: 5000px; max-width: 100%">
	<!-- aside 시작 -->
	<div
		style="width: 13.6%; width: 13.6%; display: flex; flex-direction: column; align-items: flex-start; border-right: 1px solid;">
		<%@ include file="/WEB-INF/view/free_board/free_board_aside.jsp"%>
	</div>
	<!-- aside 끝 -->
	<div class="row justify-content-center" style="width: 2500px;">
		<section class="section nopad cac text-center" style="width: 67%;">
			<a href="#"><h3>아마도 광고 들어갈 예정</h3></a>
		</section>
		<div class="col-lg-8">
			<h2 class="h2font">
				게시판 - 카테고리 이름 <a href="/freeBoard/main" style="float: right;">메인으로</a>
			</h2>
			<!-- 리스트 테이블 -->
			<input type="text" value="${type.listType}" id="listType" />
			<button style="display: none;" class="typeValue" id="typeValue"
				data-value="${type.listType}"></button>
			<table class="table table-bordered" style="background: white;">
				<thead>
					<tr>

						<th scope="col" width="295" class="text-center">제목</th>
						<th scope="col" width="140" class="text-center">작성자</th>
						<th scope="col" width="115" class="text-center">등록일</th>
						<th scope="col" width="45" class="text-center">조회</th>
						<th scope="col" width="35" class="text-center">추천</th>
					</tr>
				</thead>
				<tbody>
					<!-- 여기에서 생성할 예정 -->
					
				</tbody>
			</table>
			<!-- 글 작성 버튼 및 검색창 -->
			<div class="d-flex justify-content-between mt-3 align-items-center">
				<!-- 페이징 버튼 -->
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1" aria-disabled="true">이전</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
				</nav>
				<!-- 글 작성 버튼 -->
				<a class="btn btn-outline-secondary" href="/freeBoard/write">글쓰기</a>
			</div>
			<!-- 검색창 -->
			<form class="d-flex justify-content-center mt-3">
				<select class="form-select me-2 selectOption" aria-label="검색 유형">
					<option selected>검색 유형 선택</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="author">작성자</option>
				</select> <input class="form-control me-2 search" type="search"
					placeholder="검색어를 입력하세요" aria-label="검색어">
				<button class="btn btn-outline-secondary" type="submit">검색</button>
			</form>
		</div>
	</div>
</div>
<!-- 부트스트랩 자바스크립트 및 필수 자바스크립트 -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {

		// parameta로 넘어오는 값 확인
		var urlParam = new URL(location.href).searchParams;
		const listType = document.getElementById("listType");

		// 각 쿼리 매개변수를 분리하여 가져오기
		var cate1 = urlParam.get('cate1');
		var id = urlParam.get('id');

		// list Type
		const typeValue = listType.value;

		console.log('url값: ' + urlParam); // url로 넘어오는 쿼리 스트링 cate1, id값 추출 
		console.log('type: ' + typeValue); // list Type 확인
		console.log('cate1: ' + cate1); // url로 넘어오는 쿼리 스트링 cate1값 파싱
		console.log('id: ' + id); // url로 넘어오는 쿼리 스트링 id값 파싱

		$.ajax({
			method : "GET",
			url : "/free-board/listAll",
			data : {
				cate1 : cate1,
				id : id
			},
			success : function(data) {
				alert("석세스 왔고 리스트 타입 확인: " + typeValue);


				if (data != null) {
					if (typeValue == "LIST") {
						
						console.log("데이터 확인: 리스트로 탔음");
						console.log("데이터 확인: " + data.dtoList[0].uid); // 받은 데이터 0번 인덱스의 uid값만 추출한 예 , uid 걍 값 확인 해본거임

					    // 데이터를 받아서 처리
					    var html = '';
					    for (var i = 0; i < data.dtoList.length; i++) {
					        var board = data.dtoList[i];
					        html += '<tr>';
					        html += '<td><a href="">' + board.title + '<span class="badge bg-secondary">[0]</span></a></td>';
					        html += '<td><a href="/product/userProduct?uId=' + board.uId + '"><span class="hu_nick_txt">'+board.name+'</span></a></td>';
					        html += '<td><span class="w_date">' + board.createAt + '</span></td>';
					        html += '<td class="text-center">'+board.view+'</td>'; 
					        html += '<td class="text-center"><span class="badge bg-primary">'+board.count +'</span></td>';
					        html += '</tr>';
					    }
					    
					    // 생성된 HTML을 테이블의 tbody에 추가
					    $('table tbody').html(html);
						
						
					} else if (typeValue == "CARD") {
						alert("데이터 ㅈㄴ 널임 열받음");
						//innerBody.innerHTML = `<h1>상품이 없습니다.</h1>`;

					}
				} else {
					innerBody.innerHTML = `<h1>작성된 게시물이 없습니다.</h1>`;
				}
			},
			error : function() {
				alert("에러");
			}

		});// ajax end

		
		// 검색시 타입 감지 및 확인
	    $("#searchType").change(function() {
            var selectedValue = $(this).val(); // 선택된 값 가져오기
            console.log("Selected value: " + selectedValue); // 콘솔에 출력
            $("#selectedValue").text("Selected value: " + selectedValue); // 선택된 값 표시
        });
		
		
		
		
		$("button[type='submit']").click(function(event) {
	        event.preventDefault();
		
	        var searchType = $(".selectOption").val();
            var searchKeyword = $(".search").val();
	        
            console.log('서치 타입: '+searchType);
            console.log('서치 내용: '+searchKeyword);
            
            
	        $.ajax({
				method : "GET",
				url : "/free-board/listAll",
				data : {
					cate1 : cate1,
					id : id,
					search: searchKeyword,
					searchType: searchType
					
					
				},
				success : function(data) {
					alert("석세스 왔고 리스트 타입 확인: " + typeValue);


					if (data != null) {
						if (typeValue == "LIST") {
							
							console.log("데이터 확인: 리스트로 탔음");
							console.log("데이터 확인: " + data.dtoList[0].uid); // 받은 데이터 0번 인덱스의 uid값만 추출한 예 , uid 걍 값 확인 해본거임

						    // 데이터를 받아서 처리
						    var html = '';
						    for (var i = 0; i < data.dtoList.length; i++) {
						        var board = data.dtoList[i];
						        html += '<tr>';
						        html += '<td><a href="">' + board.title + '<span class="badge bg-secondary">[0]</span></a></td>';
						        html += '<td><a href="/product/userProduct?uId=' + board.uId + '"><span class="hu_nick_txt">'+board.name+'</span></a></td>';
						        html += '<td><span class="w_date">' + board.createAt + '</span></td>';
						        html += '<td class="text-center">'+board.view+'</td>'; 
						        html += '<td class="text-center"><span class="badge bg-primary">'+board.count +'</span></td>';
						        html += '</tr>';
						    }
						    
						    // 생성된 HTML을 테이블의 tbody에 추가
						    $('table tbody').html(html);
							
							
						} else if (typeValue == "CARD") {
							alert("데이터 ㅈㄴ 널임 열받음");
							//innerBody.innerHTML = `<h1>상품이 없습니다.</h1>`;

						}
					} else {
						//innerBody.innerHTML = `<h1>작성된 게시물이 없습니다.</h1>`;
					}
				},
				error : function() {
					alert("에러");
				}

			})// ajax end

	        
		
		})// search end
	});
</script>


<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>