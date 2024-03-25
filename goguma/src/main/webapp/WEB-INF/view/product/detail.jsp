<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/product/userProduct.css">

<!-- 메인 섹션 -->
<article id="content">
	<h1 class="hide">제목</h1>
	<section id="article-images">
		<h3 class="hide">이미지</h3>
		<div id="image-slider">
			<div class="slider-wrap">
				<div class="slider">
					<c:forTokens items="${product.file}" delims="," var="file">
						<a href="">
							<div>
								<div class="image-wrap">
									<img data-lazy="" class="landscape" alt=""
										src="/images/upload/${file}" />
								</div>
							</div>
						</a>
					</c:forTokens>
				</div>
			</div>
		</div>
	</section>
	<section id="article-profile">
		<a id="article-profile-link"
			href="/product/userProduct?uId=${product.hostId}">
			<h3 class="hide">프로필</h3>
			<div class="space-between">
				<div style="display: flex">
					<div id="article-profile-image">
						<img alt="이름" src="/profile/${user.file}" />
					</div>
					<div id="article-profile-left">
						<div id="nickname">${user.name}</div>
						<div id="region-name">${user.address}</div>
					</div>
				</div>
				<div id="article-profile-right">
					<dl id="temperature-wrap">
						<dt>매너온도</dt>
						<dd class="text-color-0${color}">
							${temperature} <span>°C</span>
						</dd>
					</dl>
					<div class="meters">
						<div class="bar bar-color-0${color}"
							style="width: ${temperature}%"></div>
					</div>
					<div class="face face-0${color}"></div>
				</div>
			</div>
		</a>
	</section>
	<section id="article-description">
		<div property="schema:name" id="article-title" style="margin-top: 0px">
		<h1>
			${product.name}
			</h1>
			<div class="d-flex justify-content-start align-items-center"
				style="float: right; margin-top: -80px;">

				<!-- 채팅 버튼 -->
				<div style="">
					<c:if test="${product.confirmYn == 'Y'}">
						<button type="button" class="btn chat-btn" data-bs-toggle="modal"
							data-bs-target="#exampleModal" style="margin-right: 10px;">
							<h5>
								<b>상품 판매가 완료되었습니다</b>
							</h5>
						</button>
					</c:if>
					<c:if test="${product.confirmYn == 'N'}">
						<c:choose>
							<c:when test="${product.hostId == principal.getUId()}">
								<a class="btn chat-btn" href="/chat/room"
									style="margin-right: 10px;">채팅방이동 💬</a>
							</c:when>
							<c:when test="${isExistChatRoom == 0}">
								<button type="button" class="btn chat-btn"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									style="margin-right: 10px;">채팅하기 💬</button>
							</c:when>
							<c:otherwise>
								<a class="btn chat-btn" href="/chat/room"
									style="margin-right: 10px;">채팅방이동 💬</a>
							</c:otherwise>
						</c:choose>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">방 제목 입력</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<!-- 방 제목 입력 폼 -->
										<form method="post" action="/product/saveRoom">
											<input type="text" class="form-control"
												placeholder="방 제목을 입력하세요" name="name" style="height: 50px;"
												required> <input type="hidden"
												value="${product.getThisPid()}" name="pId"> <input
												type="hidden" value="${product.hostId}" name="hostId">
											<div class="d-grid gap-2 d-md-flex justify-content-md-end"
												style="margin-top: 8px;">
												<button type="submit" class="btn btn-primary">확인</button>
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">취소</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
				</div>
				<!-- 신고 버튼 -->
				<c:if test="${product.hostId != principal.getUId()}">
					<button type="button" class="btn report" data-bs-toggle="modal"
						data-bs-target="#reportModal">🚨 신고하기</button>
				</c:if>
				<div class="modal fade" id="reportModal" tabindex="-1"
					aria-labelledby="reportModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header bg-danger text-white">
								<h5 class="modal-title" id="reportModalLabel"
									style="font-weight: bold; font-size: 1.25rem;">신고하기</h5>
								<button type="button" class="btn-close btn-close-white"
									data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form id="reportForm" action="addReport" method="post">
									<input type="hidden" name="pId" value="${product.getThisPid()}">
									<input type="hidden" name="hostId" value="${product.hostId}">
									<div class="dropdown">
										<button class="btn btn-secondary dropdown-toggle"
											type="button" id="dropdownMenuButton"
											data-bs-toggle="dropdown" aria-expanded="false"
											style="width: 200px; height: 25px; margin-bottom: 10px; background-color: tomato;">
											신고 이유 선택</button>
										<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
											<li><a class="dropdown-item" href="#"
												data-value="사기/광고성 상품">사기/광고성 상품</a></li>
											<li><a class="dropdown-item" href="#"
												data-value="적절하지않은 상품">적절하지않은 상품</a></li>
											<li><a class="dropdown-item" href="#"
												data-value="욕설/비속어">욕설/비속어</a></li>
											<li><a class="dropdown-item" href="#" data-value="기타">기타</a></li>
										</ul>
									</div>
									<div id="selectedReason"
										style="font-weight: bold; color: red; margin-bottom: 10px; font-size: large;"></div>
									<textarea class="form-control" id="additionalReason"
										name="additionalReason" rows="3" style="resize: vertical;"
										placeholder="신고 이유를 작성해주세요"></textarea>
									<input type="hidden" id="reasonInput" name="reason">
									<div class="d-grid gap-2 d-md-flex justify-content-md-end"
										style="margin-top: 8px;">
										<button type="submit" class="btn btn-danger">신고</button>
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">취소</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<!-- 찜 버튼 -->
				<c:choose>
					<c:when test="${product.hostId == principal.getUId()}">
					</c:when>
					<c:when test="${prodWishlist}">
						<!-- 찜한 경우 -->
						<form method="post" action="/product/deleteWishList"
							style="margin-top: 5px;">
							<input type="hidden" name="pId" value="${product.getThisPid()}">
							<p style="text-align: right">
								<button type="submit" class="btn btn-link heart-icon"
									style="color: red;">
									<i class="fa fa-heart"></i>
								</button>
							</p>
						</form>
					</c:when>
					<c:otherwise>
						<!-- 찜하지 않은 경우 -->
						<form method="post" action="/product/addWishList"
							style="margin-top: 5px;">
							<input type="hidden" name="pId" value="${product.getThisPid()}">
							<p style="text-align: right">
								<button type="submit" class="btn btn-link heart-icon"
									style="color: gray;">
									<i class="fa fa-heart-o"></i>
								</button>
							</p>
						</form>
					</c:otherwise>
				</c:choose>
				</c:if>
			</div>
		</div>

		<p id="article-category">
			타이틀 ∙
			<time id="createAt">${product.createAt}</time>
		</p>
		<p id="article-price" property="schema:price" content="1000.0"
			style="font-size: 18px; font-weight: bold">가격 ${product.formatNumber(product.price)} 원
		</p>
		<div property="schema:description" id="article-detail">
			<p>${product.description}</p>
		</div>
		<p id="article-counts">
			관심 ${product.countWishList} ∙ <span>채팅
				${product.countChatRoom} </span>
		</p>
	</section>
</article>

<section id="article-detail-hot-more">
	<h3>인기중고</h3>
	<div id="hot-more-link">
		<a href="/product/product-list">더 구경하기</a>
	</div>
	<!-- 찜 개수가 가장 많은 상품 6개 -->
	<section class="cards-wrap">
		<c:forEach var="list" items="${productList}" varStatus="loop">
			<c:if test="${loop.index < 6}">
				<article class="card">
					<a class="card-link ga-click"
						href="productDetail?pId=${list.getThisPid()}">
						<div class="card-photo">
							<c:forTokens items="${list.file}" delims="," var="file"
								varStatus="loop">
								<c:if test="${loop.first}">
									<img alt="" src="/images/upload/${file}" />
								</c:if>
							</c:forTokens>
						</div>
						<div class="card-desc">
							<h2 class="card-title">${list.name}</h2>
							<div class="card-price">${list.formatNumber(list.price)}원</div>
							<div class="card-region-name">${list.address}</div>
							<div class="card-counts">
								<span>관심 ${list.countWishList} </span> ∙ <span>채팅
									${list.countChatRoom} </span>
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
