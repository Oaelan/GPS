<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>간호사 로그인</title>
<link rel="stylesheet" href="../resources/CSS/main.css">
<link rel="stylesheet" href="../resources/CSS/loginSuccessNurse.css">
</head>
<body>
  <div class="container">
    <div class="StateBar">
    	<img src="../resources/IMG/wifi.png" class="wifi">
    	<img src="../resources/IMG/battery.png" class="battery">
    	<div class="time">12:00</div>
    	
    </div>
    <div class="Menu">
    	<img src="../resources/IMG/menu_bar.png" class="menuBar" onclick="toggleMenu()">
    	<div class="title">Green Hospital</div>
    	<img src="../resources/IMG/user2.png" class="user" onclick="openUserMenu()">
    </div>
    <div class="content">
			<div class="dropdown">
				<button class="dropbtn" id="dropbtn">환자 찾기</button>
				<div class="dropdown-content">
					<a href="#" onclick="selectFloor('환자 A')">환자 A</a> 
					<a href="#" onclick="selectFloor('환자 B')">환자 B</a>
					<a href="#" onclick="selectFloor('환자 C')">환자 C</a>
				</div>
			</div>
			<div class="map">
    		Map
    	</div>
    </div>
  </div>
   <div id="slideMenu" class="slide-menu">
      <a href="#" class="closebtn" onclick="closeMenu()">&times;</a>
		<ul>
			<li><a href="ComingRoute.jsp">오시는 길</a></li>
			<li><a href="FindRoute.jsp">병원 내 길찾기</a></li>
			<li><a href="introduce.jsp">병원소개</a></li>
			<li><a href="loginSuccessNurse.html">환자 찾기 (간호사 전용)</a></li>
		</ul>
	</div>
	<div id="userMenu" class="user-menu">
    <a href="#" class="closebtn" onclick="closeUserMenu()">&times;</a>
    <ul>
      <li><a href="#">로그아웃</a></li>
      <li><a href="#">마이페이지</a></li>
    </ul>
  </div>
  <script src="../resources/JS/main.js"></script>
</body>
</html>
