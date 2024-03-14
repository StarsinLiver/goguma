<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<style>
/* Google Fonts - Poppins */
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

body {
	min-height: 100%;
	background: #e3f2fd;
}

nav {
	position: fixed;
	top: 0;
	left: 0;
	height: 70px;
	width: 100%;
	display: flex;
	align-items: center;
	background: #fff;
	box-shadow: 0 0 1px rgba(0, 0, 0, 0.1);
}

nav .logo {
	display: flex;
	align-items: center;
	margin: 0 24px;
}

.logo .menu-icon {
	color: #333;
	font-size: 24px;
	margin-right: 14px;
	cursor: pointer;
}

.logo .logo-name {
	color: #333;
	font-size: 22px;
	font-weight: 500;
}

nav .sidebar {
	position: fixed;
	top: 0;
	left: -100%;
	height: 100%;
	width: 260px;
	padding: 20px 0;
	background-color: #fff;
	box-shadow: 0 5px 1px rgba(0, 0, 0, 0.1);
	transition: all 0.4s ease;
}

nav.open .sidebar {
	left: 0;
}

.sidebar .sidebar-content {
	display: flex;
	height: 100%;
	flex-direction: column;
	justify-content: space-between;
	padding: 30px 16px;
}

.sidebar-content .list {
	list-style: none;
}

.list .nav-link {
	display: flex;
	align-items: center;
	margin: 8px 0;
	padding: 14px 12px;
	border-radius: 8px;
	text-decoration: none;
}

.lists .nav-link:hover {
	background-color: #4070f4;
}

.nav-link .icon {
	margin-right: 14px;
	font-size: 20px;
	color: #707070;
}

.nav-link .link {
	font-size: 16px;
	color: #707070;
	font-weight: 400;
}

.lists .nav-link:hover .icon, .lists .nav-link:hover .link {
	color: #fff;
}

.overlay {
	position: fixed;
	top: 0;
	left: -100%;
	height: 1000vh;
	width: 200%;
	opacity: 0;
	pointer-events: none;
	transition: all 0.4s ease;
	background: rgba(0, 0, 0, 0.3);
}

nav.open ~ .overlay {
	opacity: 1;
	left: 260px;
	pointer-events: auto;
}
</style>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sidebar Menu | Side Navigation Bar</title>
<!-- CSS -->
<link rel="stylesheet" href="css/style.css" />
<!-- Boxicons CSS -->
<link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css"
	rel="stylesheet" />
</head>
<div class="sidebar" style="top: 275px; left: 0; height: 0; padding: 0;">
	<div class="logo">
		<i class="bx bx-menu menu-icon"></i> <span class="logo-name">관리자
			메뉴</span>
	</div>

	<div class="sidebar-content">
		<ul class="lists">
			<li class="list"><a href="/admin/user" class="nav-link"> <i
					class="bx bx-home-alt icon"></i> <span class="link">내정보 수정</span>
			</a></li>
			<li class="list"><a href="/admin/history" class="nav-link">
					<i class="bx bx-bar-chart-alt-2 icon"></i> <span class="link">결제
						내역</span>
			</a></li>
			<li class="list"><a href="/cs/notice/list/admin"
				class="nav-link"> <i class="bx bx-bell icon"></i> <span
					class="link">공지사항 관리</span>
			</a></li>
			<li class="list"><a href="/admin/emoji" class="nav-link"> <i
					class="bx bx-heart icon"></i> <span class="link">이모티콘 관리</span>
			</a></li>
			<li class="list"><a href="/admin/report" class="nav-link"> <i
					class="bx bx-folder-open icon"></i> <span class="link">신고 관리</span>
			</a></li>
			<li class="list"><a href="/admin/product" class="nav-link">
					<i class="bx bx-folder-open icon"></i> <span class="link">상품
						관리</span>
			</a></li>
			<li class="list"><a href="/admin/banner" class="nav-link"> <i
					class="bx bx-folder-open icon"></i> <span class="link">광고 관리</span>
			</a></li>
		</ul>


	</div>
</div>

<section class="overlay"></section>

<script src="script.js"></script>
<script>
const navBar = document.querySelector("nav"),
menuBtns = document.querySelectorAll(".menu-icon"),
overlay = document.querySelector(".overlay");

menuBtns.forEach((menuBtn) => {
menuBtn.addEventListener("click", () => {
  navBar.classList.toggle("open");
});
});

overlay.addEventListener("click", () => {
navBar.classList.remove("open");
});


</script>
</html>
