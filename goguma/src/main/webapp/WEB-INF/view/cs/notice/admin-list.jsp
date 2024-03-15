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
				<h3 class="display-5 text-white animated slideInDown">공지사항</h3>
			</div>
		</div>
	</div>
</div>
<!-- Header End -->
    <div class="notice--main-div">
        <div class="notice--body">
            <table class="notice--table">
                <colgroup>
                    <col width="10%"/>
                    <col width="60%"/>
                    <col width="30%"/>
                </colgroup>
                <thead class="notice--thead">
                    <tr class="notice--tr">
                        <th class="notice--th">번호</th>
                        <th class="notice--th">제목</th>
                        <th class="notice--th">작성일</th>
                    </tr>
                </thead>
                <tbody class="notice--tbody"></tbody>
            </table>
            <button class="admin-notice-write-btn" style="padding: 20px; background-color: aqua;">글쓰기</button>
            <div class="notice--page-box">
                <div class="notice--arrow-box">
                    <span>◀</span>
                </div>
                <div class="notice--num-box">
                    <span class="p-num">1</span>
                </div>
                <div class="notice--arrow-box">
                    <span>▶</span>
                </div>
            </div>
        </div>
    </div>
<script src="/customAssets/js/cs/notice/admin-list.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>