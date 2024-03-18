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
				<h3 class="display-5 text-white animated slideInDown">배너 수정</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->
<div class="emoji--main-div">

	<table class="emoji--table">
		<form action="/admin/banner/update/${banner.id}" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="_method" value="put" />
			<tr class="emoji--table">
				<th class="emoji--th" colspan="2">배너 업로드</th>
			</tr>
			<tr class="emoji--table">
				<th class="emoji--th">배너 제목</th>
				<td class="emoji--td"><input type="text" class="inputs"
					name="title" value="${banner.title}"></td>
			</tr>
			<tr class="emoji--table">
				<th class="emoji--th">클라이언트</th>
				<td class="emoji--td"><input type="text" class="inputs"
					name="client" value="${banner.client}" /></td>
			</tr>
			<tr class="emoji--table">
				<th class="emoji--th">가격</th>
				<td class="emoji--td"><input type="number" class="inputs"
					name="price" step="1000" min="0" value="${banner.price}" value="0"></td>
			</tr>
			<tr class="emoji--table">
				<th class="emoji--th">타입</th>
				<td class="emoji--td"><select name="type"
					value="${banner.type}">
						<option value="MAIN">메인</option>
						<option value="FREE_BOARD">자유게시판</option>
				</select></td>
			</tr>
			<tr class="emoji--table">
				<th class="emoji--th">사용 여부</th>
				<td class="emoji--td"><select name="useYn"
					value="${banner.useYn}">
						<option value="Y">사용</option>
						<option value="N">사용 안함</option>
				</select></td>
			</tr>
			<tr class="emoji--table">
				<th class="emoji--th">첨부<br/>(미첨부시 원래 이미지가 들어갑니다.)</th>
				<td class="emoji--td"><input type="file" class="file"
					name="file" accept="image/gif, image/jpeg, image/png"></td>

			</tr>
			<tr class="emoji--table">
				<th class="emoji--th" colspan="2">
					<button class="">등록</button>
				</th>
			</tr>
		</form>
	</table>
</div>

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>