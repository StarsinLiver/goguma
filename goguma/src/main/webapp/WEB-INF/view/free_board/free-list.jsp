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
	font-family: ${	type.font},sans-serif;
	font-size:large;
}

.h2font {
	font-family: ${	type.font},sans-serif;
	font-size:large;
}


.card2 .cardA {
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	transition: transform 0.3s ease;
	position: relative;
	display: flex;
	flex-direction: column;
	border: 1px solid rgba(0, 0, 0, 0.125);
	margin-bottom: 10px;
	
}

.card2 {
	border: 1px solid #ccc; /* 테두리 스타일과 색상 지정 */
	border-radius: 10px; /* 카드의 모서리를 둥글게 만듦 */
	padding: 10px; /* 내부 여백 추가 */
	margin-top: 30px;
	background: white;
}

/* CSS */
.txt-wrap {
	display: flex;
	flex-direction: column;
}

.txt-wrap a {
	margin-bottom: 20px;
	margin-left: 5px;
}

.txt-wrap .user, .txt-wrap .cnt {
	display: flex;
}

.txt-wrap .user span, .txt-wrap .cnt span {
	margin-right: 10px;
	margin-left: 5px;
}

.board-img::before {
	background-image: url(/customAssets/images/common_img_sprite.png);
	background-repeat: no-repeat;
	display: block;
	position: relative;
}

.cnt .view::before {
	content: "";
	top: 8px;
	margin: 0 3px 0 0;
	width: 14px;
	height: 9px;
	background-position: -299px -11px;
}

.cnt .like::before {
	content: "";
	top: 4px;
	margin: 0 4px 0 85px;
	width: 17px;
	height: 15px;
	background-position: -326px -7px;
}

.cnt span {
	margin-right: 10px;
	position: relative;
	display: flex;
}

.txt-wrap .user span.layerNickName {
	font-size: 14px;
	color: gray;
}

.txt-wrap a.subject-link {
	font-weight: bold;
}

