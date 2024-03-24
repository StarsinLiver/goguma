<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/product/userProduct.css">
<style>
/* 추가적인 CSS 스타일링은 여기에 추가할 수 있습니다. */
/* 검색창 스타일링 */
.search-form {
	width: calc(50% - 5px); /* 검색창 폭 조절 */
}

/* 검색 유형 선택 셀렉트 박스 스타일링 */
.search-select {
	width: calc(50% - 5px); /* 셀렉트 박스 폭 조절 */
}

h2 {
	background-color: #f2f2f2;
	padding: 10px;
	margin-top: 20px;
}
h4 {
    background-color: #f2f2f2;
    padding: 10px;
}
.card2 a {
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	transition: transform 0.3s ease;
	position: relative;
	display: flex;
	flex-direction: column;
	border: 1px solid rgba(0, 0, 0, 0.125);
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
	margin: 0px 0px -9px -20px;
	width: 14px;
	height: 9px;
	background-position: -299px -11px;
}

.cnt .like::before {
	content: "";
	top: 4px;
	margin: 0px 15px -15px -20px;
	width: 17px;
	height: 15px;
	background-position: -326px -7px;
}

.list-group-item {
	display: flex; /* Flexbox를 사용하여 수평 정렬 설정 */
	justify-content: space-between; /* 요소 간의 간격을 최대로 설정하여 오른쪽 정렬 */
	align-items: center; /* 수직 가운데 정렬 설정 */
}

.list-group-item .text-center {
	flex-grow: 1; /* 남은 공간을 모두 차지하도록 설정 */
	text-align: right; /* 텍스트를 오른쪽 정렬 */
}

.list-group-item .cnt {
	display: flex; /* Flexbox를 사용하여 내부 요소를 수평 정렬 */
	align-items: center; /* 수직 가운데 정렬 설정 */
}

.list-group-item .cnt .board-img {
	margin-left: 30px; /* 이미지와 텍스트 사이에 간격 추가 */
}

.list-group-item a {
	display: block;
	width: 220px; /* 원하는 너비 설정 */
	white-space: nowrap; /* 줄 바꿈 방지 */
	overflow: hidden; /* 내용이 넘칠 경우 숨김 처리 */
	text-overflow: ellipsis; /* 넘친 내용을 ...으로 표시 */
}

.card-details {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	color: #fff;
	padding: 10px;
	text-align: center;
}
</style>

<!-- 메인 컨텐츠 -->
<!-- aside 시작 -->
<div style="display: flex;">
<div
	style="width: 13.6%; width: 13.6%; display: flex; flex-direction: column; align-items: flex-start; border-right: 1px solid;">
	<%@ include file="/WEB-INF/view/free_board/free_board_aside.jsp"%>
