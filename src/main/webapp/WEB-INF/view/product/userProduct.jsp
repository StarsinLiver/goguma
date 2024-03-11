<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>

<!DOCTYPE html>
<section id="content">
	<section id="user-profile">
		<h2 id="nickname">
			${product.name} <span id="region_name">${product.address}</span>
		</h2>
		<ul id="profile-detail">
			<li class="profile-detail-title">유저 설명 <span
				class="profile-detail-count"></span>
			</li>
			<li class="profile-detail-title">유저 설명2 <span
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
				<li><a class="" href="#">거래 후기</a></li>
				<li><a class="" href="#">매너 칭찬</a></li>
			</ul>
		</section>
		<section id="user-records" class="user-articles" data-total-page="2"
			data-current-page="1">
			<h3 class="hide">"유저" 님의 판매 물품 목록</h3>
			<section class="cards-wrap">
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="공기청정기팝니다"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202401/114d6be7fdb4e64d234e5aff585a1eba0cf6c3ac8de19ed7885ab9b5b6846f07_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">공기청정기팝니다</h2>
							<div class="card-price ">140,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 0 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="골프가방.골프채9개 골프공 핀 일괄팔아요"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202401/366003e2f8cd4cc09fefb2525582cc24cd5b15071bff2b698b8bee6deebfffbb_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">골프가방.골프채9개 골프공 핀 일괄팔아요</h2>
							<div class="card-price ">200,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 1 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="키보드 마우스 패드 팝니다"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202401/0a25534255148df0a3ae6d45d15cb0bb1da5a941c05d844be02e396785b2f434_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">키보드 마우스 패드 팝니다</h2>
							<div class="card-price ">15,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 6 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="베토벤 외 오케스트라 협주곡"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202402/f906201784136a31a051590cdeda6549a3e64e4d4a65ae4cf2e5aab2ea6c1012_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">베토벤 외 오케스트라 협주곡</h2>
							<div class="card-price ">1원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 2 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="SD 라탄체어 판매합니다"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202402/f148593e38e92833e885f08a87970100ca5b8789f70b862a6c65733c2808d835_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">SD 라탄체어 판매합니다</h2>
							<div class="card-price ">20,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 11 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="락카 팝니다"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202403/a62745eb2e29b0ddf566f19e30e67a51267688462669fdb52e2fa6204b5a8909_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">락카 팝니다</h2>
							<div class="card-price ">80,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 0 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="빔 프로젝트"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202401/1032c93a1933c06c0881e2fd58ae22aba89908abf885aacb540024bde708c25c_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">빔 프로젝트</h2>
							<div class="card-price ">190,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 2 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="대형 세계지도 팝니다"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202403/5346407178c604948732d690c1fff4a522ea67b119ebff9db7829ea75bef97f7_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">대형 세계지도 팝니다</h2>
							<div class="card-price ">70,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 1 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="월중행사및 계획표 판매합니다"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202403/c1e6f3d5b61ef498402c8bfc06077b616dbbbbb4f6dd19309d63ab9ecae80693_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">월중행사및 계획표 판매합니다</h2>
							<div class="card-price ">50,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 4 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="수툴 판매합니다"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202402/f9502db8bb2eb5bdb4117e94efc8da7ea6e3fe9f9b31981bd14301c32b7b7baf_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">수툴 판매합니다</h2>
							<div class="card-price ">20,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 22 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="실드페이스 팝니다"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202402/b4e179a0c8357010ea2015b1f6b74155f1f8835da3343f2b444d85c80da8cbb2_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">실드페이스 팝니다</h2>
							<div class="card-price ">50,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 0 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="사무실 정리합니다"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202403/b89ca18f9c6571ba89ce2c797a057a48b7e6060004593f82839ad26713b8ac67_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">사무실 정리합니다</h2>
							<div class="card-price ">1,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 25 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="월중 행사 및 계획표 보드판 팝니다"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202403/b52d3494db5ba3a672f94378bdd46d64d48b1240f3990758c7f3d48065bbc465_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">월중 행사 및 계획표 보드판 팝니다</h2>
							<div class="card-price ">30,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 2 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="공유기 팔아욤"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202402/f2d6c1920902c90ceaf10e387f60d21c3116758581f70ccafa9100511c0bd1d7_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">공유기 팔아욤</h2>
							<div class="card-price ">15,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 0 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " data-event-label="720559128"
						href="/articles/720559128">
						<div class="card-photo ">
							<img alt="클래식 Q77"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202402/2cac74b74991a95e786253a11ab3834107fe933c0d9ca4581ce0646753bbbf53_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">클래식 Q77</h2>
							<div class="card-price ">50,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 4 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link" href="#">
						<div class="card-photo ">
							<img alt="아다지오차차차"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202402/1719df88ed37ad00cf362f6536c8c7fc05df211b18cf53a4cbe917c3daea89e6_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">아다지오차차차</h2>
							<div class="card-price ">40,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 1 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="3단 빨래건조대20000"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202402/5b0d79a7683dd8d74181ed27456b182f36c037b4ab0a68f074789ad644095ee5_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">3단 빨래건조대20000</h2>
							<div class="card-price ">20,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 1 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt="리더스쿡에그팬 팝니다"
								src="https://dnvefa72aowie.cloudfront.net/origin/article/202401/c3b654ca83e5cc4291e4ca4d6e56229e6538ccd4bda4acad78cb1c19d55c90d3_0.webp?q=82&amp;s=300x300&amp;t=crop&amp;f=webp" />
						</div>
						<div class="card-desc">
							<h2 class="card-title">리더스쿡에그팬 팝니다</h2>
							<div class="card-price ">10,000원</div>
							<div class="card-region-name">경기도 오산시 신장동</div>
							<div class="card-counts">
								<span>관심 16 </span> ∙ <span>채팅 0 </span>
							</div>
						</div>
					</a>
				</article>
			</section>
		</section>
		<div id="view-more">
			<a data-remote="true" href="#">더 보기</a>
		</div>
	</div>
</section>

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>