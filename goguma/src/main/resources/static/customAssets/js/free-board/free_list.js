/**
 * 
 */

 
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
	//console.log("num : " + num);

	pagingFnc(num);
}

// 이후 10개 페이지 넘기기
function endPage(end) {

	end += 1;
	reviewPage = end;

	//console.log("end : " + end);
	pagingFnc(end);
}

var searchType = $(".selectOption").val();
var searchKeyword = $(".search").val();


//검색시 타입 감지 및 확인
$(".selectOption").change(
	
		function() {
		var searchType = $(this).val(); // 선택된 값 가져오기
		console.log("Selected value11111: "
				+ searchType); // 콘솔에 출력
				
	
						
        // 로컬 스토리지에 저장
        localStorage.setItem("searchType", searchType);
				
						
});

//검색시 타입 감지 및 확인
$(".search").change(
	
		function() {
		var search =  $(this).val();
		console.log('서치된 값 확인 키워드임: '+ $(this).val()); // 선택된 값 가져오기
		console.log("Selected value22222: "
				+ searchKeyword); // 콘솔에 출력
	
						
        // 로컬 스토리지에 저장
        localStorage.setItem("searchKeyword", search);
				
						
});


// 페이지 넘어 갈때 사용할 요청

function pagingFnc(page) {
	
	
	console.log('페이지 펑션으로 들어오는 page: '+ page);
	console.log('페이지 펑션으로 들어오는 searchKeyword: '+ searchKeyword);
	console.log('페이지 펑션으로 들어오는 searchType: '+ searchType);
	console.log('페이지 펑션으로 들어오는 로컬 스토리지 searchKeyword: '+ localStorage.getItem("searchKeyword"));
	console.log('페이지 펑션으로 들어오는 로컬 스토리지 searchType: '+ localStorage.getItem("searchType"));

	

	
	
	searchKeyword = localStorage.getItem("searchKeyword");
	searchType = localStorage.getItem("searchType");
	
	
	console.log('페이지 펑션으로 들어오는 searchKeyword 로컬 스토리지에서 들고옴: '+ searchKeyword);
	console.log('페이지 펑션으로 들어오는 searchType 로컬 스토리지에서 들고옴: '+ searchType);
	
$.ajax({
			method : "GET",
			url : "/free-board/listAll",
			data : {
				cate1 : cate1,
				id : id,
				pg : page,
				search: searchKeyword,
		        searchType: searchType,
		        listType: typeValue,
				
			},
			success : function(data) {

				console.log('페이지 이동시 값 1: '+ cate1);
				console.log('페이지 이동시 값 2: '+ id);
				console.log('페이지 이동시 값 3: '+ page);
				console.log('페이지 이동시 값 4: '+ searchKeyword);
				console.log('페이지 이동시 값 5: '+ searchType);
				console.log('페이지 이동시 값 5: '+ typeValue);
				
				if (data != null) {
					if (typeValue == "LIST") {

						console.log("데이터 확인: 리스트로 탔음");
						console.log("데이터 확인: " + data.dtoList[0].uid); // 받은 데이터 0번 인덱스의 uid값만 추출한 예 , uid 걍 값 확인 해본거임
						console.log("데이터 확인: start: " + data.start);
						console.log("데이터 확인: total: " + data.total);
						console.log("데이터 확인: last: " + data.last);
						console.log("데이터 확인: size: " + data.size);
						console.log("데이터 확인: pg: " + data.pg);

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
					
						$('.listType').html(tableCon);
						
					$('table tbody').html(html);
						
						
						for (var i = 0; i < data.dtoList.length; i++) {
							var board = data.dtoList[i];
							html += '<tr>';
							html += '<td><a href="/freeBoard/detail?id='
									+ board.id
									+ '">'
									+ board.title
									+ '<span class="badge bg-secondary">[0]</span></a></td>';
							html += '<td><a href=""><span class="hu_nick_txt">'
									+ board.name + '</span></a></td>';
							html += '<td><span class="w_date">'
									+ board.createAt + '</span></td>';
							html += '<td class="text-center">'
									+ board.view + '</td>';
							html += '<td class="text-center"><span class="badge bg-primary">'
									+ board.count + '</span></td>';
							html += '</tr>';
						}

						// 생성된 HTML을 테이블의 tbody에 추가
						$('.listType').html(html);

					} else if (typeValue == "CARD") {
						
						html = "";
						
						for (var i = 0; i < data.dtoList.length; i++) {
							
						var board = data.dtoList[i];
						
						
						html +=	'<div class="col-md-3">';
						html +=	'<div class="card2">';
						html +=	'<a class="cardA" href="/freeBoard/detail?id='+ board.id 
								+'"> <img src="/images/upload/'+board.ufile +'cat-1.png" class="card2-img-top" alt="이미지 1" style="height: 182px;">';
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
						$('.pagingPos').html(paging); 

					}
				} else if(1 > data.total) {
					alert("검색된 데이터가 존재하지 않습니다.");
					//innerBody.innerHTML = `<h1>작성된 게시물이 없습니다.</h1>`;
				}
			},
			error : function() {
				alert("에러");
			}

		});// ajax end

} // paginng 함수 종료


	


// 페이지 로드시에 실행
$(document).ready(function() {

					

	console.log('url값: ' + urlParam); // url로 넘어오는 쿼리 스트링 cate1, id값 추출 
	console.log('type: ' + typeValue); // list Type 확인
	console.log('cate1: ' + cate1); // url로 넘어오는 쿼리 스트링 cate1값 파싱
	console.log('id: ' + id); // url로 넘어오는 쿼리 스트링 id값 파싱
	
	localStorage.clear();

	$.ajax({
				method : "GET",
				url : "/free-board/listAll",
				data : {
					cate1 : cate1,
					id : id,
					search: searchKeyword,
			        searchType: searchType,
			        listType: typeValue,
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
							$('.pagingPos').html(paging);

						} else if (typeValue == "CARD") {
							
							
							html = "";
							
							for (var i = 0; i < data.dtoList.length; i++) {
								
							var board = data.dtoList[i];
							
							
							html +=	'<div class="col-md-3">';
							html +=	'<div class="card2">';
							html +=	'<a class="cardA" href="/freeBoard/detail?id='+ board.id 
									+'"> <img src="/images/upload/'+board.ufile +'cat-1.png" class="card2-img-top" alt="이미지 1" style="height: 182px;">';
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
							$('.pagingPos').html(paging); 
							
							
						}
					} else if(1 > data.total) {
						alert("검색된 데이터가 존재하지 않습니다.");
					}
				},
				error : function() {
					alert("에러");
				}

			});/* list ajax end*/
		
		 var type = "LIST";
		
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
				            console.log('로그 확인 데이터 타입으로다가: ' + type);
				
				            if (type == 'LIST') {
				                // 첫 번째 버튼에만 active 클래스 추가
				                var isActive = i === 0 ? ' active' : '';
				                btn += '<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="' + i + '" class="' + isActive + '" aria-current="true" aria-label="Slide ' + i + '"></button>';
				
				                // 이미지 추가
				                img += '<div class="carousel-item' + isActive + '">';
				                img += '<a href="' + board.url + '"><img src="/images/upload/' + board.file + '" class="d-block w-100" alt="..." style="max-height: 200px; max-width: 1000px"></a>';
				                img += '</div>';
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


$("button[type='submit']")
		.click(
				function(event) {
					event.preventDefault();

					var searchType = $(".selectOption").val();
					var searchKeyword = $(".search").val();

					console.log('서치 타입: ' + searchType);
					console.log('서치 내용: '
							+ searchKeyword);

					$.ajax({
								method : "GET",
								url : "/free-board/listAll",
								data : {
									cate1 : cate1,
									id : id,
									search: searchKeyword,
							        searchType: searchType,
							        listType: typeValue,

								},
								success : function(data) {
								

									if (data != null) {
										if (typeValue == "LIST") {

											console.log("데이터 확인: "+ data.dtoList[0].uid); // 받은 데이터 0번 인덱스의 uid값만 추출한 예 , uid 걍 값 확인 해본거임

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
											$('.pagingPos').html(paging);

											
											
											

										} else if (typeValue == "CARD") {
											alert("데이터 ㅈㄴ 널임 열받음");
											html = "";
											
											for (var i = 0; i < data.dtoList.length; i++) {
												
												var board = data.dtoList[i];
												html +=	'<div class="col-md-3">';
												html +=	'<div class="card2">';
												html +=	'<a class="cardA" href="/freeBoard/detail?id='+ board.id 
														+'"> <img src="/images/upload/'+board.ufile +'cat-1.png" class="card2-img-top" alt="이미지 1" style="height: 182px;">';
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
												$('.pagingPos').html(paging); 
												
												
											}
									}else if(1 > data.total) {
										alert("검색된 데이터가 존재하지 않습니다.");
										//innerBody.innerHTML = `<h1>작성된 게시물이 없습니다.</h1>`;
									}
								},
								error : function() {
									alert("에러");
								}

							})// ajax end

				})// search end

