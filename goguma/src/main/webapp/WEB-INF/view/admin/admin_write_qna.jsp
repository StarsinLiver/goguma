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
				<h3 class="display-5 text-white animated slideInDown">1 : 1 문의
					관리</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->
<div class="qna-write-main-div">
	<form action="/admin/qna/answer/${qna.id}" method="post">
	<input type="hidden" name="_method" value="put"/>
		<table class="qna-write-table">
			<tr class="qna-write-tr">
				<th class="qna-write-th">분류</th>
				<td class="qna-write-td"><input type="text" readonly="readonly"
					name="optionName" value="${qna.optionName}" /></td>
			</tr>
			<tr class="qna-write-tr">
				<th class="qna-write-th">제목</th>
				<td class="qna-write-td"><input type="text" readonly="readonly"
					class="qna-write-input" name="title" value="questionTitle">
				</td>
			</tr>
			<tr class="qna-write-tr">
				<th class="qna-write-th">내용</th>
				<td class="qna-write-td"><textarea class="qna-write-textarea"
						readonly="readonly">${qna.questionContent}</textarea></td>
			</tr>
			<tr class="qna-write-tr">
				<th class="qna-write-th">답변하기</th>
				<td class="qna-write-td">
				
				<textarea class="qna-write-textarea"
						name="answerContent">${qna.answerContent}</textarea></td>
			</tr>
		</table>
		<button class="qna-write-insert-btn">답변하기</button>
	</form>
</div>

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>