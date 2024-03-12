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
                <div class="main-img-box">
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
                        <button type="button" class="emoji--order-btn">구매하기</button>
                    </div>
                </div>
            </div>
            <div class="emoji--body">
                <div class="emoji--content-box"></div>
            </div>
        </div>
    </div>
    
    <div class="emoji--modal">
        <div class="emoji--sec1">
            <span>구매하기</span>
            <span class="emoji--close-btn">Ⅹ</span>
        </div>
        <div class="emoji--sec2">
            <div class="emoji--sec2-title-box">
                <span class="e-title"></span>
                <div class="emoji--sec2-price-box">
                    <span class="e-price"></span>
                    <span>원</span>
                </div>
            </div>
            <div class="emoji--sec2-img-box">
                <img src="" alt="이모티콘" class="e-img">
            </div>
        </div>
        <div class="emoji--sec3"></div>
        <div class="emoji--sec4">
            <input type="checkbox" class="emoji--agree-check">
            <span>아래 내용에 동의합니다.</span>
        </div>
        <div class="emoji--sec5">
            <span>· 쿠폰은 중복사용 불가하며, 일부 결제수단은 할인쿠폰 적용이 불가합니다.</span>
            <span>· 주문취소 및 환불 시 이미 사용한 쿠폰은 재발급되지 않습니다.</span>
        </div>
        <div class="emoji--sec3"></div>
        <button type="button" class="emoji--order-btn2">구매하기</button>
        <div class="emoji--sec6">
        </div>
    </div>
    
<script src="/customAssets/js/emoji/detail.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>