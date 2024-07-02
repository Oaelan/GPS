<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>입원 환자 등록</title>
<link rel="stylesheet" href="../resources/CSS/patientADD.css?ver=451">
</head>
<body>
  <div class="container">
  	<jsp:include page="header.jsp"></jsp:include>
    <div class="content">
			<div class="add">
				<table>
					<tr>
						<td><input type="text" name="p_no" placeholder="입원번호"
							class="p_no"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td><input type="text" name="p_name" placeholder="환자 성명"
							class="p_name"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td><input type="text" name="p_gender" placeholder="환자 성별"
							class="p_gender"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td><input type="text" name="p_id" placeholder="환자 주민등록번호"
							class="p_id"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td><input type="text" name="p_phone" placeholder="환자 연락처"
							class="p_phone"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td><input type="text" name="p_subPhone"
							placeholder="보호자 연락처" class="p_subPhone"></td>
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
						<td>
							<form action="">
								<input type="submit" class="addBtn" value="등록">
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
  </div>
</body>
</html>
