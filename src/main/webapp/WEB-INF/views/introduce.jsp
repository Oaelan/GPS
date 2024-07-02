<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>병원 소개</title>
<link rel="stylesheet" href="../resources/CSS/main.css">
<link rel="stylesheet" href="../resources/CSS/introduce.css">
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
    	<div class="title">Green Hospital
    	</div>
    	<img src="../IMG/user2.png" class="user" onclick="openUserMenu()">
    	
    </div>
    <div class="content">
    	<div class="text">
    		<h2>안녕하세요 그린병원입니다.</h2>
    	</div>
    </div>
  </div>
   <div id="slideMenu" class="slide-menu">
      <a href="#" class="closebtn" onclick="closeMenu()">&times;</a>
		<ul>
			<li><a href="/ComingRoute">오시는 길</a></li>
			<li><a href="/FindRoute">병원 내 길찾기</a></li>
			<li><a href="/introduce">병원소개</a></li>
		</ul>
	</div>
	<div id="userMenu" class="user-menu">
    <a href="#" class="closebtn" onclick="closeUserMenu()">&times;</a>
    <ul>
      <li><a href="/main">로그아웃</a></li>
      <li><a href="/MyPage">마이페이지</a></li>
    </ul>
  </div>
  <script src="../resources/JS/main.js"></script>
</body>
</html>
