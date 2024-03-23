const displayMainCategory = document.querySelector("#main--category");
const displaySubCategory = document.querySelector("#sub--category");

    
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
    
// 도큐먼트가 시작할 때
document.addEventListener("DOMContentLoaded", function() {
    // Your code to run when the document is ready goes here
    
    $.ajax({
		url : "http://localhost/free-board/maincategory" ,
		type: "get" ,
		success : function(data) {
			// 초기값 지정
			let options = displayCategory(data);
			displayMainCategory.innerHTML = options;
			let sub = onclickMain(data[0].id);
			displaySubCategory.innerHTML = sub;
			
		} , error : function(xhr) {
			console.log(xhr);
		}
	})
    
});
    
function onclickMainCategory(id) {
	console.log(id);
	
	// 위의 메인값에 대한 소분류 값 들고오기
	$.ajax({
		url : "/free-board/user/subcategory/" + id ,
		method : "get" ,
		success : function(data) {
			displaySubCategory.innerHTML = `<option value="">소분류</option>`
			displaySub(data);
			
		} , error : function(xhr) {
			console.log(xhr);
		}
	})
}

// 카테고리 화면에 반영
const displayCategory = (data) => {
	let option = ""
	for(var i = 0; i < data.length; i++) {
		option += `<option value="${data[i].id}">${data[i].name}</option>`;
	}

	return option;
}

// 메인 카테고리를 클릭하였을 때
const onclickMain = (main) => {
	$.ajax({
		url : "/free-board/subcategory/" + main,
		type : "get" ,
		success : function(data) {
			console.log(data);
			
			let options = displayCategory(data);
			displaySubCategory.innerHTML = options;
			
		} , error : function(xhr) {
			console.log(xhr);
		}
	})
}