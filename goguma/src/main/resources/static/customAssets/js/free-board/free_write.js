
const displayMainCategory = document.querySelector("#main--category");
const displaySubCategory = document.querySelector("#sub--category");



	$('#summernote').summernote(
			{
				placeholder : '내용을 입력해주세요.',
				tabsize : 2,
				height : 120,
				focus: true,
				lang: 'ko-KR',
				toolbar : [ [ 'style', [ 'style' ] ],
						[ 'font', [ 'bold', 'underline', 'clear' ] ],
						[ 'color', [ 'color' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'table', [ 'table' ] ],
						[ 'insert', [ 'link', 'picture', 'video' ] ],
						[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
						
			});
	

// 도큐먼트가 시작할 때
document.addEventListener("DOMContentLoaded", function() {
    // Your code to run when the document is ready goes here
    
    $.ajax({
		url : "/free-board/maincategory" ,
		type: "get" ,
		success : function(data) {
			console.log(data);
			
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

// 카테고리 화면에 반영
const displayCategory = (data) => {
	let option = ""
	for(var i = 0; i < data.length; i++) {
		option += `<option value="${data[i].id}">${data[i].name}</option>`;
	}
	
	console.log("메인 옵션" , option);
	return option;
}

// 메인 카테고리를 클릭하였을 때
const onclickMain = (main) => {
	console.log(main);
	
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