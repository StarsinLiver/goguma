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
						<p>이곳에서 원하시는 채팅방을 선택할 수 있습니다.</p>
					</div>
					<!-- end title -->

					<!-- 메인 시작 -->
					<div class="chat_main">
						<div class="messaging">
							<div class="inbox_msg">
								<div class="inbox_people">
									<div class="headind_srch">
										<div class="recent_heading">
											<h4>Recent</h4>
										</div>
										<div class="srch_bar">
											<div class="stylish-input-group">
												<input type="text" class="search-bar" placeholder="Search">
												<span class="input-group-addon">
													<button type="button">
														<i class="fa fa-search" aria-hidden="true"></i>
													</button>
												</span>
											</div>
										</div>
									</div>

									<!-- 채팅방 시작 -->
									<div class="inbox_chat">
										<c:forEach items="${chatRoomList}" var="list">
											<div class="chat_list active_chat"
												onclick="chatListItemsFunc(${list.roomId})">
												<div class="chat_people">


													<div class="chat_img">
														<img
															src="https://ptetutorials.com/images/user-profile.png"
															alt="sunil">
													</div>
													<div class="chat_ib">
														<h5>
															${list.roomId}번방.&nbsp;${list.roomName} <span
																class="chat_date">${list.createAt}</span>
														</h5>
														<c:if test="${list.hostId == 2}">
														⭐🌟
													</c:if>
														<p>상품명 : ${list.productName}</p>
													</div>
												</div>
											</div>
										</c:forEach>
										<!-- 샘플용ㅇ -->
										<div class="chat_list">
											<div class="chat_people">
												<div class="chat_img">
													<img src="https://ptetutorials.com/images/user-profile.png"
														alt="sunil">
												</div>
												<div class="chat_ib">

													<h5>
														Sunil Rajput <span class="chat_date">Dec 25</span>
													</h5>
													<p>Test, which is a new approach to have all solutions
														astrology under one roof.</p>
												</div>
											</div>
										</div>
										<!-- 샘플용 -->
									</div>
								</div>
								<!-- 채팅방 종료 -->

								<!-- 메시지 섹션 시작 -->
								<div class="mesgs">
									<h4 id="chatingRoomName"></h4>
									<hr />
									<div class="msg_history">
										<div class="incoming_msg">
											<div class="incoming_msg_img">
												<img src="https://ptetutorials.com/images/user-profile.png"
													alt="sunil">
											</div>
											<div class="received_msg">
												<div class="received_withd_msg">

													<p>Test which is a new approach to have all solutions</p>
													<img src="/assets/images/cat-1.png"
														style="width: 200px; height: 100px;" /> <span
														class="time_date"> 11:01 AM | June 9</span>
												</div>
											</div>
										</div>
										<div class="outgoing_msg">
											<div class="sent_msg">
												<p>Test which is a new approach to have all solutions</p>
												<span class="time_date"> 11:01 AM | June 9</span>
											</div>
										</div>
										<div class="incoming_msg">
											<div class="incoming_msg_img">
												<img src="https://ptetutorials.com/images/user-profile.png"
													alt="sunil">
											</div>
											<div class="received_msg">
												<div class="received_withd_msg">
													<p>Test, which is a new approach to have</p>
													<span class="time_date"> 11:01 AM | Yesterday</span>
												</div>
											</div>
										</div>
										<div class="outgoing_msg">
											<div class="sent_msg">
												<p>Apollo University, Delhi, India Test</p>
												<span class="time_date"> 11:01 AM | Today</span>
											</div>
										</div>
										<div class="incoming_msg">
											<div class="incoming_msg_img">
												<img src="https://ptetutorials.com/images/user-profile.png"
													alt="sunil">
											</div>
											<div class="received_msg">
												<div class="received_withd_msg">
													<p>We work directly with our designers and suppliers,
														and sell direct to you, which means quality, exclusive
														products, at a price anyone can afford.</p>
													<span class="time_date"> 11:01 AM | Today</span>
												</div>
											</div>
										</div>
									</div>
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
												for="imageInput" class="btn btn-secondary">Image</label>
											<!-- 이미지 -->
											<!-- 이모티콘 -->
											<button type="button" class="btn btn-primary"
												data-bs-toggle="modal" data-bs-target="#emoticonModal">
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
													<div class="modal-header">
														<h5 class="modal-title" id="emoticonModalLabel">Select
															an Emoticon</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<!-- 헤더 -->
														<ul class="nav nav-underline">
															<li class="nav-item"><a class="nav-link active"
																aria-current="page" href="#section1"
																data-bs-toggle="tab">Active</a></li>
															<li class="nav-item"><a class="nav-link"
																href="#section2" data-bs-toggle="tab">Link 1</a></li>
															<li class="nav-item"><a class="nav-link"
																href="#section3" data-bs-toggle="tab">Link 2</a></li>
														</ul>

														<div class="tab-content">
															<div class="tab-pane fade show active" id="section1">
																<!-- Content for section 1 -->

																<p>This is the content of section 1.</p>
																<!-- Emoticon Sections -->
																<div class="emoticon-section active"
																	id="section-smileys">
																	<!-- Smileys Emoticons -->
																	<button class="btn btn-light"
																		style="width: 100px; height: 100px;">
																		<img
																			src="https://ptetutorials.com/images/user-profile.png"
																			alt="sunil">
																		<p class="visually-hidden">https://ptetutorials.com/images/user-profile.png</p>
																	</button>
																	<button class="btn btn-light">😀</button>
																	<button class="btn btn-light">😁</button>
																	<!-- Add more emoticons as needed -->
																</div>
																<div class="emoticon-section" id="section-animals">
																	<!-- Animal Emoticons -->
																	<button class="btn btn-light">🐶</button>
																	<button class="btn btn-light">🐱</button>
																	<button class="btn btn-light">🐰</button>
																	<!-- Add more emoticons as needed -->
																</div>
																<!-- Add more sections as needed -->
															</div>
															<div class="tab-pane fade" id="section2">
																<!-- Content for section 2 -->
																<p>This is the content of section 2.</p>

																<!-- Emoticon Sections -->
																<div class="emoticon-section active"
																	id="section-smileys">
																	<!-- Smileys Emoticons -->
																	<button class="btn btn-light"
																		style="width: 100px; height: 100px;">
																		<img
																			src="https://ptetutorials.com/images/user-profile.png"
																			alt="sunil">
																		<p class="visually-hidden">ㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㄹㅇㅁ룸나ㅣ안무ㅏㅣ위ㅏㅁ누아ㅣㄴ무ㅏ이ㅏㄴ무마ㅣ</p>
																	</button>
																	<button class="btn btn-light">😀</button>
																	<button class="btn btn-light">😁</button>
																	<!-- Add more emoticons as needed -->
																</div>
																<div class="emoticon-section" id="section-animals">
																	<!-- Animal Emoticons -->
																	<button class="btn btn-light">🐶</button>
																	<button class="btn btn-light">🐱</button>
																	<button class="btn btn-light">🐰</button>
																	<!-- Add more emoticons as needed -->
																</div>
																<!-- Add more sections as needed -->
															</div>
															<div class="tab-pane fade" id="section3">
																<!-- Content for section 3 -->
																<p>This is the content of section 3.</p>

																<!-- Emoticon Sections -->
																<div class="emoticon-section active"
																	id="section-smileys">
																	<!-- Smileys Emoticons -->
																	<button class="btn btn-light"
																		style="width: 100px; height: 100px;">
																		<img
																			src="https://ptetutorials.com/images/user-profile.png"
																			alt="sunil">
																		<p class="visually-hidden">ㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁㄹㅇㅁ룸나ㅣ안무ㅏㅣ위ㅏㅁ누아ㅣㄴ무ㅏ이ㅏㄴ무마ㅣ</p>
																	</button>
																	<button class="btn btn-light">😀</button>
																	<button class="btn btn-light">😁</button>
																	<!-- Add more emoticons as needed -->
																</div>
																<div class="emoticon-section" id="section-animals">
																	<!-- Animal Emoticons -->
																	<button class="btn btn-light">🐶</button>
																	<button class="btn btn-light">🐱</button>
																	<button class="btn btn-light">🐰</button>
																	<!-- Add more emoticons as needed -->
																</div>
																<!-- Add more sections as needed -->
															</div>
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
<!-- Bootstrap JS (Optional) -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-8FPOj1KuqbzvEu7wQ/xzQ2QeCy8a90Ai5ms5PhR6w6zyv2X1ZXxPeC5WdrfaXLj6"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
	integrity="sha384-nBd17s/SFPXxZb3O02/HX+9kiRE5Al4GQpu/NUdhuATnf6/Jl+zUx0UEvFGScxUJ"
	crossorigin="anonymous"></script>

<script src="/customAssets/js/chat_room.js"></script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>