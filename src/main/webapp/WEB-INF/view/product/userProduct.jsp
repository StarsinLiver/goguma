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
				<li><a class="" href="#">메뉴2</a></li>
				<li><a class="" href="#">메뉴3</a></li>
				<li><a class="" href="#">메뉴4</a></li>
			</ul>
		</section>
		<section id="user-records" class="user-articles" data-total-page="2"
			data-current-page="1">
			<h3 class="hide">"유저" 님의 판매 물품 목록</h3>
			<section class="cards-wrap">
				<article class="card ">
					<a class="card-link " href="#">
						<div class="card-photo ">
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=" "
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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
							<img alt=""
								src="" />
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