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
    <div class="board-main-div">
        <div class="board-box">
            <div class="board-left-box">
                <div class="board-menu-box">
                    <div class="board-menu-main">
                        <span>메인</span>
                    </div>
                    <div class="board-menu-sub">
                        <span>서브</span>
                    </div>
                </div>
            </div>
            <div class="board-right-box">
                <table class="board-table">
                    <thead>
                        <tr>
                            <th class="board-th">번호</th>
                            <th class="board-th">제목</th>
                            <th class="board-th">날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="board-td">1</td>
                            <td class="board-td">fcdsdfg</td>
                            <td class="board-td">2023</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<script src="/customAssets/js/board/list.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>