<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="../resources/CSS/sign.css?ver=144">
</head>
<body>
  <div class="container">
  <jsp:include page="header.jsp"></jsp:include>
    <div class="content">
    	<div class="sign">
    		<table>
    			<tr>
    				<td><input type="text" name="id" placeholder=" 아이디" class="id"></td>
    			</tr>
    		</table>
    		<table>
    			<tr>
    				<td><input type="password" name="pw" placeholder=" 비밀번호" class="pw"></td>
    			</tr>
    		</table>
    		<table>
    			<tr>
    				<td><input type="text" name="name" placeholder=" 이름" class="name"></td>
    			</tr>
    		</table>
    		<table>
    			<tr>
    				<td><input type="text" name="phone" placeholder=" 전화번호" class="phone"></td>
    			</tr>
    		</table>
    		<table>
    			<tr>
    				<td>
    				<form action="">
    				<input type="submit" class="signBtn" value="회원가입">
    				</form>
    				</td>
    			</tr>
    		</table>
    	</div>
    </div>
  </div>
</body>
</html>
