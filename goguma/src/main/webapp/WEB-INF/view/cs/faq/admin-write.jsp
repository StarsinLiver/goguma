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
        <table class="qna-write-table">
            <tr class="qna-write-tr">
                <th class="qna-write-th">제목</th>
                <td class="qna-write-td">
                    <input type="text" class="qna-write-input">
                </td>
            </tr>
            <tr class="qna-write-tr">
                <th class="qna-write-th">내용</th>
                <td class="qna-write-td">
                    <textarea class="qna-write-textarea"></textarea>
                </td>
            </tr>
        </table>
        <button type="button" class="qna-write-insert-btn">faq등록</button>
    </div>
<script src="/customAssets/js/cs/faq/admin-write.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>