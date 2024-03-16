const tbody = document.querySelector(".refund-tbody");


let userInfo = getSession();
IMP.init('imp37413392');

load();
function load(){
	if(userInfo == ""){
		//alert("로그인이 필요한 서비스 입니다.");
		//location.href = "/login";
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