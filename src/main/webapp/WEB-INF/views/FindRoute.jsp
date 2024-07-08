<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>병원 내 길찾기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f468622924673dc01ef6bebbdeacc4a2"></script>
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

.controls {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 30px;
	margin-top: 60px;
}

.controls input[type=button] {
	width: 70px;
	height: 70px;
	font-size: 30px;
	text-align: center;
}

#mapshell {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100%;
	position: relative;
}

#map {
	width: 100%;
	height: 100%;
}

#outShell {
	width: 100%;
	height: 600px;
	display: flex;
	justify-content: center;
	align-items: center;
	display: flex;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="content">
			<div class="map">
				<div id="outShell">
					<div id="mapshell">
						<div id="map"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
        //지도를 감싸는 div
        var node = document.getElementById('map');
        // 지도를 나타내는 변수      
        mapOption = { 
                center: new kakao.maps.LatLng(35.5421556, 129.3382397), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
        // 지도 중심 좌표
        var map = new kakao.maps.Map(node, mapOption); 
    </script>
</body>
</html>
