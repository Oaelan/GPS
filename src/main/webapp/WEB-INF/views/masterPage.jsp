<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
			<div id="acceptList">
				<!-- 회원가입 신청한 간호사 목록 띄우기 -->
				<c:forEach var="acceptList" items="${acceptList}">
					<div>${acceptList.id}${acceptList.name} ${acceptList.s_team}</div>
					<div>
						<input type="button" value="수락" onclick="handleAccept('${acceptList.id}', 'accept')">
						<input type="button" value="거절" onclick="handleAccept('${acceptList.id}', 'reject')">
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script>
	function handleAccept(id, action) {
		
		var data = {
				id: id,
				action: action
            };
	    fetch('/updateStatus', {
	      method: 'POST',
	      headers: {
	        'Content-Type': 'application/json'
	      },
	      body: JSON.stringify(data)
	    })
	    .then(response => response.text())
	    .then(data => {
	      alert(String(data));
	      location.reload(); // 작업 후 페이지 새로 고침
	    })
	    .catch(error => console.error('Error:', error));
	  }
	</script>
</body>
</html>
