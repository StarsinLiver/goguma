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
				<h3 class="display-5 text-white animated slideInDown">공지사항 상세</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->
    <div class="notice-detail-main-div">
    <h2 class="notice-detail-h2">공지사항 수정</h2>
        <table class="notice-detail-table">
            <tr class="notice-detail-tr">
                <th class="notice-detail-th">제목</th>
                <td class="notice-detail-td"></td>
            </tr>
            <tr class="notice-detail-tr">
                <th class="notice-detail-th">작성일</th>
                <td class="notice-detail-td"></td>
            </tr>
            <tr class="notice-detail-tr">
                <th class="notice-detail-th">내용</th>
                <td class="notice-detail-td"></td>
            </tr>
            <tr class="notice-detail-tr">
                <th class="notice-detail-th" colspan="2">
                	<button type="button" class="admin-notice-update-btn">수정</button>
                	<button type="button" class="admin-notice-delete-btn">삭제</button>
                </th>
            </tr>
        </table>
    </div>
<script src="/customAssets/js/cs/notice/admin-detail.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>