	const deleteBtn = document.getElementById('delete-board');
	const displaySubCategory = document.getElementById('sub--category');
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
        let mainCategory = url.searchParams.get('mainCategory');
        let subCategory = url.searchParams.get('subCategory');

        // pagination 클래스를 가진 요소 찾기
        let paginationLinks = document.querySelectorAll('.pagination a');

        // 각 링크에 추가 파라미터 추가
        paginationLinks.forEach(function(link) {
            let linkUrl = new URL(link.href);

            // 파라미터 추가
            if (searchType && search) {
                linkUrl.searchParams.append('searchType', searchType);
                linkUrl.searchParams.append('search', search);
                linkUrl.searchParams.append('mainCategory', mainCategory);
                linkUrl.searchParams.append('subCategory', subCategory);
            }

            // 변경된 URL을 href 속성에 설정
            link.href = linkUrl.href;
        });
    };
    
 	// 모두 체크
	function selectAll(selectAllCheckbox) {
        const checkboxes = document.querySelectorAll('.check');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAllCheckbox.checked;
        });
    }
    
    // 게시글 삭제
  	function deleteFun() {
  		const checked = document.querySelectorAll('input[name="checkbox"]:checked');
  		let boardIds = [];
  		
  		// 체크박스 값 넣기
  		checked.forEach(function(item) {
  			boardIds.push(Number(item.value));
  	    });
  		
  		$.ajax({
		    type: 'put',
		    url: '/user/board/delete',
		    dataType: 'json',
		    data: JSON.stringify(boardIds),
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
    
function onclickMainCategory(id) {
	console.log(id);
	
	// 위의 메인값에 대한 소분류 값 들고오기
	$.ajax({
		url : "/free-board/subcategory/" + id ,
		method : "get" ,
		success : function(data) {
			displaySubCategory.innerHTML = `<option value="">소분류</option>`
			displaySub(data);
			
		} , error : function(xhr) {
			console.log(xhr);
		}
	})
}

const displaySub = (data) => {
	for(var i = 0 ; i < data.length ; i++) {
		displaySubCategory.innerHTML += `<option value="${data[i].id}">${data[i].name}</option>`
	}
}