const headMenus = document.querySelectorAll(".emoji--head-menu");
const headMenusBorder = document.querySelectorAll(".emoji--head-menu-title");
const innerBody = document.querySelector(".emoji--content-box");

const mainImg = document.querySelectorAll(".e-img");
const mainTitle1 = document.querySelector(".e-title");
const mainTitle2 = document.querySelector(".e-title2");
const mainPrice = document.querySelectorAll(".e-price");
const orderBtn = document.querySelector(".emoji--order-btn");
const orderBtn2 = document.querySelector(".emoji--order-btn2");
const modalMain = document.querySelector(".emoji--modal");
const agreeCheck = document.querySelector(".emoji--agree-check");
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
	mainPrice[0].textContent = data.price;
	mainPrice[1].textContent = data.price;
}

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

agreeCheck.onchange = () => {
	if(agreeCheck.checked == true){
		orderBtn2.className = "emoji--order-btn2-on";
	}else {
		orderBtn2.className = "emoji--order-btn2";
	}
}

modalCloseBtn.onclick = () => {
	modalMain.style.display = "none";
}

orderBtn2.onclick = () => {
	if(orderBtn2.className == "emoji--order-btn2-on" && agreeCheck.checked == true){
		let merchantId = 'merchant_'+new Date().getTime();
		requestPay(merchantId);
		modalMain.style.display = "none";
	}
}

function requestPay(merchantId) {
	if(userInfo == ""){
		alert("로그인이 필요한 서비스 입니다.");
		location.href = "/login";
	}else{
		IMP.request_pay({
	      pg: "goguma",
	      pay_method: "card",
	      merchant_uid: merchantId,   // 주문번호
	      name: mainTitle1.textContent,//상품이름
	      amount: Number(mainPrice[0].textContent),//상품가격
	      buyer_email: "bugger0330@naver.com",
	      buyer_name: "강민",
	      buyer_tel: "010-9046-7290",
	      buyer_addr: "서울특별시 강남구 신사동",
	      buyer_postcode: "01181"
	    }, function (rsp) { // callback
	      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
	      if (rsp.success) {
			  buyFun(merchantId);
		  }else{
			  alert("취소되었습니다.");
			  location.href = "/emoji/detail/" + pageId;
		  }
	    });
	}
}

function buyFun(merchantId){
	$.ajax({
		type : "post",
		url : "/emoji/api/order",
		data : {
			merchantId : merchantId,
			mainEmojiId : mainEmojiNum,
			price : Number(mainPrice[0].textContent),
			uId : userInfo.uId,
			bank : "KAKAO"
		},
		success : function(data){
			if(data == true){
				alert("결제가 완료되었습니다.");
				location.href = "/";
			}
		},
		error : function(){
			alert("에러");
		}
	});
}

agreeMain,agreeSub
for(let i = 0; i < agreeMain.length; i++){
	agreeMain[i].onclick = () => {
		agreeSub[i].style.display = "flex";
	}
}









