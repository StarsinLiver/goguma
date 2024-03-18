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
				<h3 class="display-5 text-white animated slideInDown">배너 등록</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->
<div class="emoji--main-div">

	<table class="emoji--table">
		<form action="/admin/banner/add" method="post" enctype="multipart/form-data">
		<tr class="emoji--table">
			<th class="emoji--th" colspan="2">배너 업로드</th>
		</tr>
		<tr class="emoji--table">
			<th class="emoji--th">배너 제목</th>
			<td class="emoji--td"><input type="text" class="inputs" name="title">
			</td>
		</tr>
		<tr class="emoji--table">
			<th class="emoji--th">클라이언트</th>
			<td class="emoji--td"><input type="text" class="inputs" name="client"/>
			</td>
		</tr>
		<tr class="emoji--table">
			<th class="emoji--th">가격</th>
			<td class="emoji--td"><input type="number" class="inputs" name="price" step="1000" min="0"
				value="0"></td>
		</tr>
		<tr class="emoji--table">
			<th class="emoji--th">타입</th>
			<td class="emoji--td"><select name="type">
					<option value="MAIN">메인</option>
					<option value="FREE_BOARD">자유게시판</option>
			</select></td>
		</tr>
		<tr class="emoji--table">
			<th class="emoji--th">첨부</th>
			<td class="emoji--td"><input type="file" class="inputs" name="file"
				accept="image/gif, image/jpeg, image/png"></td>
		</tr>
		<tr class="emoji--table">
			<th class="emoji--th" colspan="2">
				<button class="">등록</button>
			</th>
		</tr>
		</form>
	</table>
</div>
<script src="/customAssets/js/emoji/upload.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>