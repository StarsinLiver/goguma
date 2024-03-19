<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Created By CodingNepal - www.codingnepalweb.com -->
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body>
	<!-- Sidebar -->
	<div class="w3-sidebar w3-bar-block"
		style="display: none; z-index: 5; width: 12%;" id="mySidebar">
		<button class="w3-bar-item w3-button" onclick="w3_close()">Close</button>
		<a href="#" class="w3-bar-item w3-button">Link 1</a> <a href="#"
			class="w3-bar-item w3-button">Link 2</a> <a href="#"
			class="w3-bar-item w3-button">Link 3</a>
	</div>

	<!-- Overlay -->
	<div class="w3-overlay" onclick="w3_close()" style="cursor: pointer"
		id="myOverlay"></div>

	<!-- Page content -->
	<button class="w3-button w3-xxlarge" onclick="w3_open()">&#9776;</button>
	<div class="w3-container">
		<h1>Sidebar Overlay</h1>
		<p>Click on the "hamburger" icon to slide in the side navigation.</p>
	</div>
	<div class="w3-container">
		<h1>Sidebar Overlay</h1>
		<div class="image-container">
			<a href="#"> <img src="/customAssets/images/no_product.png"
				style="display: inline-block; width: 80%; height: 566px;">
			</a>
		</div>
	</div>
</body>
<!-- JS to open and close sidebar with overlay effect -->
<script>
	function w3_open() {
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("myOverlay").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("myOverlay").style.display = "none";
	}
</script>


</html>