<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="../resources/CSS/login.css?ver=12">
<link rel="stylesheet" href="../resources/CSS/web.css">
<style>
	.content {
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		width: 100vw;
		height: 500px;
	}
	.login {
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		border-radius: 10px;
		border: 1px solid lightgray;
		width: 400px;
		height: 400px;
		position: relative;
		top: 150px;
	}
	.id, .pw, .loginBtn {
		width: 300px;
		height: 40px;
		border: 1px solid lightgray;
		border-radius: 5px;
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		padding-left: 5px;
	}
	.id, .pw:focus {
		outline: none;
	}
	.pw, .loginBtn {
		margin-top: 30px;
	}
	.loginBtn {
		text-align: center;
		border: none;
		background-color: #4CAF50;
		color: white;
		position: relative;
		top: 30px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">

		<div class="content">
			<div class="login">
				<form action="login" method = "POST">
					<input type="text" placeholder="아이디" name = "id" class="id">
					<input type="text" placeholder="비밀번호" name = "pw" class="pw">
					<input type="submit" value="로그인" class="loginBtn">
				</form>
			</div>
		</div>
	</div>

</body>
</html>
