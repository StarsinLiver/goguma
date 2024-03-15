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
				<h3 class="display-5 text-white animated slideInDown">이모티콘</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->
    <div class="refund-main-div">
        <table class="refund-table">
            <thead>
                <tr>
                    <th class="refund-th">이모지 아이디</th>
                    <th class="refund-th">유저 아이디</th>
                    <th class="refund-th">결제일</th>
                    <th class="refund-th">결제은행</th>
                    <th class="refund-th">버튼</th>
                </tr>
            </thead>
            <tbody class="refund-tbody">
                <tr>
                    <td class="refund-td"></td>
                    <td class="refund-td"></td>
                    <td class="refund-td"></td>
                    <td class="refund-td"></td>
                    <td class="refund-td">
                        <button type="button" class="refund-btn">환불</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
<script src="/customAssets/js/emoji/refund.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>