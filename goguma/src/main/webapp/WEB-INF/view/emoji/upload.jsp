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
				<h3 class="display-5 text-white animated slideInDown">이모티콘 등록</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->
    <div class="emoji--main-div" style="flex-direction: row;">
    		<div>
		<!-- aside -->
		<%@ include file="/WEB-INF/view/admin/admin_aside.jsp"%>
		<!-- aside end -->
	</div>
        <table class="emoji--table" style="margin: 0 10% 0 10%;">
            <tr class="emoji--table">
                <th class="emoji--th" colspan="2">이모티콘 업로드</th>
            </tr>
            <tr class="emoji--table">
                <th class="emoji--th">이모티콘 대표 이름</th>
                <td class="emoji--td">
                    <input type="text" class="inputs">
                </td>
            </tr>
            <tr class="emoji--table">
                <th class="emoji--th">가격</th>
                <td class="emoji--td">
                    <input type="number" class="inputs" value="2000">
                </td>
            </tr>
            <tr class="emoji--table">
                <th class="emoji--th">첨부</th>
                <td class="emoji--td">
                    <input type="file" class="inputs" multiple accept="image/gif, image/jpeg, image/png">
                </td>
            </tr>
            <tr class="emoji--table">
                <th class="emoji--th" colspan="2">
                    <button type="button" class="emoji--upload-btn">등록</button>
                </th>
            </tr>
        </table>
    </div>
	<script src="/customAssets/js/emoji/upload.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>