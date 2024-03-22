<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />

<style>
.user-page .payment-container {
	width: 800px;
	height: auto;
	padding: 40px;
	border-radius: 5px;
}

/* The Modal (background) */
.my-modal {
    max-width: 1200px;
    display: none;
    position: fixed;
    z-index: 1;
    top: 70px;
    padding-top: 100px;
    width: 100%;
    height: 100%;
}
.my-modal-content {
    margin: auto;
    max-width: 500px;
    position: relative;
    display: flex;
    flex-direction: column;
    width: 50%;
    pointer-events: auto;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0, 0, 0, 0.2);
    border-radius: 0.3rem;
    outline: 0;
}
/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  padding: 0 20px;
  box-sizing: border-box;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.my-modal-content table {
	width: 100%;
	margin-bottom: 10px;
}
.my-modal-content tr {
	border-bottom: 1px solid #ccc;
}
.my-modal-content textarea {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	max-height: 177px;
}
.user-page .emoji-name {
	margin-left: 20px;
    font-size: 20px;
    font-weight: 700;
}

.complete {
	color: green;
}
</style>

<!-- 메인 시작 -->
<!-- Header Start -->
<div class="all-page-title" style="background-image:url(/assets/images/pattern-4.png);">
        <div class="container text-center">
            <h1>마이페이지</h1>
        </div>
        <!--End Page-->
    </div><!-- end section -->

    <svg id="clouds" class="hidden-xs" xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100" viewBox="0 0 85 100" preserveAspectRatio="none">
        <path d="M-5 100 Q 0 20 5 100 Z
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

<div class="user-page">
	<!-- aside -->
	<%@ include file="/WEB-INF/view/user/myPageAside.jsp"%>
	<!-- aside end -->
	
	<div class="payment-container">
		<h4 class="user-page-title">결제 내역</h4>
		
		<div class="col-sm-12">
			<div class="card mb-3">
				<div class="card-header text-white">
					<!-- 카드 헤더 -->
					<h5 class="card-title">이모티콘 구매내역</h5>
				</div>
				<div class="card-body">
					<table class="table text-center">
						<thead>
							<tr>
								<th>제품코드</th>
								<th>구매일자</th>
								<th>구매상품명</th>
								<th>환불여부</th>
								<th>상세 정보</th>
							</tr>
						</thead>
						<tbody>
							<!-- 데이터가 없을 때 표시될 행 -->
							<tr id="noDataMessage" style="display: none;">
								<td colspan="5">내역이 없습니다.</td>
							</tr>
							<!-- 실제 데이터 행 -->
							<c:forEach var="history" items="${histories}">
							<tr id="dataRow">
								<td id="id">${history.mainEmojiId}</td>
								<td class="purchaseDate">${history.createAt}</td>
								<td id="pointName">${history.name}</td>
								<td class="refundYn">${history.cancelYn}</td>
								<td>
									<button id="refundButton" data-value="${history.merchantId}" 
										class="btn btn-warning btn-complete cancel-request">상세</button>
								</td>
							</tr>
							</c:forEach>
						</tbody>

					</table>
					<p>※ 환불 기간은 구매일자 기준 최대 3일 안에만 가능합니다.</p>
					
					<div class="pagination">
						<!-- 페이지 처리 -->
						<c:if test="${start > 1}">
						<a href="/user/payment?pg=${start - 1}">&laquo;</a>
					  	</c:if>
					  	<!-- 페이지 번호 -->
					  	<c:forEach var="i" begin="${start}" end="${end}">
							<a href="/user/payment?pg=${i}" class="${pg == i ? 'active':''}">${i}</a>
						</c:forEach>
					  	<c:if test="${end < last}">
						<a href="/user/payment?pg=${end + 1}">&raquo;</a>
						</c:if>
					</div>
				</div>

			</div>
		</div>
		
	</div>
	
	<!-- Modal -->
	<div class="my-modal">
	  <div class="my-modal-content">
	    <span class="close">&times;</span>
	    <article style="padding: 20px;">
	    	<img id="imoji-img" style="width: 100px; height: 100px;" 
	    		src="/assets/images/goguma_mascot.png" alt="이모티콘"/>
	    	<span class="emoji-name"></span>
	    	<table>
	    		<tr>
	    			<td>금액</td>
	    			<td class="emoji-price"></td>
	    		</tr>
	    		<tr>
	    			<td>결제 번호</td>
	    			<td class="emoji-id"></td>
	    		</tr>
	    		<tr>
	    			<td>거래일자</td>
	    			<td class="emoji-date"></td>
	    		</tr>
	    		<tr>
	    			<td>거래은행</td>
	    			<td class="emoji-history-bank"></td>
	    		</tr>
	    	</table>
	    	<label>환불 사유 : </label>
	    	<textarea id="cancel-text"></textarea>
	    	<button type="button" style="float: right;" 
	    		class="btn btn-warning btn-complete req-text">등록</button>
	    </article>
	  </div>
	</div>
	