</div>
<!-- aside 끝 -->
<div class="container mt-4">

	<div class="row justify-content-center">
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
		<div class="col-lg-4">
			<h2>
				베스트 사진게시물<a href="/freeBoard/card" style="float: right;">더보기</a>
			</h2>
			<div class="row">
				<c:forEach var="board" items="${rDList}" varStatus="loop">
					<c:if test="${loop.index < 4}">
						<div class="col-md-6 mb-3">
							<div class="card2" onmouseover="highlightCard(this)"
								onmouseout="unhighlightCard(this)">
								<a href="/freeBoard/detail?id=${board.id}"> <img src="/images/upload/${board.file}"
									class="card2-img-top" alt="${board.title} 이미지"
									style="height: 105px">
									<div class="card-details">
										<p>${board.title}</p>
										<p>${board.goodCount}</p>
									</div>
								</a>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>

		<!-- 리스트 형식의 글 목록 -->
		<div class="col-lg-4">
			<h2>
				베스트 게시물<a href="/freeBoard/list" style="float: right;">더보기</a>
			</h2>
			<ul class="list-group">
				<c:forEach var="board" items="${rDList}" varStatus="loop">
					<c:if test="${loop.index < 6}">
						<li class="list-group-item">
							<td><a href="/freeBoard/detail?id=${board.id}">${board.title}</a></td>
							<td class="text-center">
								<div class="cnt">
									<span class="view board-img">${board.view}</span> <span
										class="like board-img">${board.goodCount}</span>
								</div>
						</td>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>

		
			<div class="container mt-8">
				<div class="row justify-content-center">
					<div class="col-lg-3" style="width: 22%;">
						<h4>${category1.subCategoryName}</h4>
						<div class="row">
							<c:forEach var="category" items="${categoryList1}"
								varStatus="loop">
								<c:if test="${loop.index < 2}">
									<div class="col-md-6 mb-3">
										<div class="card2" onmouseover="highlightCard(this)"
											onmouseout="unhighlightCard(this)">
											<a href="/freeBoard/detail?id=${category.id}"> <img src="/images/upload/${category.file}"
												class="card2-img-top" alt="${category.title} 이미지"
												style="height: 105px">
												<div class="card-details">
													<p>${category.title}</p>
												</div>
											</a>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<ul class="list-group">
							<c:forEach var="category" items="${categoryList1}"
								varStatus="loop">
								<c:if test="${loop.index < 4}">
									<li class="list-group-item">
										<td><a href="/freeBoard/detail?id=${category.id}">${category.title}</a></td>
										<td class="text-center">
											<div class="cnt">
												<span class="view board-img">${category.view}</span> <span
													class="like board-img">${category.goodCount}</span>
											</div>
									</td>
									</li>
								</c:if>
							</c:forEach>
						</ul>

					</div>

					<div class="col-lg-3" style="width: 22%;">
						<h4>${category2.subCategoryName}</h4>
						<div class="row">
							<c:forEach var="category" items="${categoryList2}"
								varStatus="loop">
								<c:if test="${loop.index < 2}">
									<div class="col-md-6 mb-3">
										<div class="card2" onmouseover="highlightCard(this)"
											onmouseout="unhighlightCard(this)">
											<a href="/freeBoard/detail?id=${category.id}"> <img src="/images/upload/${category.file}"
												class="card2-img-top" alt="${category.title} 이미지"
												style="height: 105px">
												<div class="card-details">
													<p>${category.title}</p>
												</div>
											</a>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<ul class="list-group">
							<c:forEach var="category" items="${categoryList2}"
								varStatus="loop">
								<c:if test="${loop.index < 4}">
									<li class="list-group-item">
										<td><a href="/freeBoard/detail?id=${category.id}">${category.title}</a></td>
										<td class="text-center">
											<div class="cnt">
												<span class="view board-img">${category.view}</span> <span
													class="like board-img">${category.goodCount}</span>
											</div>
									</td>
									</li>
								</c:if>
							</c:forEach>
						</ul>

					</div>

					<div class="col-lg-3" style="width: 22%;">
						<h4>${category3.subCategoryName}</h4>
						<div class="row">
							<c:forEach var="category" items="${categoryList3}"
								varStatus="loop">
								<c:if test="${loop.index < 2}">
									<div class="col-md-6 mb-3">
										<div class="card2" onmouseover="highlightCard(this)"
											onmouseout="unhighlightCard(this)">
											<a href="/freeBoard/detail?id=${category.id}"> <img src="/images/upload/${category.file}"
												class="card2-img-top" alt="${category.title} 이미지"
												style="height: 105px">
												<div class="card-details">
													<p>${category.title}</p>
												</div>
											</a>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<ul class="list-group">
							<c:forEach var="category" items="${categoryList3}"
								varStatus="loop">
								<c:if test="${loop.index < 4}">
									<li class="list-group-item">
										<td><a href="/freeBoard/detail?id=${category.id}">${category.title}</a></td>
										<td class="text-center">
											<div class="cnt">
												<span class="view board-img">${category.view}</span> <span
													class="like board-img">${category.goodCount}</span>
											</div>
									</td>
									</li>
								</c:if>
							</c:forEach>
						</ul>

					</div>
				</div>
			</div>
			<div class="col-lg-6" style="width: 75%;  margin-left: 14%;;">
				<div class="owl-screenshots owl-carousel owl-theme text-center">
				<c:forEach items="${listCreateAt}" var="list">
					<div class="owl-screen">
						<div class="service-widget">
							<div class="post-media entry wow fadeIn">
								<a href="/images/upload/${list.file}" data-rel="prettyPhoto[gal]"
									class="hoverbutton global-radius"><i
									class="flaticon-unlink"></i></a> <img src="/images/upload/${list.file}" alt=""
									class="img-responsive img-rounded">
								<div class="magnifier"></div>
							</div>
							
							<small><a href="/freeBoard/detail?id=${list.id}">${list.title}</a></small>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 부트스트랩 자바스크립트 및 필수 자바스크립트 -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
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
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>