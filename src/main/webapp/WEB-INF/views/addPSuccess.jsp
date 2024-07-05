<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main</title>
<link rel="stylesheet" href="../resources/CSS/main.css?ver=3546">
<link rel="stylesheet" href="../resources/CSS/web.css">
<style type="text/css">
	.content {
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		width: 100vw;
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
	.login {
		display: flex;
		align-items: flex-start;
		justify-content: center;
		flex-direction: row;
		margin-top: 100px;
		gap: 20px;
	}
	.login input {
		width: 100px;
		height: 30px;
		background-color: #4CAF50;
		border: none;
		color: white;
	}
</style>
</head>
<body>
  <div class="container">
  <jsp:include page="header.jsp"></jsp:include>
    <div class="content">
    	<div>입원환자 등록을 완료하였습니다.</div>
    </div>
  </div>
</body>
</html>
