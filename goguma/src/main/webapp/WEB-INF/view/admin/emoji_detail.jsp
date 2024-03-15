<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>

<!-- 메인 시작 -->
<!-- Header Start -->
<div class="container-fluid bg-warning py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">이모티콘</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->
    <div class="emoji--main-div">
        <div class="emoji--head-menu-box">
            <div class="emoji--head-menu">
                <span class="emoji--head-menu-title">홈</span>
            </div>
            <div class="emoji--head-menu">
                <span class="emoji--head-menu-title">인기</span>
            </div>
            <div class="emoji--head-menu">
                <span class="emoji--head-menu-title">신규</span>
            </div>
        </div>
        <div class="emoji--body">
            <div class="content-main">
                <div class="emoji--detail--main-img-box">
                    <img src="" alt="이모티콘" class="e-img">
                </div>
                <div class="main-title-box">
                    <div class="text-box">
                        <h1 class="e-title"></h1>
                        <div class="price-box">
                            <span class="e-price"></span>
                            <span>원</span>
                        </div>
                    </div>
                    <div class="botton-box">
                        <button type="button" class="emoji--modify-btn">수정하기</button>
                    </div>
                </div>
            </div>
        <div class="emoji--sec3"></div>
            <div class="emoji--body">
                <div class="emoji--content-box"></div>
            </div>
        </div>
        <div class="agree-box">
            <div class="agree-main-box">
                <span>상품안내</span>
                <span>▼</span>
            </div>
            <div class="agree-sub-box">
                <span class="agree-txt">※ 부가가치세 10%가 포함된 가격입니다.</span>
                <span class="agree-txt">※ 구매한 이모티콘은 고구마마켓 채팅 서비스에서 사용할 수 있습니다.</span>
                <span class="agree-txt">※ 대한민국 카카오톡 사용자가 아닌 경우에는 일부 기능 또는 구매가 제한될 수 있습니다.</span>
                <span class="agree-txt">※ 미성년자인 회원이 법정대리인의 동의없이 상품 등을 구매하는 경우 본인 또는 법정대리인이 이를 취소할 수 있습니다.</span>
            </div>
        </div>
        <div class="agree-box">
            <div class="agree-main-box">
                <span>상품안내</span>
                <span>▼</span>
            </div>
            <div class="agree-sub-box">
                <span class="agree-txt">※ 결제 후 계약내용에 관한 서면을 교부받은 날(이하 ‘구매일’)로부터 7일 이내에 청약철회할 수 있습니다. 단, 콘텐츠의 내용이 표시·광고 내용과 다르거나 계약 내용과 다르게 이행된 경우에는 당해 콘텐츠를 공급받은 날로부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내에 청약철회할 수 있습니다.</span>
                <span class="agree-txt">※ 아래 내용에 해당하는 경우에는 청약철회 또는 환불 신청이 제한될 수 있습니다.</span>
                <span class="agree-txt">※ 1) 구매일로부터 7일 이내에 용역 또는 「문화산업진흥 기본법」 제2조제5호의 디지털콘텐츠의 제공이 개시된 경우. 다만, 가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우에는 제공이 개시되지 아니한 부분에 대하여는 예외로 함.</span>
                <span class="agree-txt">※ 2) 구매일로부터 7일이 경과한 후 단순변심으로 인한 환불 신청의 경우</span>
                <span class="agree-txt">※ 청약 철회/환불 요청을 원하실 경우 [고구마마켓 고객센터] 에서 신청 할 수 있으며, 소비자의 청약철회일로부터 3 영업일 이내에 지급받은 대금의 환급을 정당한 사유 없이 지연하는 경우 소비자는 지연기간에 대해서 연 20%의 지연 배상금을 회사에게 청구할 수 있습니다.</span>
                <span class="agree-txt">※ 선물한 이모티콘의 경우 구매일로부터 7일이 경과하였거나, 선물을 받은 이용자가 다운로드 받은 경우 환불이 불가합니다.</span>
                <span class="agree-txt">※ 그 외 다른 사항에 대한 청약철회 및 환불은 콘텐츠산업진흥법의 기준에 따르며, 피해보상 및 불만 처리 등 필요한 사항은 [고구마마켓 고객센터]로 연락 주시기 바랍니다.</span>
            </div>
        </div>
    </div>
    
    <div class="emoji--modal">
        <div class="emoji--sec1">
            <span>이모티콘 변경하기</span>
            <span class="emoji--close-btn">Ⅹ</span>
        </div>
        <div class="emoji--sec2">
            <div class="emoji--sec2-title-box">
                <span class="e-title2"></span>
                <div class="emoji--sec2-price-box">
                    <span class="e-price"></span>
                    <span>원</span>
                </div>
            </div>
            <div class="emoji--sec2-img-box">
                <img src="" alt="이모티콘" class="e-img">
            </div>
            <br>
            <br>
        </div>
        <div class="emoji--sec3"></div>
        <div class="emoji--sec5">
        	<h4>변경할 파일 선택</h4>
        	<input type="file" id ="changeFile" onchange="readURL(this);" multiple>
        	<div class="emoji--sec2-img-box">
                <img src=""  id="c-img" style="width: 100%">
            </div>
            <span>변경할 이름</span>
            <input type="text" id="changeName" class="changeName">
            
            <span>변경할 가격</span>
            <input type="text" id="changePrice" class="changeName">
            
        </div>
        <div class="emoji--sec3"></div>
        <button type="button" class="emoji--modify-btn2" onclick="emojiModify()">수정하기</button>
        <div class="emoji--sec6">
        </div>
    </div>
    
<script src="/customAssets/js/admin/detail.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>