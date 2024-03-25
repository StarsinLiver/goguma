$(document).ready(function() {
    //$(".btn").toggleClass("click");
    //$(".sidebar").toggleClass("show");

    // 각각의 .feat-btn 요소에 대한 클릭 이벤트 핸들러를 등록합니다.
	$(".feat-btn").off("click").on("click", function() {
	    $(this).next(".feat-show").slideToggle();
	    $(this).find(".fas").toggleClass("fa-caret-down fa-caret-up");
	
	    // 현재 클릭된 .feat-btn을 제외한 다른 .feat-btn의 .feat-show를 닫습니다.
	    $(".feat-btn").not(this).next(".feat-show").slideUp();
	    $(".feat-btn").not(this).find(".fas").removeClass("fa-caret-up").addClass("fa-caret-down");
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