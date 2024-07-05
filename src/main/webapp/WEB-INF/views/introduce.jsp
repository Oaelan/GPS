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
<link rel="stylesheet" href="../resources/CSS/web.css">
<style>
.content {
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		width: 100%;
		height: 700px;
	}
	.text {
		color: gray;
		font-size: 13px;
		text-align: center;
		display: flex;
		align-items: flex-start;
		justify-content: center;
	}
	.map {
		display: flex;
		align-items: center;
		justify-content: center;
		border: 1px solid lightgray;
		width: 300px;
		height: 300px;
		position: relative;
		top: 50px;
		text-align: center;
	}
</style>
</head>
<body>
  <div class="container">
  <jsp:include page="header.jsp"></jsp:include>
    <!-- <div class="StateBar">
    	
    	<img src="../resources/IMG/wifi.png" class="wifi">
    	<img src="../resources/IMG/battery.png" class="battery">
    	<div class="time">12:00</div>
    	
    </div>
    <div class="Menu">
    	<img src="../resources/IMG/menu_bar.png" class="menuBar" onclick="toggleMenu()">
    	<div class="title">Green Hospital
    	</div>
    	<img src="../IMG/user2.png" class="user" onclick="openUserMenu()">
    	
    </div> -->
    <div class="content">
    	<div class="text">
    		<h2>안녕하세요 그린병원입니다.</h2>
    	</div>
    </div>
  </div>
<!--    <div id="slideMenu" class="slide-menu">
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
  <script src="../resources/JS/main.js"></script> -->
</body>
</html>
