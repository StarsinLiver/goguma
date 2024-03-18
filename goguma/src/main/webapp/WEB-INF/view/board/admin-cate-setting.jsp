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
				<h3 class="display-5 text-white animated slideInDown">about</h3>
			</div>
		</div>
	</div>
</div>
    <div class="main-div">
        <div class="cate-content-box">
            <div class="left-box">
                <div class="cate-button-box">
                    <button type="button" class="add-cate-btn">카테고리 추가</button>
                    <button type="button" class="add-sub-cate-btn">서브 카테고리 추가</button>
                    <button type="button" class="switch-cate-btn">전체 선택 해제</button>
                    <button type="button" class="delete-cate-btn">카테고리 삭제</button>
                </div>
                <div class="cate-box"></div>
            </div>
            <div class="right-box">
                <table class="table">
                    <tr class="tr">
                        <th class="th">카테고리명</th>
                        <td class="td">
                            <input type="text" class="cate-input">
                        </td>
                    </tr>
                    <tr class="tr">
                        <th class="th">카테고리 정렬</th>
                        <td class="td">
                            <div class="up-down-box">
                                <button type="button" class="up-btn">위로</button>
                                <button type="button" class="down-btn">아래로</button>
                            </div>
                        </td>
                    </tr>
                    <tr class="tr hide-tr">
                        <th class="th">글보기</th>
                        <td class="td">
                            <div class="board-style-box">
                                <div class="radio-box">
                                    <span>총 게시물 수</span>
                                    <input type="number" class="row-count" value="10">
                                    <span>개</span>
                                </div>
                                <div class="radio-box">
                                	<input type="radio" class="board-check-btn" name="radio">
                                    <span>게시판 형식</span>
                                </div>
                                <div class="radio-box">
                                	<input type="radio" class="board-check-btn" name="radio">
                                    <span>카드 형식</span>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="save-button-box">
            <button type="button" class="save-cate-btn">저장하기</button>
        </div>
    </div>
<script src="/customAssets/js/board/admin-cate-setting.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>