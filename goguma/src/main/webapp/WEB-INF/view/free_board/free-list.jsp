<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>

<!-- 부트스트랩 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.form-control {
	width: calc(30% - 5px); /* 검색창 폭 조절 */
}

.form-select {
	width: calc(13% - 5px); /* 셀렉트 박스 폭 조절 */
}
h2 {
	background-color: #f2f2f2;
	padding: 10px;
	margin-top: 20px;
}
</style>

<div class="container mt-4">
	<div class="row justify-content-center">
			<section class="section nopad cac text-center" style="width: 67%;">
			<a href="#"><h3>아마도 광고 들어갈 예정</h3></a>
		</section>
		<div class="col-lg-8">
			<h2>게시판 - 카테고리 이름 <a href="/freeBoard/main" style="float:right;">메인으로</a></h2>
			<!-- 리스트 테이블 -->
			<table class="table table-bordered">
				<thead>
					<tr>

						<th scope="col" width="295" class="text-center">제목</th>
						<th scope="col" width="140" class="text-center">작성자</th>
						<th scope="col" width="115" class="text-center">등록일</th>
						<th scope="col" width="45" class="text-center">조회</th>
						<th scope="col" width="35" class="text-center">추천</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>
					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>					<tr>
						<td><a href=""> 대박! 미국이 경악하고 러시아가 극찬하고 중국이 무릎꿇은 부산 고구마 <span class="badge bg-secondary">[0]</span></a>
						</td>
						<td><a id="article-profile-link"
							href="/product/userProduct?uId=1"> <img src="" alt="프로필"
								class="img-thumbnail"> <span class="hu_nick_txt">작성자</span>
						</a></td>
						<td><span class="w_date">2024-03-18 10:25</span></td>
						<td class="text-center">1777</td>
						<td class="text-center"><span class="badge bg-primary">105</span></td>
					</tr>
				</tbody>
			</table>
			<!-- 글 작성 버튼 및 검색창 -->
			<div class="d-flex justify-content-between mt-3 align-items-center">
				<!-- 페이징 버튼 -->
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1" aria-disabled="true">이전</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
				</nav>
				<!-- 글 작성 버튼 -->
				<a class="btn btn-outline-secondary" href="/freeBoard/write">글쓰기</a>
			</div>
			<!-- 검색창 -->
			<form class="d-flex justify-content-center mt-3">
				<select class="form-select me-2" aria-label="검색 유형">
					<option selected>검색 유형 선택</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="author">작성자</option>
				</select> <input class="form-control me-2" type="search"
					placeholder="검색어를 입력하세요" aria-label="검색어">
				<button class="btn btn-outline-secondary" type="submit">검색</button>
			</form>
		</div>
	</div>
</div>
<!-- 부트스트랩 자바스크립트 및 필수 자바스크립트 -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>