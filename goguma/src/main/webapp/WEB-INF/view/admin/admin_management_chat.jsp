<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />
<link rel="stylesheet"
	href="/customAssets/css/product/admin_management_chat.css" />

<!-- 메인 시작 -->
<!-- Header Start -->
<c:forEach items="${chatList}" var="chatRoom">
	<input type="hidden" id="chatRoomId"
		value="${chatRoom.adminChatRoomDto.roomId}" />
</c:forEach>
<div class="all-page-title"
	style="background-image: url(/assets/images/pattern-4.png);">
	<div class="container text-center">
		<h1>채팅방 로그 관리</h1>
	</div>
	<!--End Page-->
</div>
<!-- end section -->
<svg id="clouds" class="hidden-xs" xmlns="http://www.w3.org/2000/svg"
	version="1.1" width="100%" height="100" viewBox="0 0 85 100"
	preserveAspectRatio="none">
        <path
		d="M-5 100 Q 0 20 5 100 Z
            M0 100 Q 5 0 10 100
            M5 100 Q 10 30 15 100
            M10 100 Q 15 10 20 100
            M15 100 Q 20 30 25 100
            M20 100 Q 25 -10 30 100
            M25 100 Q 30 10 35 100
            M30 100 Q 35 30 40 100
            M35 100 Q 40 10 45 100
            M40 100 Q 45 50 50 100
            M45 100 Q 50 20 55 100
            M50 100 Q 55 40 60 100
            M55 100 Q 60 60 65 100
            M60 100 Q 65 50 70 100
            M65 100 Q 70 20 75 100
            M70 100 Q 75 45 80 100
            M75 100 Q 80 30 85 100
            M80 100 Q 85 20 90 100
            M85 100 Q 90 50 95 100
            M90 100 Q 95 25 100 100
            M95 100 Q 100 15 105 100 Z">
        </path>
    </svg>
<!-- Header End -->
<div class="user-page"
	style="width: 95%; height: 80%; margin: 5% 5% 53% 5%">
	<!-- aside -->
	<%@ include file="/WEB-INF/view/admin/admin_aside.jsp"%>
	<!-- aside end -->
	<div class="payment-container" style="width: 70%; margin-right: 15%;">
		<h4 class="user-page-title">채팅방 로그 관리</h4>
		<div class="col-sm-12">
			<div class="search-div">
				<form action="/admin/chat">
					<input type="text" name="search" placeholder="상품 이름을 검색해주세요" />
					<button type="submit" class="btn btn-warning btn-complete">검색</button>
				</form>
			</div>
			<div class="card mb-8">
				<div class="card-header text-white">
					<!-- 카드 헤더 -->
					<h5 class="card-title">채팅방 리스트</h5>
				</div>
				<div class="row" style="padding: 20px;">
					<c:forEach items="${chatList}" var="chatRoom">
						<div class="col-md-4">
							<div class="chat-card">
								<a
									href="/product/productDetail?pId=${chatRoom.adminChatRoomDto.getPId()}">
									<h4>
										<b>상품명 : ${chatRoom.adminChatRoomDto.productName}</b>
									</h4>
									<h4>
										<b>상품 번호 : ${chatRoom.adminChatRoomDto.roomId}</b>
									</h4>
								</a> <a
									href="/product/userProduct?uId=${chatRoom.adminChatRoomDto.hostId}">
									<h4>
										<b>호스트 유저 : ${chatRoom.adminChatRoomDto.hostName}</b>
									</h4>
								</a> <a
									href="/product/userProduct?uId=${chatRoom.adminChatRoomDto.userId}">
									<h4>
										<b>채팅 유저 : ${chatRoom.adminChatRoomDto.userName}</b>
									</h4>
								</a>
								<c:if test="${chatRoom.adminChatRoomDto.deleteYn == 'N'}">
									<form
										action="/admin/chat-room/delete/${chatRoom.adminChatRoomDto.roomId}"
										method="post">
										<input type="hidden" name="_method" value="delete" />
										<button class="btn btn-danger"
											onclick="if(!confirm('채팅방을 삭제하시겠습니까?')) return false;">채팅방
											삭제</button>
									</form>
								</c:if>
								<hr />
								<div class="chat-room"
									onclick="openModal(${chatRoom.adminChatRoomDto.roomId})"
									id="chatRoom${chatRoom.adminChatRoomDto.roomId}">
									<!-- 채팅방 내용 -->
									<c:forEach items="${chatRoom.chatMessageDto}" var="chatMessage">
										<p>${chatMessage.userName}&nbsp;:&nbsp;${chatMessage.text}</p>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- 모달 -->
				<div id="myModal" class="modal">
					<div class="modal-content">

						<div id="modalContent"></div>
						<span class="close" onclick="closeModal()">&times;</span>
					</div>
				</div>


				<div class="pagination">
					<!-- 페이지 처리 -->
					<c:if test="${start > 1}">
						<a href="/admin/chat?pg=${start - 1}">&laquo;</a>
					</c:if>
					<!-- 페이지 번호 -->
					<c:forEach var="i" begin="${start}" end="${end}">
						<a href="/admin/chat?pg=${i}" class="${pg == i ? 'active':''}">${i}</a>
					</c:forEach>
					<c:if test="${end < last}">
						<a href="/admin/chat?pg=${end + 1}">&raquo;</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/customAssets/js/product/admin_management_chat.js"></script>

<%@ include file="/WEB-INF/view/footer.jsp"%>