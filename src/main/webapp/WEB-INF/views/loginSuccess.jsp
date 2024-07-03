<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<jsp:include page="header.jsp"></jsp:include>
		<div class="content">
			<div class="dropdown">
				<select id="floorSelect" onchange="selectFloor()">
					<option value="1" class="floor">1층</option>
					<option value="2" class="floor">2층</option>
					<option value="3" class="floor">3층</option>
					<option value="4" class="floor">4층</option>
				</select>
			</div>
			<div class="map">
				<div id="outShell">
					<div id="mapshell">
						<div id="map"></div>
					</div>
				</div>
			</div>
			<div class="controls">
				<input type="button" value="↑" onclick="moveMap('up')"> <input type="button" value="↓" onclick="moveMap('down')"> <input type="button" value="←" onclick="moveMap('left')"> <input type="button" value="→" onclick="moveMap('right')">
			</div>
		</div>
	</div>
	<div id="clickLatlng"></div>
	<script src="../resources/JS/main.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f468622924673dc01ef6bebbdeacc4a2"></script>
	<script>
    var path = '../resources/IMG/';
    var currentFloor = "1";
    
    // 현재 위치의 위도와 경도를 담는 변수
    var lat;
    var lon;

    // 각 층의 이미지를 반환하는 함수
    function getTileImage(x, y) {
        var imageMap = {
            '1': "for P_Map.png",
            '2': "for P_Map2.png",
            '3': "for P_Map3.png",
            '4': "for P_Map4.png"
        };
        return path + imageMap[currentFloor];
    }

    
 	// 클릭 전에는 표시되지 않는 초기 마커를 생성 찾으려는 길 찍는 마커임
    var markerFind = null;

    // 층 선택 시 호출되는 함수
    function selectFloor() {
        var floorSelect = document.getElementById("floorSelect");
        currentFloor = floorSelect.value;
        // 타일셋을 다시 로드하여 새로운 이미지를 반영
        kakao.maps.Tileset.add('PLAN', new kakao.maps.Tileset(tileSize, tileSize, plan, '', false, 1, 1));
        map.setMapTypeId(kakao.maps.MapTypeId.PLAN);

        // 기존의 마커가 있으면 지도에서 제거합니다
        if (markerFind) {
            markerFind.setMap(null);
            markerFind = null; // 기존 마커 초기화
        }
    }

    // 화면 너비에 따라 타일 크기 결정
    function getTileSize() {
        var screenWidth = window.innerWidth ||
                          document.documentElement.clientWidth ||
                          document.body.clientWidth;
        return (screenWidth > 768) ? 600 : 580; // 필요한 경우 조정
    }
    var tileSize = getTileSize();

    // 타일 이미지 반환 함수
    var plan = function(x, y, z) {
        y = -y - 1; // y 좌표 변환
        // z 레벨 1일 때 타일 범위 제한 (0,0), (1,0), (0,1), (1,1)
        if (z === 1 && x >= 0 && x <= 1 && y >= 0 && y <= 1) {
            return getTileImage(x, y);
        } else {
            return path + '4.png';
        }
    };
	
	/*     // 현재 주소를 가져오는 함수 (위치 사용 정보 동의 하에)
    function getLocation() {
        navigator.geolocation.getCurrentPosition(
            position => {
              lat = position.coords.latitude;
              lon = position.coords.longitude;
              initializeMap(lat, lon);
                console.log(lat,lon);
            },
            error => {
                console.error("Error occurred. Error code: " + error.code);
            }
        );
    } */
 
    
    // 동적으로 결정된 타일 크기를 사용하여 커스텀 타일셋 정의
    kakao.maps.Tileset.add('PLAN', new kakao.maps.Tileset(tileSize, tileSize, plan, '', false, 1, 1));
    var node = document.getElementById('map');
    var map = new kakao.maps.Map(node, {
        projectionId: null,
        mapTypeId: kakao.maps.MapTypeId.PLAN,
        $scale: false,
        center: new kakao.maps.LatLng(lat,lon),     
        center: new kakao.maps.Coords(580, -550),
        level: 1
    });
    var center = map.getCenter();
    var marker = new kakao.maps.Marker({
      position:  new kakao.maps.Coords(400, -1000),
    	
    });
    
 	// 클릭 이벤트 핸들러 추가
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) { 
        // 클릭한 위도, 경도 정보를 가져옵니다 
        var latlng = mouseEvent.latLng; 
        
        // 기존의 마커가 있으면 지도에서 제거합니다
        if (markerFind) {
            markerFind.setMap(null);
        }
        
        // 새로운 마커를 생성합니다
        var imageSrc = path + "greenM.png"; // 마커이미지의 주소입니다    
        var imageSize = new kakao.maps.Size(64, 69); // 마커이미지의 크기입니다
        var imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
        
        markerFind = new kakao.maps.Marker({
            position: latlng,
            map: map,
            image: markerImage
        });
        
        var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
        message += '경도는 ' + latlng.getLng() + ' 입니다';
        
        console.log(message)       
    }); 
       
    
    // 지도 이동 함수
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
        marker.setPosition(moveLatLon);
    }

    
    
    // 지도 드래그 비활성화
    map.setDraggable(false); 
  
	// 지도에 마커 표시하는거 	
    marker.setMap(map);
    // 찾을 진료실을 찍는 마커
    markerFind.setMap(map);
     
    </script>
</body>
</html>
