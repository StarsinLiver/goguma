<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />

<style>
.user-page .product-container {
	width: 800px;
	height: auto;
	padding: 40px;
	border-radius: 5px;
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
	
	<div class="product-container">
		<h4 class="user-page-title">중고 거래 내역</h4>
		
		<div class="col-sm-12">
			<!-- 구매내역 -->
			<div class="card mb-3">
				<div class="card-header text-white">
					<!-- 카드 헤더 -->
					<h5 class="card-title">구매 내역</h5>
				</div>
				<div class="card-body">
					<table class="table text-center">
						<thead>
							<tr>
								<th>순번</th>
								<th>거래일자</th>
								<th>상품명</th>
								<th>금액</th>
								<th>판매자</th>
							</tr>
						</thead>
						<tbody>
							<!-- 데이터가 없을 때 표시될 행 -->
							<tr id="noDataMessage" style="display: none;">
								<td colspan="5">내역이 없습니다.</td>
							</tr>
							<!-- 실제 데이터 행 -->
							<c:forEach var="product" items="${pHistories}">
							<tr id="dataRow">
								<td id="id">${product.id}</td>
								<td id="purchaseDate">${product.createAt}</td>
								<td id="pointName"><a href="/product/productDetail?pId=${product.prodId}">
									${product.prodName}</a></td>
								<td id="pointName">${product.formatBalance()}</td>
								<td id="refundYn">${product.userName}</td>
							</tr>
							</c:forEach>
						</tbody>

					</table>
					
					
					<div class="pagination">
						<!-- 페이지 처리 -->
						<c:if test="${start > 1}">
						<a href="/user/product?pg=${start - 1}">&laquo;</a>
					  	</c:if>
					  	<!-- 페이지 번호 -->
					  	<c:forEach var="i" begin="${start}" end="${end}">
							<a href="/user/product?pg=${i}" class="${pg == i ? 'active':''}">${i}</a>
						</c:forEach>
					  	<c:if test="${end < last}">
						<a href="/user/product?pg=${end + 1}">&raquo;</a>
						</c:if>
					</div>
				</div>
			</div>
			
			
		</div>
		
	</div>
</div>
<!-- 메인 종료 -->

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>