.cardType{
    display: flex;
    flex-wrap: wrap;

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
				
				<!-- 카드타입 출력 위치 -->
				<div class="cardType" >
				</div>
				
				<!-- 리스트 타입 출력 위치 -->
				<div class="listData" >
				</div>
			
			<!-- 글 작성 버튼 및 검색창 -->
			<div class="d-flex justify-content-between mt-3 align-items-center">
				<!-- 페이징 버튼 -->
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<!-- 여기서 부터 페이징 생성 예정 -->


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

// parameta로 넘어오는 값 확인
var urlParam = new URL(location.href).searchParams;
var listType = document.getElementById("listType");

// 각 쿼리 매개변수를 분리하여 가져오기
var cate1 = urlParam.get('cate1');
var id = urlParam.get('id');

// list Type
const typeValue = listType.value;



// 이전 10개 페이지 넘기기
function startPage(start) {

	start -= 1;
	reviewPage = start;

	console.log("start : " + start);
	pagingFnc(start);

}

// 페이지 넘기기
function nextPage(num) {
	console.log("num : " + num);

	pagingFnc(num);
}

// 이후 10개 페이지 넘기기
function endPage(end) {

	end += 1;
	reviewPage = end;

	console.log("end : " + end);
	pagingFnc(end);
}

var searchType = $(".selectOption").val();
var searchKeyword = $(".search").val();


//검색시 타입 감지 및 확인
$("#searchType").change(
	
		function() {
		var selectedValue = $(this).val(); // 선택된 값 가져오기
		console.log("Selected value: "
				+ selectedValue); // 콘솔에 출력
		$("#selectedValue").text(
				"Selected value: "
						+ selectedValue); // 선택된 값 표시
});


// 페이지 넘어 갈때 사용할 요청




	


// 페이지 로드시에 실행
$(document).ready(function() {

					

	console.log('url값: ' + urlParam); // url로 넘어오는 쿼리 스트링 cate1, id값 추출 
	console.log('type: ' + typeValue); // list Type 확인
	console.log('cate1: ' + cate1); // url로 넘어오는 쿼리 스트링 cate1값 파싱
	console.log('id: ' + id); // url로 넘어오는 쿼리 스트링 id값 파싱
	
	

	$.ajax({
				method : "GET",
				url : "/free-board/listAll",
				data : {
					cate1 : cate1,
					id : id,
					search: searchKeyword,
			        searchType: searchType,
			        listType: typeValue
				},
				success : function(data) {

					if (data != null) {
						if (typeValue == "LIST") {

							console.log("데이터 확인: 리스트로 탔음");
							console.log("데이터 확인: "
									+ data.dtoList[0].uid); // 받은 데이터 0번 인덱스의 uid값만 추출한 예 , uid 걍 값 확인 해본거임
							console.log("데이터 확인: start: "
									+ data.start);
							console.log("데이터 확인: total: "
									+ data.total);
							console.log("데이터 확인: last: "
									+ data.last);
							console.log("데이터 확인: size: "
									+ data.size);
							console.log("데이터 확인: pg: "
									+ data.pg);

							// 데이터를 받아서 처리
							var html = '';
							var tableCon = '';
							
							
							tableCon += '<table class="table table-bordered" style="background: white;">';
							tableCon += '<thead>';
							tableCon +=	'<tr>';
							tableCon +=		'<th scope="col" width="295" class="text-center">제목</th>';
							tableCon +=		'<th scope="col" width="140" class="text-center">작성자</th>';
							tableCon +=		'<th scope="col" width="115" class="text-center">등록일</th>';
							tableCon +=		'<th scope="col" width="45" class="text-center">조회</th>';
							tableCon +=		'<th scope="col" width="35" class="text-center">추천</th>';
							tableCon +=		'</tr>';
							tableCon += '</thead>';
							tableCon += '<tbody class="listType">';
							tableCon += '</tbody>';
							tableCon += '</table>';
						
							$('.listData').html(tableCon);
							
							
							
							
							for (var i = 0; i < data.dtoList.length; i++) {
								var board = data.dtoList[i];
								html += '<tr>';
								html += '<td><a href="/freeBoard/detail?id='
										+ board.id
										+ '">'
										+ board.title
										+ '<span class="badge bg-secondary">[0]</span></a></td>';
								html += '<td><a href=""><span class="hu_nick_txt">'
										+ board.name
										+ '</span></a></td>';
								html += '<td><span class="w_date">'
										+ board.createAt
										+ '</span></td>';
								html += '<td class="text-center">'
										+ board.view
										+ '</td>';
								html += '<td class="text-center"><span class="badge bg-primary">'
										+ board.count
										+ '</span></td>';
								html += '</tr>';
							}

							// 생성된 HTML을 테이블의 tbody에 추가
							$('table tbody').html(html);

							var paging = '';

							if (data.start > 1) {
								paging += '<li class="page-item"><span class="page-link" onclick="startPage('
										+ data.start
										+ ')">이전</span></li>';
							}
							for (let i = data.start; i <= data.end; i++) {
								paging += '<li class="page-item"><span class="page-link" onclick="nextPage('
										+ i
										+ ')">'
										+ i
										+ '</span></li>';
							}
							if (data.end < data.last) {
								paging += '<li class="page-item"><span class="page-link" onclick="endPage('
										+ data.end
										+ ')">이후</span></li>';
							}

							// 생성된 HTML을 테이블의 tbody에 추가
							$('nav ul').html(paging);

						} else if (typeValue == "CARD") {
							
							
							html = "";
							
							for (var i = 0; i < data.dtoList.length; i++) {
								
							var board = data.dtoList[i];
							
							
							html +=	'<div class="card2">';
							html +=	'<a class="cardA" href="/freeBoard/detail?id='+ board.id 
									+'"> <img src="/assets/images/'+board.ufile +'cat-1.png" class="card2-img-top" alt="이미지 1" style="height: 182px;">';
							html +=	'<div class="txt-wrap">';
							html +=	'<a href="/freeBoard/detail?id='+  board.id  +'" class="subject-link tit">'+ board.title +'<span data-opinion-bbs-comeidx="2775" data-opinion-bbs-uid="92831" data-opinion-bbs-opi="1" class="con-comment">[1]</span></a>';
							html +=	'<div class="user">';
							html += '<span class="layerNickName" onclick="" style="">'+ board.name +'</span>';
							html +=	'</div>';
							html +=	'<div class="cnt">';
							html +=	'<span class="view board-img">626</span> <span class="like board-img">1</span>';
							html +=	'</div>';
							html +=	'</div>';
							html +=	'</a>';
							html +=	'</div>';
							
							}
							
							// 생성된 HTML을 테이블의 tbody에 추가
							$('.cardType').html(html);

					 		var paging = '';

							if (data.start > 1) {
								paging += '<li class="page-item"><span class="page-link" onclick="startPage('
										+ data.start
										+ ')">이전</span></li>';
							}
							for (let i = data.start; i <= data.end; i++) {
								paging += '<li class="page-item"><span class="page-link" onclick="nextPage('
										+ i
										+ ')">'
										+ i
										+ '</span></li>';
							}
							if (data.end < data.last) {
								paging += '<li class="page-item"><span class="page-link" onclick="endPage('
										+ data.end
										+ ')">이후</span></li>';
							}

							// 생성된 HTML을 테이블의 tbody에 추가
							$('nav ul').html(paging); 
							
							
						}
					} else {
						innerBody.innerHTML = `<h1>작성된 게시물이 없습니다.</h1>`;
					}
				},
				error : function() {
					alert("에러");
				}

			});// ajax end
});


$("button[type='submit']")
		.click(
				function(event) {
					event.preventDefault();

					var searchType = $(".selectOption")
							.val();
					var searchKeyword = $(".search")
							.val();

					console.log('서치 타입: ' + searchType);
					console.log('서치 내용: '
							+ searchKeyword);

					$.ajax({
								method : "GET",
								url : "/free-board/listAll",
								data : {
									cate1 : cate1,
									id : id,
									search : searchKeyword,
									searchType : searchType,
									listType: typeValue

								},
								success : function(data) {
								

									if (data != null) {
										if (typeValue == "LIST") {

											console
													.log("데이터 확인: 리스트로 탔음");
											console
													.log("데이터 확인: "
															+ data.dtoList[0].uid); // 받은 데이터 0번 인덱스의 uid값만 추출한 예 , uid 걍 값 확인 해본거임

															// 데이터를 받아서 처리
															var html = '';
															var tableCon = '';
															
															
															tableCon += '<table class="table table-bordered" style="background: white;">';
															tableCon += '<thead>';
															tableCon +=	'<tr>';
															tableCon +=		'<th scope="col" width="295" class="text-center">제목</th>';
															tableCon +=		'<th scope="col" width="140" class="text-center">작성자</th>';
															tableCon +=		'<th scope="col" width="115" class="text-center">등록일</th>';
															tableCon +=		'<th scope="col" width="45" class="text-center">조회</th>';
															tableCon +=		'<th scope="col" width="35" class="text-center">추천</th>';
															tableCon +=		'</tr>';
															tableCon += '</thead>';
															tableCon += '<tbody class="listType">';
															tableCon += '</tbody>';
															tableCon += '</table>';
														
															$('.listData').html(tableCon);
															
											for (var i = 0; i < data.dtoList.length; i++) {
												var board = data.dtoList[i];
												html += '<tr>';
												html += '<td><a href="/freeBoard/detail?id='
														+ board.id
														+ '">'
														+ board.title
														+ '<span class="badge bg-secondary">[0]</span></a></td>';
												html += '<td><a href=""><span class="hu_nick_txt">'
														+ board.name
														+ '</span></a></td>';
												html += '<td><span class="w_date">'
														+ board.createAt
														+ '</span></td>';
												html += '<td class="text-center">'
														+ board.view
														+ '</td>';
												html += '<td class="text-center"><span class="badge bg-primary">'
														+ board.count
														+ '</span></td>';
												html += '</tr>';

											}

											// 생성된 HTML을 테이블의 tbody에 추가
											$('table tbody').html(html);
											
											
											var paging = '';

											if (data.start > 1) {
												paging += '<li class="page-item"><span class="page-link" onclick="startPage('
														+ data.start
														+ ')">이전</span></li>';
											}
											for (let i = data.start; i <= data.end; i++) {
												paging += '<li class="page-item"><span class="page-link" onclick="nextPage('
														+ i
														+ ')">'
														+ i
														+ '</span></li>';
											}
											if (data.end < data.last) {
												paging += '<li class="page-item"><span class="page-link" onclick="endPage('
														+ data.end
														+ ')">이후</span></li>';
											}

											// 생성된 HTML을 테이블의 tbody에 추가
											$('nav ul').html(paging);

											
											
											

										} else if (typeValue == "CARD") {
											alert("데이터 ㅈㄴ 널임 열받음");
											html = "";
											
											for (var i = 0; i < data.dtoList.length; i++) {
												
												var board = data.dtoList[i];
												html +=	'<div class="col-md-3">';
												html +=	'<div class="card2">';
												html +=	'<a class="cardA" href="/freeBoard/detail?id='+ board.id 
														+'"> <img src="/assets/images/'+board.ufile +'cat-1.png" class="card2-img-top" alt="이미지 1" style="height: 182px;">';
												html +=	'<div class="txt-wrap">';
												html +=	'<a href="/freeBoard/detail?id='+  board.id  +'" class="subject-link tit">'+ board.title +'<span data-opinion-bbs-comeidx="2775" data-opinion-bbs-uid="92831" data-opinion-bbs-opi="1" class="con-comment">[1]</span></a>';
												html +=	'<div class="user">';
												html += '<span class="layerNickName" onclick="" style="">'+ board.name +'</span>';
												html +=	'</div>';
												html +=	'<div class="cnt">';
												html +=	'<span class="view board-img">626</span> <span class="like board-img">1</span>';
												html +=	'</div>';
												html +=	'</div>';
												html +=	'</a>';
												html +=	'</div>';
												html +=	'</div>';
												
												}
												// 생성된 HTML을 테이블의 tbody에 추가
												$('.cardType').html(html);

										 		var paging = '';

												if (data.start > 1) {
													paging += '<li class="page-item"><span class="page-link" onclick="startPage('
															+ data.start
															+ ')">이전</span></li>';
												}
												for (let i = data.start; i <= data.end; i++) {
													paging += '<li class="page-item"><span class="page-link" onclick="nextPage('
															+ i
															+ ')">'
															+ i
															+ '</span></li>';
												}
												if (data.end < data.last) {
													paging += '<li class="page-item"><span class="page-link" onclick="endPage('
															+ data.end
															+ ')">이후</span></li>';
												}

												// 생성된 HTML을 테이블의 tbody에 추가
												$('nav ul').html(paging); 
												
												
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


</script>


<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>