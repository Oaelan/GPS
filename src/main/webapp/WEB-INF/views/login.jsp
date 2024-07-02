<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="../resources/CSS/login.css?ver=12">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">

		<div class="content">
			<div class="login">
				<form action="">
					<input type="text" placeholder="아이디" class="id">
					<input type="text" placeholder="비밀번호" class="pw">
					<input type="submit" value="로그인" class="loginBtn">
				</form>
			</div>
		</div>
	</div>

</body>
</html>
