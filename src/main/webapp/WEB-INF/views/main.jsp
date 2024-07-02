<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main</title>
<link rel="stylesheet" href="../resources/CSS/main.css?ver=1">
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
    	<img src="../resources/IMG/user.png" class="user" onclick="openUserMenu()">
    	
    </div>
    <div class="content">
    	<div class="text">
    		위치찾기 서비스는 로그인 후 이용 가능합니다.
    	</div>
    	<div class="login">
    		<form action="/login">
    			<input type="submit" value="로그인">
    		</form>
    		<form action="/sign">
    			<input type="submit" value="회원가입">
    		</form>
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
      <li><a href="/login">로그인</a></li>
      <li><a href="/sign">회원가입</a></li>
    </ul>
  </div>
  <script src="../resources/JS/main.js"></script>
</body>
</html>
