<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />

<style>
	.wish-container {
		width: 750px;
		height: auto;
	}
</style>

<!-- 메인 시작 -->
<!-- Header Start -->
<div class="all-page-title" style="background-image:url(/assets/images/pattern-4.png);">
        <div class="container text-center">
            <h1>마이페이지</h1>
        </div>
        <!--End Page-->
    </div><!-- end section -->

    <svg id="clouds" class="hidden-xs" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100" viewBox="0 0 85 100" preserveAspectRatio="none">
        <path d="M-5 100 Q 0 20 5 100 Z
            M0 100 Q 5 0 10 100
            M5 100 Q 10 30 15 100
            M10 100 Q 15 10 20 100
            M15 100 Q 20 30 25 100
            M20 100 Q 25 -10 30 100
            M25 100 Q 30 10 35 100
            M30 100 Q 35 30 40 100
            M35 100 Q 40 10 45 100
            M40 100 Q 45 50 50 100
            M45 100 Q 50 20 55 100
            M50 100 Q 55 40 60 100
            M55 100 Q 60 60 65 100
            M60 100 Q 65 50 70 100
            M65 100 Q 70 20 75 100
            M70 100 Q 75 45 80 100
            M75 100 Q 80 30 85 100
            M80 100 Q 85 20 90 100
            M85 100 Q 90 50 95 100
            M90 100 Q 95 25 100 100
            M95 100 Q 100 15 105 100 Z">
        </path>
    </svg>
<!-- Header End -->

<div class="user-page">
	<!-- aside -->
	<%@ include file="/WEB-INF/view/user/myPageAside.jsp"%>
	<!-- aside end -->
	
	<div class="wish-container">
		<h4 class="user-page-title">찜 목록</h4>
		
		<!-- 시작 -->
		<section class="cards-wrap">
				<c:forEach var="wish" items="${wishList}">
					<article class="card">
						<a class="card-link ga-click" href="/product/productDetail?pId=${wish.productId}">
							<div class="card-photo">
								<img alt="이미지" src="/images/upload/${wish.productFile}">
							</div>
							<div class="card-desc">
								<h2 class="card-title">${wish.name}</h2>
								<div class="card-price">${wish.price}</div>
							</div>
						</a>
						<form method="post" action="/product/deleteWishList" style="margin-top: 5px;">
								<input type="hidden" name="pId" value="${wish.productId}">
								<p style="text-align: right">
									<button class="btn btn-danger btn-circle" type="submit">
										<i class="fa fa-frown-o"></i> 찜해제
									</button>
								</p>
							</form>
					</article>
				</c:forEach>
		
	</section>
		
		<div class="pagination">
			<!-- 페이지 처리 -->
			<c:if test="${start > 1}">
			<a href="/user/myQna?pg=${start - 1}">&laquo;</a>
		  	</c:if>
		  	<!-- 페이지 번호 -->
		  	<c:forEach var="i" begin="${start}" end="${end}">
				<a href="/user/myQna?pg=${i}" class="${pg == i ? 'active':''}">${i}</a>
			</c:forEach>
		  	<c:if test="${end < last}">
			<a href="/user/myQna?pg=${end + 1}">&raquo;</a>
			</c:if>
		</div>
	</section>
	<!-- 메인 섹션 종료 -->
		
	</div>
</div>
<!-- 메인 종료 -->

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>