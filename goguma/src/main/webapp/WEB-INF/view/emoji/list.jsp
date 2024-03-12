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
            <div class="emoji--content-box"></div>
            <div class="emoji--page-box">
                <div class="emoji--arrow-box">
                    <span>◀</span>
                </div>
                <div class="emoji--num-box">
                    <span class="emoji--num">1</span>
                </div>
                <div class="emoji--arrow-box">
                    <span>▶</span>
                </div>
            </div>
        </div>
    </div>
<script src="/customAssets/js/emoji/list.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>