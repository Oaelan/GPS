<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>환자 로그인</title>
<link rel="stylesheet" href="../resources/CSS/main.css">
<link rel="stylesheet" href="../resources/CSS/loginSuccess.css">
<style type="text/css">
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
    <div class="StateBar">
    	<img src="../resources/IMG/wifi.png" class="wifi">
    	<img src="../resources/IMG/battery.png" class="battery">
    	<div class="time">12:00</div>
    	
    </div>
    <div class="Menu">
    	<img src="../resources/IMG/menu_bar.png" class="menuBar" onclick="toggleMenu()">
    	<div class="title">Green Hospital</div>
    	<img src="../resources/IMG/user2.png" class="user" onclick="openUserMenu()">
    </div>
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
				<div id="outShell">
					<div id="mapshell">
   					 
        				<div id="map"></div>
   					
					</div>
				</div>											
    		</div>
    	
			<div class="controls">
				<input type="button" value="↑" onclick="moveMap('up')">
				<input type="button" value="↓" onclick="moveMap('down')">
				<input type="button" value="←" onclick="moveMap('left')">
				<input type="button" value="→" onclick="moveMap('right')">
			</div>
    </div>
  </div>
   <div id="slideMenu" class="slide-menu">
      <a href="#" class="closebtn" onclick="closeMenu()">&times;</a>
		<ul>
			<li><a href="ComingRoute.jsp">오시는 길</a></li>
			<li><a href="FindRoute.jsp">병원 내 길찾기</a></li>
			<li><a href="introduce.jsp">병원소개</a></li>
		</ul>
	</div>
	<div id="userMenu" class="user-menu">
    <a href="#" class="closebtn" onclick="closeUserMenu()">&times;</a>
    <ul>
      <li><a href="#">로그아웃</a></li>
      <li><a href="#">마이페이지</a></li>
    </ul>
  </div>
  <script src="../resources/JS/main.js"></script>
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f468622924673dc01ef6bebbdeacc4a2"></script>
    <script>
    	// 병원 내 길찾기 지도
        //var domain = 'https://i1.daumcdn.net';
        var path = '../resources/IMG/';

        function getTileImage(x, y) {
            var imageMap = {
                '0_0': '1.png',
                '1_0': '2.png',
                '0_1': '3.png',
                '1_1': '4.png'
            };
            return path + imageMap[x + '_' + y];
        }
        
        
        // 화면 너비에 따라 타일 크기 결정
        function getTileSize() {
            var screenWidth = window.innerWidth ||
                              document.documentElement.clientWidth ||
                              document.body.clientWidth;
            return (screenWidth > 768) ? 300 : 300; // 필요한 경우 조정
        }

        var tileSize = getTileSize();

        var plan = function(x, y, z) {
            y = -y - 1; // y 좌표 변환

            // z 레벨 1일 때 타일 범위 제한 (0,0), (1,0), (0,1), (1,1)
            if (z === 1 && x >= 0 && x <= 1 && y >= 0 && y <= 1) {
                return getTileImage(x, y);
            } else {
                return 'https://i1.daumcdn.net/dmaps/apis/white.png';
            }
        };

        // 동적으로 결정된 타일 크기를 사용하여 커스텀 타일셋 정의
        kakao.maps.Tileset.add('PLAN', new kakao.maps.Tileset(tileSize, tileSize, plan,
                '', false, 1, 1));

        var node = document.getElementById('map');
        var map = new kakao.maps.Map(node, {
            projectionId: null,
            mapTypeId: kakao.maps.MapTypeId.PLAN,
            $scale: false,
            center: new kakao.maps.Coords(650, -650),
            level: 1
        });

        var center = map.getCenter();
        var marker = new kakao.maps.Marker({
            position:  new kakao.maps.Coords(400, -1000)
        });
        marker.setMap(map);
		/* 
		 var infowindow = new kakao.maps.InfoWindow({
            content: '병원내 현재 나의 위치'
        });
         */
        
        
        function moveMap(direction) {
            var latlng = marker.getPosition();
            var moveLatLon;

            switch (direction) {
                case 'up':
                    moveLatLon = new kakao.maps.LatLng(latlng.getLat() + 0.0003, latlng.getLng());
                    break;
                case 'down':
                    moveLatLon = new kakao.maps.LatLng(latlng.getLat() - 0.0003, latlng.getLng());
                    break;
                case 'left':
                    moveLatLon = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng() - 0.0003);
                    break;
                case 'right':
                    moveLatLon = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng() + 0.0003);
                    break;
            }

           /*  map.setCenter(moveLatLon); */
            marker.setPosition(moveLatLon);
          	
            /* infowindow.open(map, marker); */
        }
    </script>
</body>
</html>
