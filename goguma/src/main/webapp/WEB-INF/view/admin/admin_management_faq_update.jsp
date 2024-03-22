<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>

<!-- 메인 시작 -->
<!-- Header Start -->
<div class="container-fluid bg-warning py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">faq</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->
<div class="qna-write-main-div">
	<h2 class="qna-write-h2">FAQ 수정하기</h2>
	<form action="/admin/faq/${faq.id}" method="post">
		<input type="hidden" name="_method" value="put" />

		<table class="qna-write-table">
			<tr class="qna-write-tr">
				<th class="qna-write-th">제목</th>
				<td class="qna-write-td"><input type="text" name="title"
					class="qna-write-input" value="${faq.title}"></td>
			</tr>
			<tr class="qna-write-tr">
				<th class="qna-write-th">내용</th>
				<td class="qna-write-td"><textarea class="qna-write-textarea" name="content">${faq.content}</textarea>
				</td>
			</tr>
		</table>
		<div style="text-align: center;">
		<button type="submit" class="qna-write-insert-btn" >수정</button>
		</div>
	</form>
	
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>