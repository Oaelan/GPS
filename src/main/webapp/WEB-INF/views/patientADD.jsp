<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>입원 환자 등록</title>
<link rel="stylesheet" href="../resources/CSS/patientADD.css?ver=17">
<link rel="stylesheet" href="../resources/CSS/web.css">
<style type="text/css">
	.content {
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		width: 100vw;
		height: 800px;
	}
	.add {
		display: flex;
		align-items: center; /* 가로 정렬 */
		justify-content: flex-start; /* 세로 정렬 */
		flex-direction: column;
		width: 400px;
		height: 900px;
		border-radius: 10px;
		border: 1px solid lightgray;
		position: relative;
		top: 50px;
	}
	.p_no, .p_name, .p_gender, .p_id, .p_phone, .p_subPhone, .p_room, .s_id
		{
		width: 300px;
		height: 40px;
		border-radius: 5px;
		border: 1px solid lightgray;
		margin-top: 40px;
		color: gray;
	}
	.p_no, .p_name, .p_gender, .p_id, .p_phone, .p_subPhone, .p_room, .s_id
		{
		padding-left: 5px;
	}
	.p_no, .p_name, .p_gender, .p_id, .p_phone, .p_subPhone, .p_room, .s_id:focus
		{
		outline: none;
	}
	.addBtn {
		width: 300px;
		height: 40px;
		border-radius: 5px;
		background-color: #4CAF50;
		border: none;
		color: white;
		margin-top: 40px;
	}
	label {
		font-size: 13px;
	}
	.p_name, .p_phone, .p_subPhone, .p_room {
		margin-top: 20px;
	}
	.p_name {
		margin-bottom: 30px;
	}
	#gender>td {
		color: gray;
		font-size: 14px;
	}
	/* #gender > td: 첫 번째 td 요소에 대한 스타일 적용 */
	#gender>td {
		padding-right: 50px; /* 첫 번째 td 요소의 오른쪽 여백 */
	}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="content">
			<div class="add">
				<form action="">
					<table>
						<tr>
							<td><input type="text" name="p_no" placeholder="입원번호"
								class="p_no"></td>
						</tr>
						<tr>
							<td><label id="p_noLabel"></label></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><input type="text" name="p_name" placeholder="환자 성명"
								class="p_name"></td>
						</tr>
					</table>
					<table>
						<tr id="gender">
							<td>환자 성별</td>
							<td><input type="radio" value="m" name="gender">남</td>
							<td><input type="radio" value="f" name="gender">여</td>
						</tr>
					</table>
					<table>
						<tr>
							<td><input type="text" name="p_id" placeholder="환자 주민등록번호"
								class="p_id"></td>
						</tr>
						<tr>
							<td><label id="p_idLabel"></label></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><input type="text" name="p_phone" placeholder="환자 연락처"
								class="p_phone"></td>
						</tr>
						<tr>
							<td><label id="p_phoneLabel"></label></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><input type="text" name="p_subPhone"
								placeholder="보호자 연락처" class="p_subPhone"></td>
						</tr>
						<tr>
							<td><label id="p_subPhoneLabel"></label></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><input type="text" name="p_room" placeholder="병실"
								class="p_room"></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><input type="text" name="s_id" placeholder="담당 간호사"
								class="s_id"></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><input type="submit" class="addBtn" value="등록">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../resources/JS/patientADD.js"></script>
</body>
</html>
