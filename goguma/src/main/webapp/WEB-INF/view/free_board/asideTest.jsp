<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Created By CodingNepal - www.codingnepalweb.com -->
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="css/menu.css">
<link rel="stylesheet" type="text/css" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
  <link rel="stylesheet" href="style.css" />
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    />
<style>
* {
  margin: 0;
  padding: 0;
  user-select: none;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
.btn {
  position: absolute;
  top: 15px;
  left: 45px;
  height: 45px;
  width: 45px;
  text-align: center;
  background: #1b1b1b;
  border-radius: 3px;
  cursor: pointer;
  transition: left 0.4s ease;
}
.btn.click {
  left: 260px;
}
.btn span {
  color: white;
  font-size: 28px;
  line-height: 45px;
}
.btn.click span:before {
  content: "\f00d";
}
.sidebar {
  position: fixed;
  width: 250px;
  height: 100%;
  left: -250px;
  background: #1b1b1b;
  transition: left 0.4s ease;
}
.sidebar.show {
  left: 0px;
}
.sidebar .text {
  color: white;
  font-size: 25px;
  font-weight: 600;
  line-height: 65px;
  text-align: center;
  background: #1e1e1e;
  letter-spacing: 1px;
}
nav ul {
  background: #1b1b1b;
  height: 100%;
  width: 100%;
  list-style: none;
}
nav ul li {
  line-height: 60px;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
}
nav ul li:last-child {
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
}
nav ul li a {
  position: relative;
  color: white;
  text-decoration: none;
  font-size: 18px;
  padding-left: 40px;
  font-weight: 500;
  display: block;
  width: 100%;
  border-left: 3px solid transparent;
}
nav ul li.active a {
  color: cyan;
  background: #1e1e1e;
  border-left-color: cyan;
}
nav ul li a:hover {
  background: #1e1e1e;
}
nav ul ul {
  position: static;
  display: none;
}
nav ul .feat-show.show {
  display: block;
}
nav ul .serv-show.show1 {
  display: block;
}
nav ul ul li {
  line-height: 42px;
  border-top: none;
}
nav ul ul li a {
  font-size: 17px;
  color: #e6e6e6;
  padding-left: 80px;
}
nav ul li.active ul li a {
  color: #e6e6e6;
  background: #1b1b1b;
  border-left-color: transparent;
}
nav ul ul li a:hover {
  color: cyan !important;
  background: #1e1e1e !important;
}
nav ul li a span {
  position: absolute;
  top: 50%;
  right: 20px;
  transform: translateY(-50%);
  font-size: 22px;
  transition: transform 0.4s;
}
nav ul li a span.rotate {
  transform: translateY(-50%) rotate(-180deg);
}
.content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: #202020;
  z-index: -1;
  text-align: center;
}
.content .header {
  font-size: 45px;
  font-weight: 600;
}
.content p {
  font-size: 30px;
  font-weight: 500;
}
</style>
</head>
  <body>
    <div class="btn">
      <span class="fas fa-bars"></span>
    </div>
    <nav class="sidebar">
      <div class="text">Sidebar Dropdown</div>
      <ul>
        <li class="active"><a href="#">Dashboard</a></li>
        <li>
          <a href="#" class="feat-btn"
            >Features
            <span class="fas fa-caret-down first"></span>
          </a>
          <ul class="feat-show">
            <li><a href="#">Pages</a></li>
            <li><a href="#">Elements</a></li>
          </ul>
        </li>
        <li>
          <a href="#" class="serv-btn"
            >Services
            <span class="fas fa-caret-down second"></span>
          </a>
          <ul class="serv-show">
            <li><a href="#">App Design</a></li>
            <li><a href="#">Web Design</a></li>
          </ul>
        </li>
        <li><a href="#">Portfolio</a></li>
        <li><a href="#">Overview</a></li>
        <li><a href="#">Shortcuts</a></li>
        <li><a href="#">Feedback</a></li>
      </ul>
    </nav>
    <div class="content">
      <div class="header">Sidebar Dropdown Using HTML CSS & JavaScript.</div>
    </div>
    <script>
      $(".btn").click(function () {
        $(this).toggleClass("click");
        $(".sidebar").toggleClass("show");
      });
      $(".feat-btn").click(function () {
        $("nav ul .feat-show").toggleClass("show");
        $("nav ul .first").toggleClass("rotate");
      });
      $(".serv-btn").click(function () {
        $("nav ul .serv-show").toggleClass("show1");
        $("nav ul .second").toggleClass("rotate");
      });
      $("nav ul li").click(function () {
        $(this).addClass("active").siblings().removeClass("active");
      });
    </script>
  </body>
</html>