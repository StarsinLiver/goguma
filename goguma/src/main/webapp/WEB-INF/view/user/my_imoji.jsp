<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />

<style>
	.user-page .my-imoji-container {
		width: 730px;
		height: auto;
	}

	.popular-contents-container {
	    overflow-x: scroll;
	    overflow-y: hidden;
	    overflow: -moz-scrollbars-none;
	    -ms-overflow-style: none;
	    scrollbar-width: none;
	}
	
	
	@media screen and (min-width: 720px)
	.popular-contents-inner-container {
	    max-height: 570px;
	    padding: 0;
	    width: 100%;
	}
	.popular-contents-inner-container {
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex;
	    -ms-flex-wrap: wrap;
	    flex-wrap: wrap;
	    padding: 0 16px;
	    width: 828px;
	}
	
	
	@media screen and (min-width: 720px)
	.popular-contents-inner-container {
	    max-height: 570px;
	    padding: 0;
	    width: 100%;
	}
	.popular-contents-inner-container {
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex;
	    -ms-flex-wrap: wrap;
	    flex-wrap: wrap;
	    padding: 0 16px;
	    width: 828px;
	}
	
	
	@media screen and (min-width: 720px)
	.popular-contents-inner-container .card_wrap {
	    margin: 0 25px 40px 0;
	    max-width: 192px;
	    width: 192px;
	}
	.popular-contents-inner-container .card_wrap {
	    margin: 0 8px 24px 0;
	    max-width: 126px;
	    width: 126px;
	}
	
	.card_wrap {
	    margin: 8px 0;
	}
	
	
	.card_wrap .card, .card_wrap .card .box {
	    -webkit-box-sizing: border-box;
	    box-sizing: border-box;
	    min-width: 104px;
	    width: 100%;
	}
	.card_wrap .card {
	    display: inline-block;
	}
	.card_wrap .card {
	    text-align: left;
	}
	.card_wrap>div {
	    -webkit-box-sizing: border-box;
	    box-sizing: border-box;
	}
	
	@media (min-width: 1023px)
	.card {
	    max-width: 192px;
	}
	
	
	.card_wrap .card .box {
	    height: auto;
	    min-height: 104px;
	    position: relative;
	}
	.card_wrap .card, .card_wrap .card .box {
	    -webkit-box-sizing: border-box;
	    box-sizing: border-box;
	    min-width: 104px;
	    width: 100%;
	}
	@media (min-width: 1023px)
	.card_wrap .card .box {
	    height: 192px;
	    width: 192px;
	}
	.card_wrap .card .box {
	    background: #f9fbfb;
	    border: 1px solid #f0f5f6;
	    border-radius: 16px;
	    height: 100%;
	    overflow: hidden;
	}
	
	.box, .list li {
	    height: 50px;
	    width: 100px;
	}
	
	
	@media screen and (min-width: 720px)
	.card_wrap .card .box .inner-padding {
	    padding: 34px;
	}
	.card_wrap .card .box .inner-padding {
	    padding: 30px;
	}
	.card_wrap .card .box a {
	    display: block;
	}
	@media screen and (min-width: 720px)
	.card_wrap a {
	    color: #252929;
	    font-family: "Pretendard", "Noto Sans KR", sans-serif;
	    font-size: 16px;
	    font-weight: 600;
	    font-weight: 400;
	    line-height: 1.31;
	}
	
	
	@media screen and (min-width: 720px)
	.card_wrap .card .title {
	    margin-top: 12px;
	}
	.card_wrap .card .title {
	    line-height: 0;
	    margin-top: 10px;
	}
	@media (min-width: 1023px)
	.card_wrap .card .title {
	    margin-top: 12px;
	}
	
	.card_wrap .card .title {
	    margin-top: 12px;
	}
	@media screen and (min-width: 720px)
	.title {
	    margin-bottom: 6px;
	}
	.title {
	    position: relative;
	}
	
	
	@media screen and (min-width: 720px)
	.card_wrap .card .title .artwork-title {
	    color: #252929;
	    font-family: "Pretendard", "Noto Sans KR", sans-serif;
	    font-size: 16px;
	    font-weight: 600;
	    line-height: 1.31;
	    margin-bottom: 0;
	}
	.card_wrap .card .title .artwork-title {
	    color: #252929;
	    font-family: "Pretendard", "Noto Sans KR", sans-serif;
	    font-size: 12px;
	    font-weight: 600;
	    line-height: 1.33;
	    margin-bottom: 4px;
	    width: 100%;
	}
	.card_wrap .card .title p {
	    color: #252929;
	    display: inline-block;
	    font-size: 12px;
	    font-weight: 600;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    vertical-align: top;
	    white-space: nowrap;
	    width: 80%;
	    word-break: break-all;
	}
	.card_wrap .card .title p {
	    line-height: 1.1;
	    text-align: left;
	}
	
	
	@media screen and (min-width: 720px)
	.card_wrap a {
	    color: #252929;
	    font-family: "Pretendard", "Noto Sans KR", sans-serif;
	    font-size: 16px;
	    font-weight: 600;
	    font-weight: 400;
	    line-height: 1.31;
	}
	.card_wrap a {
	    color: #252929;
	    cursor: pointer;
	    font-family: "Pretendard", "Noto Sans KR", sans-serif;
	    font-size: 14px;
	    font-weight: 600;
	    font-weight: 400;
	    line-height: 1.29;
	}
	
	
	.artist {
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    width: 100%;
	}
	.artist, .artist a {
	    line-height: 1;
	}
	
	
	.artist a {
	    display: inline-block;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	.artist, .artist a {
	    line-height: 1;
	}
	@media screen and (min-width: 720px)
	.card_wrap a {
	    color: #252929;
	    font-family: "Pretendard", "Noto Sans KR", sans-serif;
	    font-size: 16px;
	    font-weight: 600;
	    font-weight: 400;
	    line-height: 1.31;
	}
	
	
	@media screen and (min-width: 720px)
	.artist .img_wrap {
	    height: 24px;
	    width: 24px;
	}
	.artist .img_wrap {
	    background: url(/_nuxt/img/img_user.2319ba2.png) 50% no-repeat;
	    background-size: 100% auto;
	    border-radius: 50px;
	    height: 16px;
	    margin-right: 4px;
	    vertical-align: middle;
	    width: 16px;
	}
	.img_wrap, .img_wrap img {
	    height: 100%;
	    width: 100%;
	}
	.img_wrap {
	    display: inline-block;
	    overflow: hidden;
	}
	
	
	.artist .img_wrap img {
	    background-color: #fff;
	    height: 100%;
	    -o-object-fit: cover;
	    object-fit: cover;
	    width: 100%;
	}
	.img_wrap, .img_wrap img {
	    height: 100%;
	    width: 100%;
	}
	
	
	@media screen and (min-width: 720px)
	.card_wrap .artist .name {
	    color: #4b5252;
	    font-family: "Pretendard", "Noto Sans KR", sans-serif;
	    font-size: 12px;
	    font-weight: 200;
	    line-height: 1.33;
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

	<div class="my-imoji-container">
		<h4 class="user-page-title">내 이모티콘</h4>

		<section class="popular-container">
			<div class="popular-contents-container">
				<div class="popular-contents-inner-container">
				
					<!-- 이모티콘 -->
					<div class="card_wrap">
						<div  class="card">
							<div  class="box">
								<a href="/artworks/sticker/detail?artworkId=5ced84566f6a9" 
								draggable="false" target="_self" class="inner-padding" style="user-select: none;">
									<span class="img_wrap">
										<img src="https://storep-phinf.pstatic.net/ogq-5ced84566f6a9/stk/6hzwxsfl.png?type=m480_480" 
										alt="" draggable="false" class="scale-up" style="user-select: none;">
									</span>
								</a> 
							</div> 
							<div class="title">
									<p  href="/artworks/sticker/detail?artworkId=5ced84566f6a9" class="artwork-title">
										<a  target="_self" value="춘배와 냐뇨냐뇨" class="coloring-text">춘배와 냐뇨냐뇨</a>
									</p>
								</div> 
							<div class="artist">
								<a href="/creators/올소" target="_self">
									<span class="img_wrap">
										<img src="https://preview.files.api.ogq.me/PROFILE_IMG/c24a0387/5cee97830a42c/OGQ_올소_2021-10-22.png?format=r120_120" 
										alt="올소">
									</span> 
									<span class="name">올소</span>
								</a>
							</div>
						</div>
					</div>
					<!-- 이모티콘 -->
					<div class="card_wrap">
						<div  class="card">
							<div  class="box">
								<a href="/artworks/sticker/detail?artworkId=5ced84566f6a9" 
								draggable="false" target="_self" class="inner-padding" style="user-select: none;">
									<span class="img_wrap">
										<img src="https://storep-phinf.pstatic.net/ogq-5ced84566f6a9/stk/6hzwxsfl.png?type=m480_480" 
										alt="" draggable="false" class="scale-up" style="user-select: none;">
									</span>
								</a> 
							</div> 
							<div class="title">
									<p  href="/artworks/sticker/detail?artworkId=5ced84566f6a9" class="artwork-title">
										<a  target="_self" value="춘배와 냐뇨냐뇨" class="coloring-text">춘배와 냐뇨냐뇨</a>
									</p>
								</div> 
							<div class="artist">
								<a href="/creators/올소" target="_self">
									<span class="img_wrap">
										<img src="https://preview.files.api.ogq.me/PROFILE_IMG/c24a0387/5cee97830a42c/OGQ_올소_2021-10-22.png?format=r120_120" 
										alt="올소">
									</span> 
									<span class="name">올소</span>
								</a>
							</div>
						</div>
					</div>
					<!-- 이모티콘 -->
					<div class="card_wrap">
						<div  class="card">
							<div  class="box">
								<a href="/artworks/sticker/detail?artworkId=5ced84566f6a9" 
								draggable="false" target="_self" class="inner-padding" style="user-select: none;">
									<span class="img_wrap">
										<img src="https://storep-phinf.pstatic.net/ogq-5ced84566f6a9/stk/6hzwxsfl.png?type=m480_480" 
										alt="" draggable="false" class="scale-up" style="user-select: none;">
									</span>
								</a> 
							</div> 
							<div class="title">
									<p  href="/artworks/sticker/detail?artworkId=5ced84566f6a9" class="artwork-title">
										<a  target="_self" value="춘배와 냐뇨냐뇨" class="coloring-text">춘배와 냐뇨냐뇨</a>
									</p>
								</div> 
							<div class="artist">
								<a href="/creators/올소" target="_self">
									<span class="img_wrap">
										<img src="https://preview.files.api.ogq.me/PROFILE_IMG/c24a0387/5cee97830a42c/OGQ_올소_2021-10-22.png?format=r120_120" 
										alt="올소">
									</span> 
									<span class="name">올소</span>
								</a>
							</div>
						</div>
					</div>
					<!-- 이모티콘 -->
					<div class="card_wrap">
						<div  class="card">
							<div  class="box">
								<a href="/artworks/sticker/detail?artworkId=5ced84566f6a9" 
								draggable="false" target="_self" class="inner-padding" style="user-select: none;">
									<span class="img_wrap">
										<img src="https://storep-phinf.pstatic.net/ogq-5ced84566f6a9/stk/6hzwxsfl.png?type=m480_480" 
										alt="" draggable="false" class="scale-up" style="user-select: none;">
									</span>
								</a> 
							</div> 
							<div class="title">
									<p  href="/artworks/sticker/detail?artworkId=5ced84566f6a9" class="artwork-title">
										<a  target="_self" value="춘배와 냐뇨냐뇨" class="coloring-text">춘배와 냐뇨냐뇨</a>
									</p>
								</div> 
							<div class="artist">
								<a href="/creators/올소" target="_self">
									<span class="img_wrap">
										<img src="https://preview.files.api.ogq.me/PROFILE_IMG/c24a0387/5cee97830a42c/OGQ_올소_2021-10-22.png?format=r120_120" 
										alt="올소">
									</span> 
									<span class="name">올소</span>
								</a>
							</div>
						</div>
					</div>
					<!-- 이모티콘 -->
					<div class="card_wrap">
						<div  class="card">
							<div  class="box">
								<a href="/artworks/sticker/detail?artworkId=5ced84566f6a9" 
								draggable="false" target="_self" class="inner-padding" style="user-select: none;">
									<span class="img_wrap">
										<img src="https://storep-phinf.pstatic.net/ogq-5ced84566f6a9/stk/6hzwxsfl.png?type=m480_480" 
										alt="" draggable="false" class="scale-up" style="user-select: none;">
									</span>
								</a> 
							</div> 
							<div class="title">
									<p  href="/artworks/sticker/detail?artworkId=5ced84566f6a9" class="artwork-title">
										<a  target="_self" value="춘배와 냐뇨냐뇨" class="coloring-text">춘배와 냐뇨냐뇨</a>
									</p>
								</div> 
							<div class="artist">
								<a href="/creators/올소" target="_self">
									<span class="img_wrap">
										<img src="https://preview.files.api.ogq.me/PROFILE_IMG/c24a0387/5cee97830a42c/OGQ_올소_2021-10-22.png?format=r120_120" 
										alt="올소">
									</span> 
									<span class="name">올소</span>
								</a>
							</div>
						</div>
					</div>
					<!-- 이모티콘 -->
					<div class="card_wrap">
						<div  class="card">
							<div  class="box">
								<a href="/artworks/sticker/detail?artworkId=5ced84566f6a9" 
								draggable="false" target="_self" class="inner-padding" style="user-select: none;">
									<span class="img_wrap">
										<img src="https://storep-phinf.pstatic.net/ogq-5ced84566f6a9/stk/6hzwxsfl.png?type=m480_480" 
										alt="" draggable="false" class="scale-up" style="user-select: none;">
									</span>
								</a> 
							</div> 
							<div class="title">
									<p  href="/artworks/sticker/detail?artworkId=5ced84566f6a9" class="artwork-title">
										<a  target="_self" value="춘배와 냐뇨냐뇨" class="coloring-text">춘배와 냐뇨냐뇨</a>
									</p>
								</div> 
							<div class="artist">
								<a href="/creators/올소" target="_self">
									<span class="img_wrap">
										<img src="https://preview.files.api.ogq.me/PROFILE_IMG/c24a0387/5cee97830a42c/OGQ_올소_2021-10-22.png?format=r120_120" 
										alt="올소">
									</span> 
									<span class="name">올소</span>
								</a>
							</div>
						</div>
					</div>
					<!-- 이모티콘 -->
					<div class="card_wrap">
						<div  class="card">
							<div  class="box">
								<a href="/artworks/sticker/detail?artworkId=5ced84566f6a9" 
								draggable="false" target="_self" class="inner-padding" style="user-select: none;">
									<span class="img_wrap">
										<img src="https://storep-phinf.pstatic.net/ogq-5ced84566f6a9/stk/6hzwxsfl.png?type=m480_480" 
										alt="" draggable="false" class="scale-up" style="user-select: none;">
									</span>
								</a> 
							</div> 
							<div class="title">
									<p  href="/artworks/sticker/detail?artworkId=5ced84566f6a9" class="artwork-title">
										<a  target="_self" value="춘배와 냐뇨냐뇨" class="coloring-text">춘배와 냐뇨냐뇨</a>
									</p>
								</div> 
							<div class="artist">
								<a href="/creators/올소" target="_self">
									<span class="img_wrap">
										<img src="https://preview.files.api.ogq.me/PROFILE_IMG/c24a0387/5cee97830a42c/OGQ_올소_2021-10-22.png?format=r120_120" 
										alt="올소">
									</span> 
									<span class="name">올소</span>
								</a>
							</div>
						</div>
					</div>
					<!-- 이모티콘 -->
					<div class="card_wrap">
						<div  class="card">
							<div  class="box">
								<a href="/artworks/sticker/detail?artworkId=5ced84566f6a9" 
								draggable="false" target="_self" class="inner-padding" style="user-select: none;">
									<span class="img_wrap">
										<img src="https://storep-phinf.pstatic.net/ogq-5ced84566f6a9/stk/6hzwxsfl.png?type=m480_480" 
										alt="" draggable="false" class="scale-up" style="user-select: none;">
									</span>
								</a> 
							</div> 
							<div class="title">
									<p  href="/artworks/sticker/detail?artworkId=5ced84566f6a9" class="artwork-title">
										<a  target="_self" value="춘배와 냐뇨냐뇨" class="coloring-text">춘배와 냐뇨냐뇨</a>
									</p>
								</div> 
							<div class="artist">
								<a href="/creators/올소" target="_self">
									<span class="img_wrap">
										<img src="https://preview.files.api.ogq.me/PROFILE_IMG/c24a0387/5cee97830a42c/OGQ_올소_2021-10-22.png?format=r120_120" 
										alt="올소">
									</span> 
									<span class="name">올소</span>
								</a>
							</div>
						</div>
					</div>
					<!-- 이모티콘 -->
					<div class="card_wrap">
						<div  class="card">
							<div  class="box">
								<a href="/artworks/sticker/detail?artworkId=5ced84566f6a9" 
								draggable="false" target="_self" class="inner-padding" style="user-select: none;">
									<span class="img_wrap">
										<img src="https://storep-phinf.pstatic.net/ogq-5ced84566f6a9/stk/6hzwxsfl.png?type=m480_480" 
										alt="" draggable="false" class="scale-up" style="user-select: none;">
									</span>
								</a> 
							</div> 
							<div class="title">
									<p  href="/artworks/sticker/detail?artworkId=5ced84566f6a9" class="artwork-title">
										<a  target="_self" value="춘배와 냐뇨냐뇨" class="coloring-text">춘배와 냐뇨냐뇨</a>
									</p>
								</div> 
							<div class="artist">
								<a href="/creators/올소" target="_self">
									<span class="img_wrap">
										<img src="https://preview.files.api.ogq.me/PROFILE_IMG/c24a0387/5cee97830a42c/OGQ_올소_2021-10-22.png?format=r120_120" 
										alt="올소">
									</span> 
									<span class="name">올소</span>
								</a>
							</div>
						</div>
					</div>
					<!-- 이모티콘 -->
					<div class="card_wrap">
						<div  class="card">
							<div  class="box">
								<a href="/artworks/sticker/detail?artworkId=5ced84566f6a9" 
								draggable="false" target="_self" class="inner-padding" style="user-select: none;">
									<span class="img_wrap">
										<img src="https://storep-phinf.pstatic.net/ogq-5ced84566f6a9/stk/6hzwxsfl.png?type=m480_480" 
										alt="" draggable="false" class="scale-up" style="user-select: none;">
									</span>
								</a> 
							</div> 
							<div class="title">
									<p  href="/artworks/sticker/detail?artworkId=5ced84566f6a9" class="artwork-title">
										<a  target="_self" value="춘배와 냐뇨냐뇨" class="coloring-text">춘배와 냐뇨냐뇨</a>
									</p>
								</div> 
							<div class="artist">
								<a href="/creators/올소" target="_self">
									<span class="img_wrap">
										<img src="https://preview.files.api.ogq.me/PROFILE_IMG/c24a0387/5cee97830a42c/OGQ_올소_2021-10-22.png?format=r120_120" 
										alt="올소">
									</span> 
									<span class="name">올소</span>
								</a>
							</div>
						</div>
					</div>
					<!-- 이모티콘 end -->
				</div>
				
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
		</section>
	</div>
</div>
<!-- 메인 종료 -->

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>