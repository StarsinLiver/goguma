/**
 * 
 */

$(document).ready(function() {
    $(".btn").toggleClass("click");
    $(".sidebar").toggleClass("show");

    // Ajax 요청
    $.ajax({
        method: "GET",
        url: "/free-board/category",
        success: function(data) {

            var cate = "";

            // 중복되지 않는 id 값을 추출
            var uniqueIds = [...new Set(data.map(item => item.id))];

            // 중복되지 않는 id에 대한 하위 항목을 그룹화하여 아코디언으로 생성
            uniqueIds.forEach(id => {
                cate += '<li>';
                cate += '<a href="#" class="feat-btn">' + data.find(item => item.id === id).name + '<span class="fas fa-caret-down first"></span></a>'; // 1차 카테고리
                cate += '<ul class="feat-show">'; // 2차 카테고리 시작

                data.filter(item => item.id === id).forEach(subItem => {
                    cate += `<li><a href="/freeBoard/list?cate1=${id}&id=${subItem.subId}">` + subItem.subName + '</a></li>'; // 2차 카테고리
                });

                cate += '</ul>'; // 2차 카테고리 종료
                cate += '</li>'; // 1차 카테고리 종료
            });

            // HTML에 추가
            $('.categiry').html(cate);

            // 각각의 .feat-btn 요소에 대한 클릭 이벤트 핸들러를 등록합니다.
            $(".feat-btn").off("click").on("click", function() {
                $(this).next(".feat-show").slideToggle();
                $(this).find(".fas").toggleClass("fa-caret-down fa-caret-up");

                // 현재 클릭된 .feat-btn을 제외한 다른 .feat-btn의 .feat-show를 닫습니다.
                $(".feat-btn").not(this).next(".feat-show").slideUp();
                $(".feat-btn").not(this).find(".fas").removeClass("fa-caret-up").addClass("fa-caret-down");
            });
            
             // 현재 카테고리에 해당하는 data.name 값을 출력
	         var currentCategoryName = ""; // 현재 카테고리 이름을 저장할 변수 선언
	         // 여기에 현재 카테고리에 해당하는 data.name 값을 가져오는 코드를 작성합니다.
	         // 예를 들어, 첫 번째 요소의 이름을 가져오려면:
	         if (data.length > 0) {
	             currentCategoryName = data[0].name;
	             var categoryName = $(currentCategoryName).data('name');
	             document.getElementById("cateName").innerText = categoryName;
	         }
	        
	        
           
        },
        error: function() {
            console.log('카테고리 생성 실패');
        }
    });
});






$(".feat-btn").click(function() {
	$("nav ul .feat-show").toggleClass("show");
	$("nav ul .first").toggleClass("rotate");
});
$(".serv-btn").click(function() {
	$("nav ul .serv-show").toggleClass("show1");
	$("nav ul .second").toggleClass("rotate");
});
$("nav ul li").click(function() {
	$(this).addClass("active").siblings().removeClass("active");
});