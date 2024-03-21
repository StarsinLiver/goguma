<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>

<style>
table{
	width: 700px;
}

th {
	border-right: 1px solid #dee2e6;
	width: 30%;
	padding: none;
	height: 30%;
	vertical-align: middle;
}

thead {
	height: 50px
}

select {
	height: 100%;
}

label{

vertical-align: middle;
}
.form-select {
	font-size: 1.5rem;
}
.form-check-input{
    margin-top: 1em;

}
input[type="checkbox"]{
vertical-align: middle;
}
</style>
<!-- 메인 시작 -->
<!-- Header Start -->
<div class="container-fluid bg-warning py-5 mb-5 page-header">
	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<h3 class="display-5 text-white animated slideInDown">about</h3>
			</div>
		</div>
	</div>
</div>
    <div class="main-div">
        <div class="cate-content-box">
            <div class="left-box">
                <div class="cate-button-box">
                    <button type="button" class="add-cate-btn">메인 카테고리 추가</button>
                    <button type="button" class="add-sub-cate-btn">서브 카테고리 추가</button>
                    <button type="button" class="switch-cate-btn">전체 선택 해제</button>
                    <button type="button" class="delete-cate-btn">카테고리 삭제</button>
                </div>
                <div class="cate-box"></div>
            </div>
            <div class="right-box">
                <!-- ========================================== -->
                <table class="table">
					<tr>
						<th>게시판 이름 입력</th>
						<td>
							<input type="text" class="cate-input">
						</td>
					</tr>
					<tr>
						<th>폰트 선택</th>
						<td>
							<div class="radio-all-box">
								<div class="radio-box">
									<input type="radio" name="font">
									<span>폰트1</span>
								</div>
								<div class="radio-box">
									<input type="radio" name="font">
									<span>폰트2</span>
								</div>
								<div class="radio-box">
									<input type="radio" name="font">
									<span>폰트3</span>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>배치 형식</th>
						<td>
							<div class="radio-all-box">
								<div class="radio-box">
									<input type="radio" name="type">
									<span>형식</span>
								</div>
								<div class="radio-box">
									<input type="radio" name="type">
									<span>형식</span>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>배경 이미지 선택</th>
						<td>
							<div class="mb-3" style="padding:5px 0px 0px 0px;">
							  <input class="form-control" type="file" id="formFileMultiple" multiple style="font-size: 1.5rem">
							</div>
						</td>
					</tr>
				</table>
                <!-- ========================================== -->
            </div>
        </div>
        <div class="save-button-box">
            <button type="button" class="save-cate-btn">저장하기</button>
        </div>
    </div>
<script src="/customAssets/js/board/admin-cate-setting2.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>