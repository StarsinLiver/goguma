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
<div style="display: flex; margin: 15% 5%;">
	<div>
		<!-- aside -->
		<%@ include file="/WEB-INF/view/admin/admin_aside.jsp"%>
		<!-- aside end -->
	</div>
	<div class="emoji--main-div">
		<div class="emoji--head-menu-box">
			<div class="emoji--head-menu" style="width: 120px;">
				<span class="emoji--head-menu-title">이모티콘</span>

			</div>

			<!--  <div class="emoji--head-menu">
				<span class="emoji--head-menu-title">인기</span>
			</div>
			<div class="emoji--head-menu">
				<span class="emoji--head-menu-title">신규</span>
			</div>-->

		</div>
		<div class="emoji-search-box">
			<input type="text" class="emoji-search-input">
			<button type="button" class="emoji-search-btn" onclick="onclickSearch()">검색</button>
		</div>
		<div class="emoji--body">
			<div class="emoji--content-box"></div>

			<div class="emoji--page-box">
				<div class="emoji--arrow-box" onclick="onclickArray('prev')">
					<span>◀</span>
				</div>
				<div class="emoji--num-box">
					<!-- <span class="emoji--num">1</span>  -->
				</div>
				<div class="emoji--arrow-box" onclick="onclickArray('next')">
					<span>▶</span>
				</div>
			</div>
		</div>
	</div>

</div>
<script src="/customAssets/js/admin/list.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>