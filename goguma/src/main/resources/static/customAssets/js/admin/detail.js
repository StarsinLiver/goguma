const headMenus = document.querySelectorAll(".emoji--head-menu");
const headMenusBorder = document.querySelectorAll(".emoji--head-menu-title");
const innerBody = document.querySelector(".emoji--content-box");

const mainImg = document.querySelectorAll(".e-img");
const changeImg = document.querySelectorAll(".c-img");  // 변경할 이미지
const changeFile = document.querySelectorAll(".changeFile");  // 변경할 이미지 인풋 태그
const changeTitle = document.querySelector("#changeName");  // 변경할 이미지 인풋 태그
const changePrice = document.querySelector("#changePrice");  // 변경할 가격 인풋 태그
const mainTitle1 = document.querySelector(".e-title");
const mainTitle2 = document.querySelector(".e-title2");
const mainPrice = document.querySelectorAll(".e-price");
const orderBtn = document.querySelector(".emoji--modify-btn");
const orderBtn2 = document.querySelector(".emoji--modify-btn2");
const modalMain = document.querySelector(".emoji--modal");
const modalCloseBtn = document.querySelector(".emoji--close-btn");

const agreeMain = document.querySelectorAll(".agree-main-box");
const agreeSub = document.querySelectorAll(".agree-sub-box");

let pageId = location.pathname.split("/")[4];

const deleteButton = document.querySelector(".emoji--delete-btn");

IMP.init('imp37413392');
let mainEmojiNum = 0;
let userInfo = getSession();

load();

function load() {
	$.ajax({
		type: "get",
		url: "/emoji/api/detail/main/" + pageId,
		async: false,
		success: function(data) {
			if (data != "") {
				innerMain(data);
				mainEmojiNum = data.id;
			} else {
				console.log("로드 디테일 실패");
			}
		},
		error: function() {
			console.log("로드 디테일 에러");
		}
	});
	$.ajax({
		type: "get",
		url: "/emoji/api/detail/sub/" + pageId,
		async: false,
		success: function(data) {
			if (data != "") {
				innerFun(data);
			} else {
				console.log("로드 디테일 서브 실패");
			}
		},
		error: function() {
			console.log("로드 디테일 서브 에러");
		}
	});
}

for (let i = 0; i < headMenus.length; i++) {
	headMenus[i].onclick = () => {
		location.href = "/emoji/list";
	}
}

function innerMain(data) {
	mainImg[0].src = "/images/upload/emoji/" + data.file;
	mainImg[1].src = "/images/upload/emoji/" + data.file;
	mainTitle1.textContent = data.name;
	mainTitle2.textContent = data.name;
	changeTitle.value = data.name;
	mainPrice[0].textContent = data.price;
	mainPrice[1].textContent = data.price;
	changePrice.value = data.price;
}



// 이모티콘 변경하기 모달 창에서 선택한 파일 출력
const fileArray = new Array();
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('c-img').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('c-img').src = "";
	}

	// array 에 담기
	for (let i = 0; i < input.files.length; i++) {
		if (input.files[i].size > 5242880) { // 5 mb 까지만 가능
			alert("첨부파일은 5mb 이하만 가능합니다.");
			input.value = "";
			return;
		}

		const reader = new FileReader();

		reader.readAsDataURL(input.files[i]);
		reader.onload = () => {
			fileValue = input.files[i];
			fileArray.push(fileValue);
		}
	}
}




// 클릭한 이미지의 테두리 변경
$('.emoji--detail--img-box').on('click', function() {
	// 이미지에 테두리가 있는지 확인
	var hasBorder = $(this).css('border') === '2px solid red';

	// 모든 이미지에서 선택된 이미지 테두리 스타일 초기화
	$(this).css('border', 'none');

	// 클릭된 이미지에 테두리 스타일 적용 또는 제거
	if (!hasBorder) {
		$(this).css('border', '2px solid red');
	} else {
		$(this).css('border', 'none');
	}
});




function innerFun(list) {
	let innr = "";
	if (list != "") {
		for (let i = 0; i < list.length; i++) {
			innr += `
				<div class="emoji--detail--item-box">
                    <div class="emoji--detail--img-box">
                        <img src="/images/upload/emoji/${list[i].file}" alt="이모티콘">
                    </div>
                </div>
			`;
		}
		innerBody.innerHTML = innr;
	}
}

orderBtn.onclick = () => {
	modalMain.style.display = "flex";
}

modalCloseBtn.onclick = () => {
	modalMain.style.display = "none";
}

function emojiModify() {

	const changePrice = document.querySelector("#changePrice").value;
	const changeTitle = document.querySelector("#changeName").value;  // 변경할 이미지 인풋 태그

	// 변경할 파일명

	// FormData 객체 생성
	const formData = new FormData();

	// FormData에 필드 추가
	for (var i = 0; i < fileArray.length; i++) {
		formData.append('files', fileArray[i]);
	}
	formData.append('price', changePrice);
	formData.append('title', changeTitle);

	$.ajax({
		type: 'PUT',
		url: '/admin/emoji/modify/' + pageId,
		processData: false,
		contentType: false,
		data: formData,
		encType: "multipart/form-data",
		success: function(data) {
			window.location.reload();
		},
		error: function(xhr) {
			alert("서버 에러가 발생하였습니다.");
		}
	});
}

deleteButton.onclick = () => {

	if (!confirm('삭제하시면 복구할 수 없습니다. \n 정말로 삭제하시겠습니까??')) { return false; }
	
	$.ajax({
		type: 'delete',
		url: '/admin/emoji/delete/' + pageId,
		success: function(data) {
			location.href = "/admin/emoji";
		},
		error: function(xhr) {
			if(xhr.status == 400) 
				alert("이미 이용자가 사용하고 있습니다.")
			if(xhr.status == 500) 
				alert("서버 에러가 발생하였습니다.");
		}
	});
}
