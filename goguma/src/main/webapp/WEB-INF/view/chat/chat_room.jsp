<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/chat_room.css" />

<style>
/* Add your custom CSS here */
.selected-image {
	position: relative;
	display: inline-block;
	margin-right: 5px;
}

.selected-image img {
	max-width: 100px;
	max-height: 100px;
	border-radius: 5px;
}

.selected-image .remove-image {
	position: absolute;
	top: 0;
	right: 0;
	cursor: pointer;
	background-color: rgba(255, 255, 255, 0.8);
	padding: 2px 5px;
	border-radius: 50%;
}
</style>

<div>
	<input type="hidden" value="${principal.getUId()}" id="userId" />
	<div id="home" class="parallax first-section"
		data-stellar-background-ratio="0.4"
		style="background-image: url('/assets/uploads/background-12.png');">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-12">
					<div class="big-tagline">
						<h2>
							당신 근처의 <br> 지역 생활 커뮤니티
						</h2>
						<p class="lead">고민없이 구매 가능한 마켓 고구마 마켓에서 가까운 이웃과 함께해요.</p>
						<a href="#support"
							class="btn btn-light btn-radius btn-brd ban-btn">중고 거래 이용하기</a>
					</div>
				</div>

				<div class="app_iphone_02 wow slideInUp hidden-xs hidden-sm"
					data-wow-duration="1s" data-wow-delay="0.5s">
					<img src="/assets/uploads/rocket.png" alt="" class="img-responsive">
				</div>
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
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

	<div id="about" class="section wb nopadtop">
		<div class="container">



			<div id="case" class="section wb">
				<div class="container">
					<div class="section-title text-center">
						<small>chat</small>
						<h3>채팅방</h3>
						<p>여러 채팅을 해 보세요!!</p>
					</div>
					<!-- end title -->

					<!-- 메인 시작 -->
					<div class="chat_main">
						<div class="messaging">
							<div class="inbox_msg">
								<div class="inbox_people">
									<div class="headind_srch">
										<div class="recent_heading">
											<h4>ChatRoom</h4>
										</div>
									</div>
									<!-- 채팅방 시작 -->
									<div class="inbox_chat">
										<c:forEach items="${chatRoomList}" var="list">
											<div class="chat_list" data-roomid="${list.roomId}"
												onclick="chatListItemsFunc(${list.roomId})">
												<div class="chat_people">
													<div class="chat_img">
													<c:if test="${principal.getUId() == list.hostId}">
														<img
															src="/profile/${list.userFile}"
															alt="sunil">
													</c:if>
													<c:if test="${principal.getUId() == list.userId}">
													<img
															src="/profile/${list.hostFile}"
															alt="sunil">
													</c:if>
													</div>
													<div class="chat_ib">
														<h5>
															<c:choose>
																<c:when
																	test="${list.roomName == null && principal.getUId() == list.userId}">
																${list.hostName}
															</c:when>
																<c:when
																	test="${list.roomName == null && principal.getUId() == list.hostId}">
																${list.userName}
															</c:when>
																<c:otherwise>
																${list.roomName}
															</c:otherwise>
															</c:choose>

															<span class="chat_date">${list.formatCreateAt()}</span>
														</h5>
														<c:if test="${list.hostId == principal.getUId()}">
                   											 ⭐🌟
                										</c:if>
														<c:choose>
															<c:when test="${list.confirmYn == 'Y'}">
																<p>
																	<del>상품명 : ${list.productName}</del>
																	&nbsp;확정된 상품
																</p>
															</c:when>
															<c:otherwise>
																<p>상품명 : ${list.productName}</p>
															</c:otherwise>
														</c:choose>
														<div style="display: flex;">
														<a href="/chat/room/update/${list.roomId}"
															class="btn btn-success m-1">방 관리</a>
														<form action="/chat/room/exit" method="post"
															onsubmit="return confirm('채팅방에서 나가시겠습니까?');">
															<input type="hidden" name="_method" value="delete" /> <input
																type="hidden" name="roomId" value="${list.roomId}" />
															<button class="btn btn-danger">채팅방 나가기</button>
														</form>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- 채팅방 종료 -->

								<!-- 메시지 섹션 시작 -->
								<div class="mesgs">
									<h4 id="chatingRoomName"></h4>

									<div class="msg_history"></div>
									<!-- 메시지 input 태그 시작 -->
									<div id="selectedImages"></div>
									<div class="type_msg">
										<div class="input_msg_write">
											<!-- 텍스트 -->
											<input type="text" class="write_msg" id=messageInput
												placeholder="Type a message" />
											<!-- 텍스트 -->
											<!-- 이미지 -->
											<input type="file" class="form-control-file" id="imageInput"
												style="display: none;" accept="image/*"> <label
												for="imageInput" class="btn btn-secondary" style="background: #FFD800; border-radius: 10px;">이미지</label>
											<!-- 이미지 -->
											<!-- 이모티콘 -->
											<button type="button" class="btn btn-primary"
												data-bs-toggle="modal" data-bs-target="#emoticonModal" style="border-radius: 10px;">
												이모티콘</button>
											<!-- 이모티콘 -->
											<button class="msg_send_btn btn btn-primary" type="button"
												onclick="sendMessage()">
												<i class="fa fa-paper-plane-o" aria-hidden="true"></i> Send
											</button>
										</div>


										<!-- Modal 시작 -->
										<div class="modal fade" id="emoticonModal" tabindex="-1"
											aria-labelledby="emoticonModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">
													<div
														class="modal-header d-flex justify-content-between align-items-center">
														<h5 class="modal-title" id="emoticonModalLabel">Choose
															an Emoticon</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<!-- 헤더 -->
														<div class="container-fluid">
															<div class="row">
																<div class="col-12">
																	<div class="nav-scroll"
																		style="max-width: 100%; overflow-x: auto;"
																		id="scrollable-menu">
																		<ul class="nav nav-pills mb-3 flex-nowrap"
																			id="pills-tab" role="tablist">
																			<c:forEach var="mainEmoji" items="${mainEmojiList}"
																				varStatus="loop">
																				<li class="nav-item me-2" role="presentation">
																					<a
																					class="nav-link ${loop.index == 0 ? 'active' : ''}"
																					id="pills-${mainEmoji.id}-tab"
																					data-bs-toggle="pill" href="#pills-${mainEmoji.id}"
																					role="tab" aria-controls="pills-${mainEmoji.id}"
																					aria-selected="${loop.index == 0 ? 'true' : 'false'}">
																						<img src="/images/upload/emoji/${mainEmoji.file}"
																						alt="이미지설명"
																						style="max-width: 30px; max-height: 30px; border-radius: 50%;">
																				</a>
																				</li>
																			</c:forEach>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
														<!-- 헤더 끝 -->

														<div class="tab-content" id="pills-tabContent">
															<c:forEach var="mainEmoji" items="${mainEmojiList}"
																varStatus="loop">
																<div
																	class="tab-pane fade ${loop.index == 0 ? 'show active' : ''}"
																	id="pills-${mainEmoji.id}" role="tabpanel"
																	aria-labelledby="pills-${mainEmoji.id}-tab">
																	<!-- Emoticon Sections -->
																	<div
																		class="emoticon-section d-flex justify-content-center"
																		id="section-smileys">
																		<!-- Smileys Emoticons -->
																		<div class="row">
																			<c:forEach var="subEmoji" items="${emojiList}">
																				<c:if test="${mainEmoji.id == subEmoji.groupId}">
																					<div
																						class="col-3 mb-3 d-flex justify-content-center align-items-center">
																						<button
																							class="btn btn-light rounded-circle p-3 border border-2 border-primary"
																							style="width: 100px; height: 100px;">
																							<img src="/images/upload/emoji/${subEmoji.file}"
																								alt="image" class="img-fluid">
																							<p class="visually-hidden">${subEmoji.file}</p>
																						</button>
																					</div>
																				</c:if>
																			</c:forEach>
																			<!-- Add more emoticons as needed -->
																		</div>
																	</div>
																	<!-- Add more sections as needed -->
																</div>
															</c:forEach>
														</div>
														<!-- 헤더 종료 -->
													</div>
												</div>
											</div>
										</div>
										<!-- Modal 종료 -->
									</div>
									<!-- 메시지 input 태그 종료 -->
								</div>
								<!-- 메인 종료 -->
							</div>
							<!-- end container -->
						</div>
						<!-- end section -->

						<!-- end section -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script src="/customAssets/js/chat_room.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>