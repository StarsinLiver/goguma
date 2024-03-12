<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>

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
		<a id="article-profile-link" href="/#">
			<h3 class="hide">프로필</h3>
			<div class="space-between">
				<div style="display: flex">
					<div id="article-profile-image">
						<img alt="이름" src="" />
					</div>
					<div id="article-profile-left">
						<div id="nickname">이름</div>
						<div id="region-name">장소</div>
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
			제목</h1>
		<p id="article-category">
			타이틀 ∙
			<time>날짜 </time>
		</p>
		<p>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
		<p id="article-price" property="schema:price" content="1000.0"
			style="font-size: 18px; font-weight: bold">가격 10000 원
		</p>
		<div property="schema:description" id="article-detail">
			<p>상품 상세 디테일 설명입니다~!!!@@@@@@@@@@@@@@@@@@@@@</p>
		</div>
		<p id="article-counts">관심 0 ∙ 채팅 0 ∙ 조회 0</p>
	</section>
</article>

<section id="article-detail-hot-more">
	<h3>인기중고</h3>
	<div id="hot-more-link">
		<a href="/#">더 구경하기</a>
	</div>
	<section class="cards-wrap">
		<article class="card">
			<a class="card-link ga-click" href="/#">
				<div class="card-photo">
					<img alt="" src="" />
				</div>
				<div class="card-desc">
					<h2 class="card-title">제목</h2>
					<div class="card-price">6,000원</div>
					<div class="card-region-name">부산</div>
					<div class="card-counts">
						<span>관심 0 </span> ∙ <span>채팅 0 </span>
					</div>
				</div>
			</a>
		</article>
		<article class="card">
			<a class="card-link ga-click" href="/#">
				<div class="card-photo">
					<img alt="" src="" />
				</div>
				<div class="card-desc">
					<h2 class="card-title">제목</h2>
					<div class="card-price">6,000원</div>
					<div class="card-region-name">부산</div>
					<div class="card-counts">
						<span>관심 0 </span> ∙ <span>채팅 0 </span>
					</div>
				</div>
			</a>
		</article>
		<article class="card">
			<a class="card-link ga-click" href="/#">
				<div class="card-photo">
					<img alt="" src="" />
				</div>
				<div class="card-desc">
					<h2 class="card-title">제목</h2>
					<div class="card-price">6,000원</div>
					<div class="card-region-name">부산</div>
					<div class="card-counts">
						<span>관심 0 </span> ∙ <span>채팅 0 </span>
					</div>
				</div>
			</a>
		</article>
		<article class="card">
			<a class="card-link ga-click" href="/#">
				<div class="card-photo">
					<img alt="" src="" />
				</div>
				<div class="card-desc">
					<h2 class="card-title">제목</h2>
					<div class="card-price">6,000원</div>
					<div class="card-region-name">부산</div>
					<div class="card-counts">
						<span>관심 0 </span> ∙ <span>채팅 0 </span>
					</div>
				</div>
			</a>
		</article>
		<article class="card">
			<a class="card-link ga-click" href="/#">
				<div class="card-photo">
					<img alt="" src="" />
				</div>
				<div class="card-desc">
					<h2 class="card-title">제목</h2>
					<div class="card-price">6,000원</div>
					<div class="card-region-name">부산</div>
					<div class="card-counts">
						<span>관심 0 </span> ∙ <span>채팅 0 </span>
					</div>
				</div>
			</a>
		</article>
		<article class="card">
			<a class="card-link ga-click" href="/#">
				<div class="card-photo">
					<img alt="" src="" />
				</div>
				<div class="card-desc">
					<h2 class="card-title">제목</h2>
					<div class="card-price">6,000원</div>
					<div class="card-region-name">부산</div>
					<div class="card-counts">
						<span>관심 0 </span> ∙ <span>채팅 0 </span>
					</div>
				</div>
			</a>
		</article>
	</section>
</section>
<!-- 메인 섹션 종료 -->

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>