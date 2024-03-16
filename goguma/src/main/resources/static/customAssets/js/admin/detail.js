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

IMP.init('imp37413392');
let mainEmojiNum = 0;
let userInfo = getSession();

load();

function load(){
	alert("pageId"+ pageId);
	$.ajax({
		type : "get",
		url : "/emoji/api/detail/main/" + pageId,
		async : false,
		success : function(data){
			if(data != ""){
				innerMain(data);
				mainEmojiNum = data.id;
			}else{
				alert("로드 디테일 실패");
			}
		},
		error : function(){
			alert("로드 디테일 에러");
		}
	});
	$.ajax({
		type : "get",
		url : "/emoji/api/detail/sub/" + pageId,
		async : false,
		success : function(data){
			if(data != ""){
				innerFun(data);
			}else{
				alert("로드 디테일 서브 실패");
			}
		},
		error : function(){
			alert("로드 디테일 서브 에러");
		}
	});
}

for(let i = 0; i < headMenus.length; i++){
	headMenus[i].onclick = () => {
		location.href = "/emoji/list";
	}
}

function innerMain(data){
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
    }else{
		$(this).css('border', 'none');
	}
});




function innerFun(list){
	let innr = "";
	if(list != ""){
		for(let i = 0; i < list.length; i++){
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




function emojiModify(){
	
	const changeFile = document.querySelector("#changeFile");  // 변경할 이미지 인풋 태그
	const changePrice = document.querySelector("#changePrice");
	const changeTitle = document.querySelector("#changeName").value;  // 변경할 이미지 인풋 태그
	
	alert("1: " + changeFile);
	
	
	alert("2: " + changeTitle);
	// 변경할 파일명
	const fileName = changeFile.files[0];
	
	alert("변경 파일명  " + fileName);
	
	alert("pageId"+ pageId);
	
	    // FormData 객체 생성
    const formData = new FormData();
    
    // FormData에 필드 추가
    formData.append('file', fileName);
    formData.append('price', changePrice);
    formData.append('title', changeTitle);
    
	
	
	
	$.ajax({
		type : 'PUT',
		url : '/admin/emoji/modify/' + pageId,
		data: formData,
		async : false,
		success : function(data){
			alert('얼럿 데이터!!!! 석세스탐: '+data);
			if(data != ""){
				
				'redirect:/admin/emoji/detail/' + pageId ;
			}else{
				alert("이모지 변경 실패 대~실패");
			}
		},
		error : function(){
			alert("이모지 변경 에러");
		}
	});
	
}




