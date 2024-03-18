<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/view/header.jsp"%>
<link rel="stylesheet" href="/customAssets/css/user.css" />

<style>
	.my-qna-container .reply.complete {
		color: #1ece3c;
		
	}
	.my-qna-container .reply {
		font-weight: bold;
	}
	
	.search-div form {
		display: flex;
	    padding: 20px;
	    box-sizing: border-box;
	    justify-content: flex-end;
	    align-items: center;
	}
	.search-div form > * {
		margin-left: 10px;
	}
	
	.search-div input {
		font-size: 16px;
		padding: 8px;
		border: 1px solid #ddd;
	}
	.search-div select {
		padding: 11px;
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
	
	<div class="my-qna-container">
		<h4 class="user-page-title">문의내역</h4>
		
		<div class="search-div">
			<form action="/user/myQna">
				<select name="searchType">
					<option value="titleOrContent">제목+내용</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="search" placeholder="검색..."/>
				<button type="submit" class="btn btn-warning btn-complete">검색</button>
			</form>
		</div>
		<table class="table table-hover">
		  <tbody>
			    <tr class="board-title">
			  		<th></th>
			  		<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>확인여부</th>
			    </tr>
			    <c:forEach var="qna" items="${qnaList}">
			    <tr class="qna--data">
			      <td><input type="checkbox" name="checkbox" class="check" value="${qna.id}"/></td>
			      <td>${qna.id}</td>
			      <td><a href="#">${qna.title}</a></td>
			      <td>${qna.formatCreatedAt()}</td>
			      <td class="reply">${qna.answerYn}</td>
			    </tr>
			    </c:forEach>
		  </tbody>
		</table>
		<div class="board-utils">
			<label>
				<input type="checkbox" name="allChack" onclick="selectAll(selectAll)" id="allChack"/>&nbsp;
				<span>모두 선택</span>
			</label>
			
			<div>
				<button id="delete-qna" onclick="deleteFun()" class="btn btn-warning btn-complete">삭제</button>
				<a href="/cs/qna/write" class="btn btn-warning btn-complete">문의하기</a>
			</div>
		</div>
		<div class="pagination">
			<!-- 페이지 처리 -->
			<c:if test="${start > 1}">
			<a href="/user/myQna?pg=${start - 1}">&laquo;</a>
		  	</c:if>
		  	<!-- 페이지 번호 -->
		  	<c:forEach var="i" begin="${start}" end="${end}">
				<a href="/user/myQna?pg=${i}" class="${pg == i ? 'active':''}">${i}</a>
			</c:forEach>
		  	<c:if test="${end < last}">
			<a href="/user/myQna?pg=${end + 1}">&raquo;</a>
			</c:if>
		</div>
	</div>
</div>
<!-- 메인 종료 -->
<script>
	const deleteBtn = document.getElementById('delete-qna');
	
	// 답변 여부
	document.addEventListener("DOMContentLoaded", function() {
	    const replyElements = document.querySelectorAll('.reply');
	    
	    replyElements.forEach(function(replyElement) {
	        if (replyElement.textContent.trim() === 'N') {
	            replyElement.textContent = '대기중';
	        } else if (replyElement.textContent.trim() === 'Y') {
	            replyElement.textContent = '답변완료';
	            replyElement.classList.add('complete');
	        }
	    });
	});
    
    
 	// 페이지가 로드된 후 실행됨
    window.onload = function() {
        // 현재 URL 가져오기
        let currentUrl = window.location.href;

        let url = new URL(currentUrl);

        // 추가할 파라미터
        let searchType = url.searchParams.get('searchType');
        let search = url.searchParams.get('search');

        // pagination 클래스를 가진 요소 찾기
        let paginationLinks = document.querySelectorAll('.pagination a');

        // 각 링크에 추가 파라미터 추가
        paginationLinks.forEach(function(link) {
            let linkUrl = new URL(link.href);

            // 파라미터 추가
            if (searchType && search) {
                linkUrl.searchParams.append('searchType', searchType);
                linkUrl.searchParams.append('search', search);
            }

            // 변경된 URL을 href 속성에 설정
            link.href = linkUrl.href;
        });
    };
    
 	// 모두 체크
	function selectAll(selectAll)  {
	  const checkboxes = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
    
    // 게시글 삭제
  	function deleteFun() {
  		const checked = document.querySelectorAll('input[name="checkbox"]:checked');
  		let qnaIds = [];
  		
  		// 체크박스 값 넣기
  		checked.forEach(function(item) {
  			qnaIds.push(Number(item.value));
  	    });
  		
  		$.ajax({
		    type: 'put',
		    url: '/user/myQna/delete',
		    dataType: 'json',
		    data: JSON.stringify(qnaIds),
		    contentType: 'application/json',
		    async : false,
		    success: function(result) {
		    	
		    	location.reload();
		    },
		    error: function(request, status, error) {
		        console.log(error);
		    }
		});
    	
    }
</script>
<!-- 푸터 -->
<%@ include file="/WEB-INF/view/footer.jsp"%>