</div>
<!-- 메인 종료 -->

<script>
	const modal = $('.my-modal');
	
	// 모달 창 열기
	$(".cancel-request").click(function(){
		const id = $(this).data('value');
		
		
		$.ajax({
		    type: 'get',
		    url: '/user/historyDetail?id=' + id,
		    headers: {
		        "Content-Type": "application/json"
		    },
		    success: function(result) {
		        const bank = result.bank;
		        const price = result.price.toLocaleString();
		        const name = result.name;
		        const date = result.createAt;
		        const cancelYn = result.cancelYn;
		        let reason = result.cancelReason;
		        const file = result.file;
		        
		        console.log(reason);
		        
		        $('.emoji-id').text(id);
				$('.emoji-price').text(price+'원');
				$('.emoji-name').text(name);
				$('.emoji-history-bank').text(bank);
				$('.emoji-name').text(name);
				$('.emoji-date').text(date);
				$('#imoji-img').attr('src', '/images/upload/emoji/'+file);
				
				// 환불 여부
				if (reason !== null) {
				    $('.req-text').hide();
				    $('#cancel-text').replaceWith(function () {
				        return $('<p>', { id: 'cancel-text', text: reason });
				    });
				} else {
				    $('.req-text').show();
				    $('#cancel-text').replaceWith(function () {
				        return $('<textarea>', { id: 'cancel-text', text: '' });
				    });
				}
				
		    },
		    error: function(request, status, error) {
		        console.log(error);
		    }
		});
		
		// 모달창 보여주기
		modal.css("display", "block");
	});
	
	// 환불 등록
	$('.req-text').click(function(){
		const id = $('.emoji-id').text();
		const content = $('#cancel-text').val();
		
		$.ajax({    
			type : 'put',               
			url : '/user/emojiReason',            
			headers : {          
				"Content-Type" : "application/json"    
			},    
			data : JSON.stringify({  
				"id" : id,
				"content" : content
			}),    
			success : function(result) {       
				alert('환불되었습니다.');
				location.reload();
				modal.css("display", "none");
			},    
			error : function(request, status, error) {     
				console.log(error)    
			}});
	});
	
	
	// 모달창 나가기
	$(".close").on("click", function() {
	  modal.css("display", "none");
	});
	
	
	// 환불여부
	document.addEventListener("DOMContentLoaded", function() {
	    const replyElements = document.querySelectorAll('.refundYn');
	    
	    replyElements.forEach(function(replyElement) {
	        if (replyElement.textContent.trim() === 'N') {
	            replyElement.textContent = '대기';
	        } else if (replyElement.textContent.trim() === 'Y') {
	            replyElement.textContent = '환불 완료';
	            replyElement.classList.add('complete');
	        }
	    });
	});
	
</script>

<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>