<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Created By CodingNepal - www.codingnepalweb.com -->
<html>
<head>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

.main_box {
	position: relative;
	background: url('side.jpeg') right no-repeat;
	background-size: cover;
	width: 25%;
}

.main_box .sidebar_menu {
	height: 100%;
	width: 280px;
	left: -280px;
	/* background: rgba(255, 255, 255, 0.1); */
	background: black;
	box-shadow: 0px 0px 6px rgba(255, 255, 255, 0.5);
	overflow: hidden;
	transition: all 0.3s linear;
	box-shadow: 0px 0px 6px rgba(255, 255, 255, 0.5);
}

.sidebar_menu .logo {
	position: absolute;
	width: 100%;
	height: 60px;
	box-shadow: 0px 2px 4px rgba(255, 255, 255, 0.5);
}

.sidebar_menu .logo a {
	color: #fff;
	font-size: 25px;
	font-weight: 500;
	position: absolute;
	left: 50px;
	line-height: 60px;
	text-decoration: none;
}

.sidebar_menu .menu {
	position: absolute;
	top: 80px;
	width: 100%;
}

.sidebar_menu .menu li {
	margin-top: 6px;
	padding: 14px 20px;
}

.sidebar_menu .menu i {
	color: #fff;
	font-size: 20px;
	padding-right: 8px;
}

.sidebar_menu .menu a {
	color: #fff;
	font-size: 20px;
	text-decoration: none;
}

.sidebar_menu .menu li:hover {
	border-left: 1px solid #fff;
	box-shadow: 0 0 4px rgba(255, 255, 255, 0.5);
}

.sidebar_menu .social_media {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	bottom: 20px;
	list-style: none;
	cursor: pointer;
}

.sidebar_menu .social_media i {
	text-decoration: none;
	padding: 0 5px;
	color: #fff;
	opacity: 0.6;
	font-size: 20px;
}

.sidebar_menu .social_media i:hover {
	opacity: 1;
	transition: all 0.2s linear;
	transform: scale(1.01);
}

#check {
	display: none;
}

.main_box .btn_one i {
	color: #fff;
	font-size: 30px;
	font-weight: 700;
	position: absolute;
	left: 16px;
	line-height: 60px;
	cursor: pointer;
	opacity: 1;
	transition: all 0.3s linear;
}

.sidebar_menu .btn_two i {
	font-size: 25px;
	line-height: 60px;
	position: absolute;
	left: 240px;
	cursor: pointer;
	opacity: 0;
	transition: all 0.3s linear;
}

.btn_one i:hover {
	font-size: 29px;
}

.btn_two i:hover {
	font-size: 24px;
}

#check:checked ~ .sidebar_menu {
	left: 0;
}

#check:checked ~ .btn_one i {
	opacity: 0;
}

#check:checked ~ .sidebar_menu .btn_two i {
	opacity: 1;
}
</style>
</head>
<body>
	<div class="main_box">
		<input type="checkbox" id="check">
		<div class="btn_one">
			<label for="check"> <i class="fas fa-bars"></i>
			</label>
		</div>
		<div class="sidebar_menu">
			<div class="logo">
				<a href="#">CodingLab</a>
			</div>
			<div class="btn_two">
				<label for="check"> <i class="fas fa-times"></i>
				</label>
			</div>
			<div class="menu">
				<ul>
					<li><i class="fas fa-qrcode"></i> <a href="#">Dashboard</a></li>
					<li><i class="fas fa-link"></i> <a href="#">Shortcuts</a></li>
					<li><i class="fas fa-stream"></i> <a href="#">Overview</a></li>
					<li><i class="fas fa-calendar-week"></i> <a href="#">Events</a>
					</li>
					<li><i class="fas fa-question-circle"></i> <a href="#">About</a>
					</li>
					<li><i class="fas fa-sliders-h"></i> <a href="#">Services</a>
					</li>
					<li><i class="fas fa-phone-volume"></i> <a href="#">Contact</a>
					</li>
					<li><i class="far fa-comments"></i> <a href="#">Feedback</a></li>
				</ul>
			</div>
			<div class="social_media">
				<ul>
					<a href="#"><i class="fab fa-facebook-f"></i></a>
					<a href="#"><i class="fab fa-twitter"></i></a>
					<a href="#"><i class="fab fa-instagram"></i></a>
					<a href="#"><i class="fab fa-youtube"></i></a>
				</ul>
			</div>
		</div>
	</div>
</body>

</html>