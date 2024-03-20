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
				<h3 class="display-5 text-white animated slideInDown">이모티콘 변경</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->
    <div class="emoji--main-div">
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
                    <div class="bottom-box" >
                    	<button type="button" class="emoji--delete-btn">삭제하기</button>
                    </div>
                </div>
            </div>
        <div class="emoji--sec3"></div>
            <div class="emoji--body">
                <div class="emoji--content-box"></div>
            </div>
        </div>
    </div>
    
    <div class="emoji--modal" style="z-index : 999;">
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