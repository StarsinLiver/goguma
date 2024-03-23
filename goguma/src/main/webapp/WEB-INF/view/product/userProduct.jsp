<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/product/userProduct.css">
<section id="content">
	<section id="user-profile">
		<h2 id="nickname">
			${user.name} 
		</h2>
		<ul id="profile-detail">
			<li class="profile-detail-title">${user.description}
			</li> <br>
			<li class="profile-detail-title">${user.email}
			</li>
		</ul>
		<div id="profile-image">
			<img alt="소확행"
				src="/profile/${user.file}" />
		</div>				
	</section>
	<div id="user-records-detail">
		<section id="user-filter">
			<ul>
				<li><a class="active" href="#">판매 물품</a></li>
			</ul>
		</section>
		<section id="user-records" class="user-articles" data-total-page="2"
			data-current-page="1">
			<h3 class="hide">"유저" 님의 판매 물품 목록</h3>
			<section class="cards-wrap">
			<c:if test="${userProdList.isEmpty()}">
			<div  class="not-found-product">
			<img alt="" src="/customAssets/images/no_product.png">
			<h1>등록된 상품이 없습니다.</h1>
			</div>
			</c:if>
				<c:forEach var="product" items="${userProdList}">
					<article class="card ">
						<a class="card-link "
							href="/product/productDetail?pId=${product.getThisPid()}">
							<div class="card-photo">
								<c:forTokens items="${product.file}" delims="," var="file"
									varStatus="loop">
									<c:if test="${loop.first}">
										<img src="/images/upload/${file}" />
									</c:if>
								</c:forTokens>
							</div>
							<div class="card-desc">
								<h2 class="card-title">${product.name}</h2>
								<div class="card-price ">${product.formatNumber(product.price)}원</div>
								<div class="card-region-name">${product.address}</div>
								<div class="card-counts">
									<span>관심 ${product.countWishList} </span> ∙ <span>채팅 ${product.countChatRoom} </span>
								</div>
							</div>
						</a>
					</article>
				</c:forEach>
			</section>
		</section>
		<div id="view-more">
			<a data-remote="true" href="#">더 보기</a>
		</div>
	</div>
</section>

<script>
	$(document).ready(function() {
		$('.card:gt(5)').hide();

		$('#view-more a').click(function(event) {
			event.preventDefault();

			$('.card:hidden:lt(6)').show();

			if ($('.card:hidden').length === 0) {
				$('#view-more').hide(); // 모든 항목이 표시되었으면 더 보기 버튼 숨기기
			}
		});
	});
</script>

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>