<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>간호사 회원가입</title>
<link rel="stylesheet" href="../resources/CSS/signNurse.css?ver=74">
<link rel="stylesheet" href="../resources/CSS/web.css">
<style type="text/css">
.content {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	width: 100vw;
	height: 850px;
	gap:30px;
}

.sign {
	display: flex;
	align-items: center; /* 가로 정렬 */
	justify-content: flex-start; /* 세로 정렬 */
	flex-direction: column;
	width: 400px;
	height: 650px;
	border-radius: 10px;
	border: 1px solid lightgray;
	position: relative;
}

.id, .pw, .name, .pwcheck, .phone, .s_team {
	width: 300px;
	height: 40px;
	border-radius: 5px;
	border: 1px solid lightgray;
	margin-top: 20px;
	color: gray;
}

.id {
	margin-top: 40px;
}

.id, .pw, .pwcheck, .name, .phone {
	padding-left: 5px;
}

.id, .pw, .pwcheck, .name, .phone, .s_team:focus {
	outline: none;
}

.signBtn {
	width: 300px;
	height: 40px;
	border-radius: 5px;
	background-color: #4CAF50;
	border: none;
	color: white;
	margin-top: 40px;
}

label {
	font-size: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="content">
			<a href="sign" style="text-decoration: none; font-weight: bold; color: black;">>>일반 사용자 회원가입</a>
			<div class="sign">
				<form action="putSignNurse" method="POST">
					<table>
						<tr>
							<td><input type="text" name="id" placeholder="아이디" class="id"></td>
						</tr>
						<tr>
							<td><label id="idLabel"></label></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><input type="password" name="pw" placeholder="비밀번호" class="pw"></td>
						</tr>
						<tr>
							<td><label id="pwLabel"></label></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><input type="password" name="pwcheck" placeholder="비밀번호 확인" class="pwcheck"></td>
						</tr>
						<tr>
							<td><label id="confirmLabel"></label></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><input type="text" name="name" placeholder="이름" class="name"></td>
						</tr>
						<tr>
							<td><label id="nameLabel"></label></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><input type="text" name="phone" placeholder="전화번호" class="phone"></td>
						</tr>
						<tr>
							<td><label id="phoneLabel"></label></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><select class="s_team" name="s_team">
									<option value="" disabled selected>진료과</option>
									<option>진료1팀</option>
									<option>진료2팀</option>
									<option>진료3팀</option>
									<option>수술팀</option>
							</select></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><input type="submit" class="signBtn" value="회원가입"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../resources/JS/sign.js?ver=1874"></script>
</body>
</html>
