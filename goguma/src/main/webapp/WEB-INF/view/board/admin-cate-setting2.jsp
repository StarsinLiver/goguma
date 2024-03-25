<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<style>
table{
	width: 700px;
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



* {
  margin: 0;
  padding: 0;
  user-select: none;
  box-sizing: border-box;
}
.btnham {
  top: 15px;
  left: 45px;
  height: 45px;
  width: 45px;
  text-align: center;
}
.btn.click {
  left: 260px;
}
.btn span {
  color: white;
  font-size: 28px;
  line-height: 45px;
}
.btn.click span:before {
  content: "\f00d";
}
.sidebar {
  position: fixed;
  width: 250px;
  height: 100%;
  left: 0px;
  background: #1b1b1b;
  transition: left 0.4s ease;
}
.sidebar.show {
  left: 0px;
}
.sidebar .text {
  color: white;
  font-size: 25px;
  font-weight: 600;
  line-height: 65px;
  text-align: center;
  background: #1e1e1e;
  letter-spacing: 1px;
}
nav ul {
  height: 100%;
  width: 100%;
  list-style: none;
}
nav ul li {
  line-height: 60px;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
}
nav ul li:last-child {
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
}
nav ul li div {
  position: relative;
  color: white;
  text-decoration: none;
  font-size: 18px;
  padding-left: 40px;
  font-weight: 500;
  display: block;
  width: 100%;
  border-left: 3px solid transparent;
}
nav ul li.active div {
  color: cyan;
  background: #1e1e1e;
  border-left-color: cyan;
}
nav ul li div:hover {
  background: #1e1e1e;
}
nav ul ul {
  position: static;
  display: none;
}
nav ul .feat-show.show {
  display: block;
}
nav ul .serv-show.show1 {
  display: block;
}
nav ul ul li {
  line-height: 42px;
  border-top: none;
}
nav ul ul li div {
  font-size: 17px;
  color: #e6e6e6;
  padding-left: 80px;
}
nav ul li.active ul li div {
  color: white;
  border-left-color: transparent;
}

nav ul li div span {
  position: absolute;
  top: 50%;
  right: 20px;
  transform: translateY(-50%);
  font-size: 22px;
  transition: transform 0.4s;
}
nav ul li div span.rotate {
  transform: translateY(-50%) rotate(-180deg);
}
.content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: #202020;
  z-index: -1;
  text-align: center;
}
.content .header {
  font-size: 45px;
  font-weight: 600;
}
.content p {
  font-size: 30px;
  font-weight: 500;
}
</style>
<!-- 메인 시작 -->
<!-- Header Start -->
<div class="container-fluid bg-warning py-5 page-header">
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
            	<div class="cate-title-area">
            		<span>카테고리 미리보기</span>
            	</div>
                <div class="cate-box"></div>
            </div>
            <div class="right-box">
                <table class="table">
					<tr class="tr">
						<th class="th">게시판 이름</th>
						<td class="td">
							<input type="text" class="cate-input">
						</td>
					</tr>
					<tr class="hide-tr tr">
						<th class="th">폰트 선택</th>
						<td class="td">
							<div class="radio-all-box">
								<div class="radio-box">
									<input type="radio" value="Dongle" name="font" class="font-select-radio" checked>
									<span class="font-span">Dongle 폰트</span>
								</div>
								<div class="radio-box">
									<input type="radio" value="Gamja Flower" name="font" class="font-select-radio">
									<span class="font-span">Gamja Flower 폰트</span>
								</div>
								<div class="radio-box">
									<input type="radio" value="Sunflower" name="font" class="font-select-radio">
									<span class="font-span">Sunflower 폰트</span>
								</div>
							</div>
						</td>
					</tr>
					<tr class="hide-tr tr">
						<th class="th">배치 형식</th>
						<td class="td">
							<div class="radio-all-box">
								<div class="radio-box">
									<input type="radio" value="LIST" name="type" class="type-select-radio" checked>
									<span class="type-span">리스트 형식</span>
								</div>
								<div class="radio-box">
									<input type="radio" value="CARD" name="type" class="type-select-radio">
									<span class="type-span">카드 형식</span>
								</div>
							</div>
						</td>
					</tr>
					<tr class="hide-tr tr">
						<th class="th">배경 이미지 선택</th>
						<td class="td">
							<div class="mb-3" style="padding:5px 0px 0px 0px;">
							  <input class="form-control" type="file" id="formFile" style="font-size: 1.5rem" accept="image/gif, image/jpeg, image/png">
							</div>
						</td>
					</tr>
					<tr class="tr">
						<td colspan="2"  class="td">
							<div class="cate-button-box">
			                    <button type="button" class="add-cate-btn">메인 카테고리 추가</button>
			                    <button type="button" class="add-sub-cate-btn">서브 카테고리 추가</button>
			                    <button type="button" class="switch-cate-btn">전체 선택 해제</button>
			                    <button type="button" class="delete-cate-btn">카테고리 삭제</button>
			                </div>
						</td>
					</tr>
				</table>
                <div class="save-button-box">
		            <button type="button" class="save-cate-btn">저장하기</button>
		        </div>
            </div>
        </div>
        
    </div>
<script src="/customAssets/js/board/admin-cate-setting2.js"></script>
<script src="/customAssets/js/board/black.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>