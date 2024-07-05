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


#moveBtn {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
	margin: 20px 0;
}

#moveBtn input[type=button] {
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s, transform 0.3s;
}

#moveBtn input[type=button]:hover {
	background-color: #45a049;
	transform: scale(1.05);
}

#moveBtn input[type=button]:active {
	background-color: #3e8e41;
	transform: scale(1);
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="content">
			<div id = "moveBtn">
			</div>
			
			<div class="map">
				<div id="outShell">
					<div id="mapshell">
						<div id="map"></div>
					</div>
				</div>
			</div>
			
			<div class="controls">
				<div id = "result"></div><br>
				<div id = "result2"></div><br>
<!-- 				<input type="button" value="↑" onclick="moveMap('up')"> <input type="button" value="↓" onclick="moveMap('down')"> <input type="button" value="←" onclick="moveMap('left')"> <input type="button" value="→" onclick="moveMap('right')"> -->
			</div>
		</div>
	</div>
	<div id="clickLatlng"></div>
	<script src="../resources/JS/main.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f468622924673dc01ef6bebbdeacc4a2"></script>
	<script>

    // 현재 위치의 위도와 경도를 담는 변수
    var lat;
    var lon;
    var MainmarkerPosition;
//     var newCenter;  
    var options = {
    		enableHighAccuracy: true,
    		timeout: 2000,
    		maximumAge:0
    };

    
    var node = document.getElementById('map');
    
    var map = new kakao.maps.Map(node, {
        center: new kakao.maps.LatLng(35.5421556,129.3382397),     
        level: 1
    });
    var center = map.getCenter();
    
    var Mainmarker = new kakao.maps.Marker({
		map: map,
		position: map.getCenter()
	});
    
    if (navigator.geolocation) {
		id = navigator.geolocation.watchPosition(success);
	} else {
		var locPosition = new kakao.maps.LatLng(lat, lon);
		console.log("불가")
		map.setCenter(locPosition);
		Mainmarker.setPosition(locPosition);
	}
    
    
    function success(position) {
    	
		var lat = position.coords.latitude; // 위도 
		var lon = position.coords.longitude; // 경도
		
		var data = {
                x: lat,
                y: lon
            };
		
		// 서버로 위치 데이터 전송
	    fetch('/sendLatLon', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: JSON.stringify(data)
	    })
	    .then(response => {
	        if (!response.ok) {
	            throw new Error('Network response was not ok');
	        }                     
	    })
	    .then(data => {
	        console.log('Success:', data);

	        // 서버에서 위치 데이터 받아오기
	        fetch('/u_position')
	        .then(response => {
	            if (!response.ok) {
	                throw new Error('Network response was not ok');
	            }
	            return response.json();
	        })
	        .then(data => {
	            console.log('Data received:', data);
	            
	            // 카카오 맵 마커 위치 설정
	            
	            MainmarkerPosition = new kakao.maps.LatLng(data.x, data.y);
// 	            newCenter = new kakao.maps.LatLng(data.x, data.y);
// 	            map.setCenter(newCenter);

	            if (!Mainmarker) {
	                Mainmarker = new kakao.maps.Marker({
	                    position: MainmarkerPosition
	                });
	                Mainmarker.setMap(map);
	            } else {
	                Mainmarker.setPosition(MainmarkerPosition);
	            }
	        })
	        .catch(error => {
	            console.error('Error:', error);
	        });
	    })
	    .catch(error => {
	        console.error('Error:', error);
	    });
		
		options;
		
		// 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
		var resultDiv = document.getElementById('result');
		resultDiv.innerHTML = "위도: " + lat + "<br>";
		resultDiv.innerHTML += "경도: " + lon;
	}

	
	
	
	
	
	function panTo(lat, lon) {
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(lat, lon);
	    
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);            
	} 
		
	
	
		// 장소 위치 지정
		var positions = [
		    {
		    	name: '장소1',
		        content: '<div>장소1</div>', 
		        latlng: new kakao.maps.LatLng(35.5423652, 129.338211)
		    },
		    {
		    	name: '장소2',
		        content: '<div>장소2</div>', 
		        latlng: new kakao.maps.LatLng(35.542333, 129.3379557)
		    },
		    {
		    	name: '장소3',
		        content: '<div>장소3</div>', 
		        latlng: new kakao.maps.LatLng(35.5421725, 129.3379185)
		    },
		    {
		    	name: '장소4',
		        content: '<div>장소4</div>',
		        latlng: new kakao.maps.LatLng(35.5421649, 129.3376515)
		    }
		];
		
	
		
		
		
		var allInfowindow = [];
		var allMarker = [];
		
		// 장소 마커 생성 및 인포윈도우 등록
		positions.forEach(function (position, index) {
			var marker = new kakao.maps.Marker({
				map: map,
				position: position.latlng
			});
			allMarker.push(marker);
			
			var infowindow = new kakao.maps.InfoWindow({
				content: position.content
			});
			allInfowindow.push(infowindow);
			
			var infowindowOpened = false;
			kakao.maps.event.addListener(marker, 'click', function () {
				if (infowindowOpened) {
					infowindow.close();
					infowindowOpened = false;
				} else {
					infowindow.open(map, marker);
					infowindowOpened = true;
				}
			});

			var button = document.createElement('input');
			button.type = 'button';
			button.value = position.name;
			button.style = 
			button.onclick = function () {
				allInfowindow.forEach(function (iw) {
					iw.close();
				});
				// 해당 인포윈도우를 엽니다
				infowindow.open(map, marker);
				// 지도를 해당 위치로 이동시킵니다
				map.panTo(position.latlng);
			};
		
			document.getElementById('moveBtn').appendChild(button);
		});
		
		
		
		

		

	</script>
	
</body>
</html>
