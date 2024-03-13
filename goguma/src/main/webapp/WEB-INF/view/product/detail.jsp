<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>

<style>
.chat-button {
	border: 1px solid red;
	float: inline-end;
	margin-right: 5px;
}
</style>
<!-- 메인 섹션 -->
<article id="content">
	<h1 class="hide">제목</h1>
	<section id="article-images">
		<h3 class="hide">이미지</h3>
		<div id="image-slider">
			<div class="slider-wrap">
				<div class="slider">
					<a href="">
						<div>
							<div class="image-wrap">
								<img data-lazy="" class="landscape" alt="" src="" />
							</div>
						</div>
					</a> <a href="">
						<div>
							<div class="image-wrap">
								<img data-lazy="" class="landscape" alt="" src="" />
							</div>
						</div>
					</a> <a href="">
						<div>
							<div class="image-wrap">
								<img data-lazy="" class="landscape" alt="" src="" />
							</div>
						</div>
					</a> <a href="">
						<div>
							<div class="image-wrap">
								<img data-lazy="" class="landscape" alt="" src="" />
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>
	<section id="article-profile">
		<a id="article-profile-link" href="/userProduct?uId=${product.hostId}">
			<h3 class="hide">프로필</h3>
			<div class="space-between">
				<div style="display: flex">
					<div id="article-profile-image">
						<img alt="이름" src="" />
					</div>
					<div id="article-profile-left">
						<div id="nickname">${product.name}</div>
						<div id="region-name">${product.address}</div>
					</div>
				</div>
				<div id="article-profile-right">
					<dl id="temperature-wrap">
						<dt>매너온도</dt>
						<dd class="text-color-03">
							100 <span>°C</span>
						</dd>
					</dl>
					<div class="meters">
						<div class="bar bar-color-03" style="width: 100%"></div>
					</div>
					<div class="face face-03"></div>
				</div>
			</div>
		</a>
	</section>
	<section id="article-description">
		<h1 property="schema:name" id="article-title" style="margin-top: 0px">
			${product.name}
			<div class="d-flex justify-content-start align-items-center" style="float:right; margin-top: -20px;">
				<!-- 버튼 -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#exampleModal" style="margin-right:10px;">채팅하기</button>

				<!-- 모달 창 -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">방 제목 입력</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- 방 제목 입력 폼 -->
								<form method="post" action="/saveRoom">
									<input type="text" class="form-control"
										placeholder="방 제목을 입력하세요" name="name" required> <input
										type="hidden" value="${product.getThisPid()}" name="pId">
									<input type="hidden" value="${product.hostId}" name="hostId">
									<div class="mt-3">
										<button type="submit" class="btn btn-primary">확인</button>
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">취소</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>


				<button type="button" class="btn btn-danger" data-bs-toggle="modal"
					data-bs-target="#reportModal" style="margin-right:10px;">신고하기</button>

				<div class="modal fade" id="reportModal" tabindex="-1"
					aria-labelledby="reportModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header bg-danger text-white">
								<h5 class="modal-title" id="reportModalLabel">신고하기</h5>
								<button type="button" class="btn-close btn-close-white"
									data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p>정말 신고하시겠습니까?</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									id="confirmReportButton">네</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">아니요</button>
							</div>
						</div>
					</div>
				</div>
								<!-- 찜하기 버튼 또는 찜 삭제 버튼 -->
				<c:choose>
					<c:when test="${prodWishlist}">
						<form method="post" action="/deleteWishList" style="margin-top: 5px;">
							<input type="hidden" name="pId" value="${product.getThisPid()}">
							<p style="text-align: right">
								<button class="btn btn-danger btn-circle" type="submit">
									<i class="fa fa-frown-o"></i> 찜해제
								</button>
							</p>
						</form>
					</c:when>
					<c:otherwise>
						<form method="post" action="/addWishList" style="margin-top: 5px;">
							<input type="hidden" name="pId" value="${product.getThisPid()}">
							<p style="text-align: right">
								<button class="btn btn-success btn-circle" type="submit">
									<i class="fa fa-smile-o"></i> 찜하기
								</button>
							</p>
						</form>
					</c:otherwise>
				</c:choose>
			</div>
		</h1>

		<p id="article-category">
			타이틀 ∙
			<time id="createAt">${product.createAt}</time>
		</p>
		<p id="article-price" property="schema:price" content="1000.0"
			style="font-size: 18px; font-weight: bold">가격 ${product.price} 원
		</p>
		<div property="schema:description" id="article-detail">
			<p>${product.description}</p>
		</div>
		<p id="article-counts">관심 0 ∙ 채팅 0</p>
	</section>
</article>

<section id="article-detail-hot-more">
	<h3>인기중고</h3>
	<div id="hot-more-link">
		<a href="/#">더 구경하기</a>
	</div>
	<!-- 찜 개수가 가장 많은 상품 6개 보여줄 예정 -->
	<section class="cards-wrap">
		<c:forEach var="list" items="${productList}" varStatus="loop">
			<c:if test="${loop.index < 6}">
				<article class="card">
					<a class="card-link ga-click"
						href="/productDetail?pId=${list.getThisPid()}">
						<div class="card-photo">
							<img alt="" src="" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">${list.name}</h2>
							<div class="card-price">${list.price}원</div>
							<div class="card-region-name">${list.address}</div>
							<div class="card-counts">
								<span>관심 0 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
			</c:if>
		</c:forEach>
	</section>
</section>
<!-- 메인 섹션 종료 -->


<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>


<script>
	// 페이지 로딩 후 실행되는 함수
	document.addEventListener("DOMContentLoaded", function() {
		const createAtElement = document.getElementById('createAt');
		const createAt = createAtElement.textContent.trim();
		const createdAt = new Date(createAt.replace(/-/g, '/')); // '-'를 '/'로 대체하여 형식 변환
		createAtElement.textContent = formatDate(createdAt);
	});

	function formatDate(createdAt) {
		const now = new Date();
		const diffInMs = now - createdAt;
		const diffInHours = Math.floor(diffInMs / (1000 * 60 * 60));
		console.log(diffInMs);
		console.log(diffInHours);
		console.log(now);
		console.log(createAt);
		if (diffInHours < 1) {
			return "방금 전";
		} else if (diffInHours < 24) {
			return diffInHours + "시간 전";
		} else if (diffInHours < 24 * 7) {
			const diffInDays = Math.floor(diffInHours / 24);
			return diffInDays + "일 전";
		} else {
			return createdAt.toLocaleDateString(); // 7일을 넘어가면 그냥 날짜를 반환
		}
	}
</script>

