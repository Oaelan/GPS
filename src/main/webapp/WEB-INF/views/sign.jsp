<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="../resources/CSS/sign.css?ver=44">
</head>
<body>
  <div class="container">
  <jsp:include page="header.jsp"></jsp:include>
    <div class="content">
    	<div class="sign">
    		<form action="">
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
    				<td>
    				<input type="submit" class="signBtn" value="회원가입">
    				</td>
    			</tr>
    		</table>
    		</form>
    	</div>
    </div>
  </div>
  <script type="text/javascript" src="../resources/JS/sign.js?ver=1"></script>
</body>
</html>
