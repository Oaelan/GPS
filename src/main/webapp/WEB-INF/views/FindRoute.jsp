<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>병원 내 길찾기</title>
<link rel="stylesheet" href="../resources/CSS/main.css">
<link rel="stylesheet" href="../resources/CSS/FindRoute.css">
<link rel="stylesheet" href="../resources/CSS/web.css">
<style type="text/css">
	/* 드롭다운 컨테이너 */
	.dropdown {
		position: relative;
		display: inline-block;
		font-family: 나눔고딕;
	}

	/* 드롭다운 버튼 */
	.dropbtn {
		background-color: #4CAF50;
		color: white;
		width: 200px;
		height: 40px;
		font-size: 16px;
		border: none;
		cursor: pointer;
		font-family: 나눔고딕;
	}

	/* 드롭다운 내용 (숨김 상태) */
	.dropdown-content {
		display: none;
		position: absolute;
		background-color: #f9f9f9;
		min-width: 160px;
		box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
		z-index: 1;
	}

	/* 드롭다운 링크 스타일 */
	.dropdown-content a {
		color: black;
		padding: 12px 16px;
		text-decoration: none;
		display: block;
	}

	/* 드롭다운 링크에 마우스를 올렸을 때 */
	.dropdown-content a:hover {
		background-color: #f1f1f1;
	}

	/* 드롭다운 버튼에 마우스를 올렸을 때 드롭다운 내용 보이기 */
	.dropdown:hover .dropdown-content {
		display: block;
	}

	/* 드롭다운 버튼에 마우스를 올렸을 때 버튼 스타일 변경 */
	.dropdown:hover .dropbtn {
		background-color: #3e8e41;
	}
		.content {
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		width: 100%;
		height: 700px;
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
</style>
</head>
<body>
  <div class="container">
  <jsp:include page="header.jsp"></jsp:include>
    <div class="content">
			<div class="dropdown">
				<button class="dropbtn" id="dropbtn">층별 안내</button>
				<div class="dropdown-content">
					<a href="#" onclick="selectFloor('1층')">1층</a> 
					<a href="#" onclick="selectFloor('2층')">2층</a>
					<a href="#" onclick="selectFloor('3층')">3층</a>
					<a href="#" onclick="selectFloor('4층')">4층</a>
				</div>
			</div>
			<div class="map">
    		Map
    	</div>
    </div>
  </div>
</body>
</html>
