<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>간호사 로그인</title>
<link rel="stylesheet" href="../resources/CSS/main.css">
<link rel="stylesheet" href="../resources/CSS/loginSuccessNurse.css?ver=4	">
</head>
<body>
  <div class="container">
  <jsp:include page="header.jsp"></jsp:include>
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
</body>
</html>
