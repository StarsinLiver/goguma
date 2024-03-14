<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<!DOCTYPE html>
<section id="content">
	<section id="user-profile">
		<h2 id="nickname">
			${user.name} <span id="region_name">${user.address}</span>
		</h2>
		<ul id="profile-detail">
			<li class="profile-detail-title">${user.description}<span
				class="profile-detail-count"></span>
			</li>
			<li class="profile-detail-title">${user.zip}<span
				class="profile-detail-count"></span>
			</li>
		</ul>
		<div id="profile-image">
			<img alt="소확행"
				src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-c649f052a34ebc4eee35048815d8e4f73061bf74552558bb70e07133f25524f9.png" />
		</div>
	</section>
	<div id="user-records-detail">
		<section id="user-filter">
			<ul>
				<li><a class="active" href="#">판매 물품</a></li>
				<li><a class="" href="#">메뉴2</a></li>
				<li><a class="" href="#">메뉴3</a></li>
				<li><a class="" href="#">메뉴4</a></li>
			</ul>
		</section>
		<section id="user-records" class="user-articles" data-total-page="2"
			data-current-page="1">
			<h3 class="hide">"유저" 님의 판매 물품 목록</h3>
			<section class="cards-wrap">
				<c:forEach var="product" items="${userProdList}">
					<article class="card ">
						<a class="card-link "
							href="/product/productDetail?pId=${product.getThisPid()}">
							<div class="card-photo ">
							<c:forTokens delims="," items="${product.file}" var="file">
								<img alt="" src="/images/upload/${file}">
							</c:forTokens>
							</div>
							<div class="card-desc">
								<h2 class="card-title">${product.name}</h2>
								<div class="card-price ">${product.price}원</div>
								<div class="card-region-name">${product.address}</div>
								<div class="card-counts">
									<span>관심 0 </span> ∙ <span>채팅 0 </span>
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