<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="../resources/CSS/sign.css?ver=1">
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
    	<div class="sign">
    		<table>
    			<tr>
    				<td><input type="text" name="id" placeholder=" 아이디" class="id"></td>
    			</tr>
    		</table>
    		<table>
    			<tr>
    				<td><input type="password" name="pw" placeholder=" 비밀번호" class="pw"></td>
    			</tr>
    		</table>
    		<table>
    			<tr>
    				<td><input type="text" name="name" placeholder=" 이름" class="name"></td>
    			</tr>
    		</table>
    		<table>
    			<tr>
    				<td><input type="text" name="phone" placeholder=" 전화번호" class="phone"></td>
    			</tr>
    		</table>
    		<table>
    			<tr>
    				<td>
    				<form action="">
    				<input type="submit" class="signBtn" value="회원가입">
    				</form>
    				</td>
    			</tr>
    		</table>
    	</div>
    </div>
  </div>
   <div id="slideMenu" class="slide-menu">
      <a href="#" class="closebtn" onclick="closeMenu()">&times;</a>
		<ul>
			<li><a href="ComingRoute.jsp">오시는 길</a></li>
			<li><a href="FindRoute.jsp">병원 내 길찾기</a></li>
			<li><a href="introduce.jsp">병원소개</a></li>
		</ul>
	</div>
	<div id="userMenu" class="user-menu">
    <a href="#" class="closebtn" onclick="closeUserMenu()">&times;</a>
    <ul>
      <li><a href="#">로그인</a></li>
      <li><a href="#">회원가입</a></li>
    </ul>
  </div>
  <script src="../resources/JS/main.js"></script>
</body>
</html>
