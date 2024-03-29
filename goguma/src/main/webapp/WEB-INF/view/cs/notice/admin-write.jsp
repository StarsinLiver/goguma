<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />

<!-- 메인 시작 -->
<!-- Header Start -->
<div class="container-fluid bg-warning py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">공지사항 글쓰기</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->
<div class="cs-notice--main-div">
	<div>
		<!-- aside -->
		<%@ include file="/WEB-INF/view/admin/admin_aside.jsp"%>
		<!-- aside end -->
	</div>
	<table class="cs-notice--table" style="margin: 0 10% 0 10%;">
		<tr class="cs-notice--tr">
			<th class="cs-notice--th">제목</th>
			<td class="cs-notice--td"><input type="text"
				class="cs-notice--input"></td>
		</tr>
		<tr class="cs-notice--tr">
			<th class="cs-notice--th">내용</th>
			<td class="cs-notice--td"><textarea class="cs-notice--textarea"></textarea>
			</td>
		</tr>
		<tr class="cs-notice--tr">
			<th class="cs-notice--th" colspan="2">
				<button type="button" class="cs-notice--insert-btn">등록</button>
			</th>
		</tr>
	</table>
</div>	
<script src="/customAssets/js/cs/notice/admin-write.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>