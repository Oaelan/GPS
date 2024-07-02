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
  <jsp:include page="header.jsp"></jsp:include>
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
</body>
</html>
