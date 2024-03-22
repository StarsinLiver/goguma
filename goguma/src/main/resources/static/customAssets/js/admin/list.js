const headMenus = document.querySelectorAll(".emoji--head-menu");
const headMenusBorder = document.querySelectorAll(".emoji--head-menu-title");
const innerBody = document.querySelector(".emoji--content-box");

let num = 0;
let page = 0;
let totalPages = 0;

let listData = "";
load(num);

function load(num){
	let search = document.querySelector('.emoji-search-input').value;
	
	headMenus[num].className = "emoji--head-menu-on";
	headMenusBorder[num].className = "emoji--head-menu-title-on";
	console.log('페이지 로드 에이젝스 시작');
	$.ajax({
		type : "get",
		url : "/admin/emoji/" + num + `?search=${search}&page=${page}`,
		async : false,
		success : function(data){
			if(data != ""){
				totalPages = data.totalPages;
				innerFun(data.content);
				displayPageNumber(data.number , data.totalPages);
			}else{
				console.log("실패");
			}
		},
		error : function(){
			alert("에러");
		}
	});
}

for(let i = 0; i < headMenus.length; i++){
	headMenus[i].onclick = () => {
		for(let k = 0; k < headMenus.length; k++){
			headMenus[k].className = "emoji--head-menu";
			headMenusBorder[k].className = "emoji--head-menu-title";
		}
		headMenus[i].className = "emoji--head-menu-on";
		headMenusBorder[i].className = "emoji--head-menu-title-on";
		load(i);
	}
}

// 화면에 출력
function innerFun(list){
	
	console.log('이너펑션 시작 리스트 데이터 확인: ' + list);
		
	let innr = "";
	innerBody.textContent = "";
	if(list != ""){
		for(let i = 0; i < list.length; i++){
			innr += 
			`
				<div class="emoji--item-box" id="${list[i].id}">
                    <div class="emoji--img-box">
                        <img src="/images/upload/emoji/${list[i].file}" alt="이모티콘">
                    </div>
                    <div class="emoji--item-title-box">
                        <span>${list[i].name}</span>
                    </div>
                </div>
			`;
		}
		innerBody.innerHTML = innr;
		const detail = document.querySelectorAll(".emoji--item-box");
		detailPaging(detail);
	}
}

// 디테일로 가는 페이지 기능
function detailPaging(detail){
	for(let i = 0; i < detail.length; i++){
		detail[i].onclick = () => {
			location.href = "/admin/emoji/detail/" + detail[i].id;
		}
	}
}

// 페이징 처리
function displayPageNumber (currentPage , totalPages) {
	
	const disPageNumber = document.querySelector(".emoji--num-box")
	let display = "";
	for(var i = 0; i < (totalPages < 0 ? 0 : totalPages); i++) {
		console.log(i);
		display +=`<span class="emoji--num" onclick="onclickPage(${i})" ${i == currentPage ? 'selected' : ''}>${i + 1}</span>`
	}
	disPageNumber.innerHTML = display;
}

// 페이지 넘버를 누룰 시
const onclickPage = (number) => {
	page = number;
	load(num)
}

// 서치 박스를 누를시
const onclickSearch = () => {
	page = 0;
	load(num);
}
// 페이지 화살표시를 누를 시
const onclickArray = (text) => {
	if(text == 'prev') {
		page = page == 0 ? 0 : page - 1;
	} 
	if(text == 'next') {
		page = page == totalPages - 1 ? page : page + 1;
	}
	load(num);
}