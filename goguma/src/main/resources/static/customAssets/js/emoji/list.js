const headMenus = document.querySelectorAll(".emoji--head-menu");
const headMenusBorder = document.querySelectorAll(".emoji--head-menu-title");
const innerBody = document.querySelector(".emoji--content-box");

const searchInput = document.querySelector(".emoji-search-input");
const searchBtn = document.querySelector(".emoji-search-btn");

let num = 0;

let listData = "";
load(num);

function load(num) {
	headMenus[num].className = "emoji--head-menu-on";
	headMenusBorder[num].className = "emoji--head-menu-title-on";
	$.ajax({
		type: "get",
		url: "/emoji/api/list/" + num,
		async: false,
		success: function(data) {
			if (data != "") {
				innerFun(data);
			} else {
				innerBody.innerHTML = `<h1>상품이 없습니다.</h1>`;
			}
		},
		error: function() {
			Swal.fire({
				icon: "error",
				title: "Oops...",
				text: "서버 에러가 발생하였습니다!",
			});
		}
	});
}

for (let i = 0; i < headMenus.length; i++) {
	headMenus[i].onclick = () => {
		for (let k = 0; k < headMenus.length; k++) {
			headMenus[k].className = "emoji--head-menu";
			headMenusBorder[k].className = "emoji--head-menu-title";
		}
		headMenus[i].className = "emoji--head-menu-on";
		headMenusBorder[i].className = "emoji--head-menu-title-on";
		load(i);
	}
}

function innerFun(list) {
	let innr = "";
	innerBody.textContent = "";
	if (list != "") {
		for (let i = 0; i < list.length; i++) {
			innr += `
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

function detailPaging(detail) {
	for (let i = 0; i < detail.length; i++) {
		detail[i].onclick = () => {
			location.href = "/emoji/detail/" + detail[i].id;
		}
	}
}

searchBtn.onclick = () => {
	if (searchInput.value == "") {
		Swal.fire({
			icon: "error",
			title: "Oops...",
			text: "검색어를 입력해주세요!",
		});
		searchInput.focus();
		return;
	}
	let str = searchInput.value;
	let pattern = /^[a-zA-Zㄱ-힣0-9|s]*$/;

	if (str.match(pattern)) {
		if (str.match(pattern).length > 0) {
			$.ajax({
				type: "get",
				url: "/emoji/api/search",
				data: {
					title: searchInput.value
				},
				success: function(data) {
					if (data != "") {
						innerFun(data);
					} else {
						innerBody.innerHTML = `<h1>상품이 없습니다.</h1>`;
					}
				},
				error: function() {
					alert("에러");
				}
			});
		}
	} else {
		innerBody.innerHTML = `<h1>상품이 없습니다.</h1>`;
	}
}









