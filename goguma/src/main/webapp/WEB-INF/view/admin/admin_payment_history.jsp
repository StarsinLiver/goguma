<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />

<style>
.user-page .payment-container {
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

<div class="user-page" style="width: 80%; height: 80%">
	<!-- aside -->
	<%@ include file="/WEB-INF/view/admin/admin_aside.jsp"%>
	<!-- aside end -->
	
	<div class="payment-container" style="margin-right: 20%;">
		<h4 class="user-page-title">결제 내역</h4>
		
		<div class="col-sm-12">
			<div class="card mb-3">
				<div class="card-header text-white">
					<!-- 카드 헤더 -->
					<h5 class="card-title">이모티콘 구매</h5>
				</div>
				<div class="card-body">
					<table class="table text-center">
						<thead>
							<tr>
								<th>순번</th>
								<th>구매일자</th>
								<th>구매상품명</th>
								<th>환불요청<br/>여부
								</th>
								<th>승인 여부</th>
							</tr>
						</thead>
						<tbody>
							<!-- 데이터가 없을 때 표시될 행 -->
							<tr id="noDataMessage" style="display: none;">
								<td colspan="5">내역이 없습니다.</td>
							</tr>
							<!-- 실제 데이터 행 -->
							<tr id="dataRow">
								<td id="id">1</td>
								<td id="purchaseDate">2024.03.01</td>
								<td id="pointName">new 고구미 이모티콘</td>
								<td id="refundYn">없음</td>
								<td><button id="refundButton" class="btn btn-warning btn-complete">환불요청</button></td>
							</tr>
							<!-- 실제 데이터 행 -->
							<tr id="dataRow">
								<td id="id">1</td>
								<td id="purchaseDate">2024.03.01</td>
								<td id="pointName">new 고구미 이모티콘</td>
								<td id="refundYn">없음</td>
								<td><button id="refundButton" class="btn btn-warning btn-complete">환불요청</button></td>
							</tr>
							<!-- 실제 데이터 행 -->
							<tr id="dataRow">
								<td id="id">1</td>
								<td id="purchaseDate">2024.03.01</td>
								<td id="pointName">new 고구미 이모티콘</td>
								<td id="refundYn">없음</td>
								<td><button id="refundButton" class="btn btn-warning btn-complete">환불요청</button></td>
							</tr>
						</tbody>

					</table>
					
					<div class="pagination">
					  <a href="#">&laquo;</a>
					  <a href="#">1</a>
					  <a class="active" href="#">2</a>
					  <a href="#">3</a>
					  <a href="#">4</a>
					  <a href="#">5</a>
					  <a href="#">&raquo;</a>
					</div>
				</div>

			</div>
		</div>
		
	</div>
</div>
<!-- 메인 종료 -->

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>