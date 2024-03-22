<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />

<style>
.user-page .product-host-container {
	width: 1200px;
	height: auto;
	padding: 40px;
	border-radius: 5px;
}
/* The Modal (background) */
#my-modal {
	max-width: 1200px;
	display: none;
	position: fixed;
	z-index: 1;
	top: 70px;
	padding-top: 100px;
	width: 100%;
	height: 100%;
}

.my-modal-content {
	margin: auto;
	max-width: 500px;
	position: relative;
	display: flex;
	flex-direction: column;
	width: 50%;
	pointer-events: auto;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-radius: 0.3rem;
	outline: 0;
}
/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	padding: 0 20px;
	box-sizing: border-box;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.my-modal-content table {
	width: 100%;
	margin-bottom: 10px;
}

.my-modal-content tr {
	border-bottom: 1px solid #ccc;
}

.my-modal-content textarea {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	max-height: 177px;
}

.user-page .emoji-name {
	margin-left: 20px;
	font-size: 20px;
	font-weight: 700;
}

.complete {
	color: green;
}
</style>

<!-- 메인 시작 -->
<!-- Header Start -->
<div class="all-page-title"
	style="background-image: url(/assets/images/pattern-4.png);">
	<div class="container text-center">
		<h1>마이페이지</h1>
	</div>
	<!--End Page-->
</div>
<!-- end section -->

<svg id="clouds" class="hidden-xs" xmlns="http://www.w3.org/2000/svg"
	version="1.1" width="100%" height="100" viewBox="0 0 85 100"
	preserveAspectRatio="none">
        <path
		d="M-5 100 Q 0 20 5 100 Z
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

	<div class="product-host-container">
		<h4 class="user-page-title">내 상품 목록</h4>

		<div class="cards-wrap">
			<c:forEach var="product" items="${productList}">
				<article class="card">
					<a class="card-link"
						href="/product/productDetail?pId=${product.prodId}">
						<div class="card-photo">
							<c:forTokens items="${product.file}" delims="," var="token"
								varStatus="loop">
								<c:if test="${loop.index == 0}">
									<img src="/images/upload/${token}">
								</c:if>
							</c:forTokens>
						</div>
						<div class="card-desc">
							<h2 class="card-title">${product.name}</h2>
							<div class="card-price">${product.price}</div>
						</div>
					</a>
					<!-- 모달 -->
					<c:if test="${product.confirmYn == 'N'}">
						<button class="btn btn-warning btn-confirm"
							onclick="openChatList(${product.prodId})"
							data-value="${product.prodId}">결제</button>
						<a class="btn btn-success btn-confirm" href="/product/write/update/${product.prodId}">수정</a>
						<form action="/product/delete/${product.prodId}"
							method="post">
							<input type="hidden" name="_method" value="delete" />
							<button class="btn btn-danger btn-confirm">삭제</button>
						</form>
					</c:if>
				</article>
			</c:forEach>
		</div>
		<div style="display: flex; justify-content: flex-end;">
			<a href="/product/write" class="btn btn-warning btn-complete">상품
				등록</a>
		</div>
		<div class="pagination">
			<!-- 페이지 처리 -->
			<c:if test="${start > 1}">
				<a href="/user/product/host?pg=${start - 1}">&laquo;</a>
			</c:if>
			<!-- 페이지 번호 -->
			<c:forEach var="i" begin="${start}" end="${end}">
				<a href="/user/product/host?pg=${i}"
					class="${pg == i ? 'active':''}">${i}</a>
			</c:forEach>
			<c:if test="${end < last}">
				<a href="/user/product/host?pg=${end + 1}">&raquo;</a>
			</c:if>
		</div>
	</div>

	<!-- Modal -->
	<div id="my-modal">
		<div class="my-modal-content">
			<span class="close" onclick="deleteClose()">&times;</span>
			<article style="padding: 20px;">
				<table id="user--list">
					<tr>
						<td>유저 이름</td>
						<td>확인</td>
					</tr>
				</table>

			</article>
		</div>
	</div>

</div>
<!-- 메인 종료 -->
<script src="/customAssets/js/user/product_host_history.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>