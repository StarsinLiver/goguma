const COUNT_WISH_LIST = 1; // 관심이 많은 순 (찜 많은 순)
const COUNT_CHAT_ROOM = 2; // 채팅방이 많은 순
const HIGH_PRICE = 3;	// 가격 높은 순
const LOW_PRICE = 4; // 가격 낮은 순
let card = document.querySelector("#flexBox");
let pagination = document.querySelector(".pagination");

// 검색 조회
var currentPageIndex = 0;

// 차례 순서 클릭시 색깔 변경
document.addEventListener("DOMContentLoaded", function() {
	var searchTypes = document.querySelectorAll(".search-type");

	searchTypes.forEach(function(type) {
		type.addEventListener("click", function(event) {
			event.preventDefault();
			var dataType = type.dataset.type;
			if (dataType === "price-high") {
				document.querySelector('.search-type[data-type="price-low"]').classList.remove("selected");
			} else if (dataType === "price-low") {
				document.querySelector('.search-type[data-type="price-high"]').classList.remove("selected");
			}
			type.classList.toggle("selected");
		});
	});


	// 시작시 컨텐츠
	$.ajax({
		type: "GET",            // HTTP method type(GET, POST) 형식이다.
		url: "http://localhost:80/product/search-product",      // 컨트롤러에서 대기중인 URL 주소이다.
		// dataType: "application/json",
		success: function(res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			console.log(res);
			makeCard(res.content);
			makePaging(res.number, res.totalPages, res.startPage, res.endPage);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
			alert("통신 실패.")
		}
	}); // ajax 완료



});

// 검색어를 입력할 때 색깔 변경
function highlightSearch(input) {
	var listItem = input.parentNode;
	var link = listItem.querySelector('.search-type');
	if (input.value.trim() !== '') {
		link.classList.add('selected');
	} else {
		link.classList.remove('selected');
	}
}

// 검색 버튼을 눌렀을 때
function checkSelected() {
	var selectedItems = []; // 검색 순서 
	var searchTypes = document.querySelectorAll(".search-type");
	var search = document.querySelector(".search-input").value;
	var searchAddress = document.querySelector(".search-input-address").value;
	var lowPrice = document.querySelector(".search-low-price").value;
	var highPrice = document.querySelector(".search-high-price").value;
	var index = 1;

	searchTypes.forEach(function(type) {
		if (type.classList.contains("selected") && type.dataset.type !== "title" && type.dataset.type !== "address") {
			if (type.dataset.type === "chat") {
				selectedItems.push(2);
			} else if (type.dataset.type === "price-high") {
				selectedItems.push(3);
			} else if (type.dataset.type === "price-low") {
				selectedItems.push(4);
			} else {
				selectedItems.push(index);
				index++;
			}
		}
	});

	if (lowPrice > highPrice || lowPrice < 0 || highPrice < 0) {
		alert("가격이 잘못 되었습니다.");
		return;
	}

	// 결과
	console.log("선택된 항목: " + selectedItems.join(","));
	console.log("제목 검색 ", search);
	console.log("주소 검색 ", searchAddress);
	console.log("낮은 가격 ", lowPrice);
	console.log("높은 가격 ", highPrice);

	find(selectedItems, search, searchAddress, lowPrice, highPrice, currentPageIndex, null)
}

// 초기화 버튼 클릭시 초기화
function resetSelection() {
	var searchTypes = document.querySelectorAll(".search-type");

	searchTypes.forEach(function(type) {
		type.classList.remove("selected");
	});
}

