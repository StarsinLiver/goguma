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
				<h3 class="display-5 text-white animated slideInDown">about</h3>
			</div>
		</div>
	</div>
</div>
    <div class="about-main-div">
        <div class="about-introduce-box">
            <div class="about-text-box">
                <span class="about-in1">Vision</span>
                <span class="about-in2">세상 모든 물건에 가치를,</span>
                <span class="about-in2">소비를 지속가능하게</span>
                <span class="about-in3">To make consumption sustainable by giving a second life to everything;</span>
                <span class="about-in4">waste nothing for planet & for your lifestyle</span>
            </div>
            <div class="about-text-box">
                <span class="about-in1">Mission</span>
                <span class="about-in2">기술로 만드는</span>
                <span class="about-in2">스트레스 프리 리커머스 경험</span>
                <span class="about-in3">Make re-commerce stress-free with technology</span>
            </div>
        </div>
        <div class="emoji--sec3"></div>
        <div class="about-map-box">
        	<div class="map-header">
				<h1>오시는길</h1>
				<p>부산광역시 부산진구 중앙대로 123</p>
        	</div>
        	<div class="map-box">
        		<div id="map" style="width: 700px; height: 400px;"></div>
        	</div>
        </div>
    </div>
<script src="/customAssets/js/about/about.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>