// 조회
const find = (selectedItems, search, searchAddress, lowPrice, highPrice, page, size) => {
	currentPageIndex = 0;
	let sortWishList = "N";
	let sortChatRoom = "N";
	let sortHighPrice = "N";
	let sortLowPrice = "N";

	// selectedItems 확인
	if (selectedItems != null) {
		for (var i = 0; i < selectedItems.length; i++) {
			console.log(selectedItems[i]);
			switch (selectedItems[i]) {
				case COUNT_WISH_LIST: sortWishList = "Y"; break;
				case COUNT_CHAT_ROOM: sortChatRoom = "Y"; break;
				case HIGH_PRICE: sortHighPrice = "Y"; break;
				case LOW_PRICE: sortLowPrice = "Y"; break;
			}// switch 문 종료
		}// for 문 종료
	}// if 문 종료

	let data = {
		sortWishList: sortWishList,
		sortChatRoom: sortChatRoom,
		sortHighPrice: sortHighPrice,
		sortLowPrice: sortLowPrice,
		search: search,
		searchAddress: searchAddress,
		lowPrice: lowPrice,
		highPrice: highPrice,
		page: page,
		size: size
	}
	console.log(data);

	$.ajax({
		type: "GET",            // HTTP method type(GET, POST) 형식이다.
		url: "http://localhost:80/product/search-product",      // 컨트롤러에서 대기중인 URL 주소이다.
		data: data,
		// dataType: "application/json",
		success: function(res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			console.log(res);
			makeCard(res.content);
			makePaging(res.number, res.totalPages, res.startPage, res.endPage);
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
			alert("통신 실패.")
		}
	}); // ajax 완료
}

// 카드 만들기
const makeCard = (content) => {
	
	let div = "";
	for (var i = 0; i < content.length; i++) {
		
		let file = content[i].file.split(",");
		console.log(file);
		div +=
			`
		<article class="card">
			<a class="card-link" href="/product/productDetail?pId=${content[i].pid}">
				<div class="card-photo" style="width : 229px; height : 274px;">
					<img src="/images/upload/${file[0]}" />
				</div>
				<div class="card-desc">
					<h2 class="card-title">${content[i].name}</h2>
					<div class="card-price">${content[i].price} 원</div>
					<div class="card-region-name">${content[i].address}</div>
					<div class="card-counts">
						<span>관심 ${content[i].countWishList} </span> ∙ <span>채팅 ${content[i].countChatRoom}</span>
					</div>
				</div>
			</a>
		</article>
		`
	}

	card.innerHTML = div;
}

// 페이징 처리
function changePage(pageNumber) {
	var paginationLinks = document.querySelectorAll('.pagination li a');
	if (pageNumber === -1 && currentPageIndex > 1) {
		currentPageIndex--;
	} else if (pageNumber === 1 && currentPageIndex < paginationLinks.length - 2) {
		currentPageIndex++;
	} else if (pageNumber > 1 && pageNumber < paginationLinks.length - 1) {
		currentPageIndex = pageNumber;
	}

	currentPageIndex = pageNumber;
	// 검색
	checkSelected();
	// 페이지 네이션 
	updatePagination();
}

// 색 변경
function updatePagination() {
	var paginationLinks = document.querySelectorAll('.pagination li a');
	paginationLinks.forEach(function(link, index) {
		if (index === currentPageIndex) {
			link.classList.add('active');
		} else {
			link.classList.remove('active');
		}
	});
}

// 페이징 처리 숫자 만들기
const makePaging = (currentPage, totalPage, startPage, endPage) => {
	console.log("currentPage : " + currentPage);
	console.log("totalPage : " + totalPage);
	console.log("startPage : " + startPage);
	console.log("endPage : " + endPage);

	let div = `<li><a href="#flexBox" onclick="changePage(${currentPage - 1 < 0 ? 0 : currentPage - 1})">&laquo;</a></li>`;
	for (var i = (currentPage - 3 < 0 ? 0 : currentPage - 3); i < (currentPage + 3 > totalPage ? totalPage : currentPage + 3); i++) {
		div +=
			`<li><a href="#flexBox" onclick="changePage(${i})">${i + 1}</a></li>`
	}
	div += `<li><a href="#flexBox" onclick="changePage(${currentPage + 2 > totalPage ? totalPage - 1 : currentPage + 1})">&raquo;</a></li>`

	pagination.innerHTML = div;
}
