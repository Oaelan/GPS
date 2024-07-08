<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>병원 내 길찾기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f468622924673dc01ef6bebbdeacc4a2"></script>
<link rel="stylesheet" href="../resources/CSS/main.css">
<link rel="stylesheet" href="../resources/CSS/FindRoute.css?ver=53435345435344">
<link rel="stylesheet" href="../resources/CSS/web.css">
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

.map {
	width: 100%;
	height: 400px;
}

#outShell {
	width: 100%;
	height: 600px;
	display: flex;
	justify-content: center;
	align-items: center;
	display: flex;
	border: 1px solid lightgray;
}

.hospital {
	text-align: center;
	width: 150px;
}
.content {
	margin-top: 120px;
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
            center : new kakao.maps.LatLng(35.5421556, 129.3382397), // 지도의 중심좌표
            level : 1
        // 지도의 확대 레벨
        };
        // 지도 중심 좌표
        var map = new kakao.maps.Map(node, mapOption);

        // 모든 장소 마커 담는 변수
        var allMarker = [];
        // 건물 내용 infoWindow
        var allInfowindow = [];

        // 장소 위치 지정
        var positions = [ {
            name : '본관',
            content : '<div class="hospital">본관</div>',
            latlng : new kakao.maps.LatLng(35.54234,129.3382079)
        }, {
            name : '별관1',
            content : '<div class="hospital">별관1</div>',
            latlng : new kakao.maps.LatLng(35.5420148,129.3385003)
        }, {
            name : '별관2',
            content : '<div class="hospital">별관2</div>',
            latlng : new kakao.maps.LatLng(35.5420714,129.3379235)
        }, {
            name : '별관3',
            content : '<div class="hospital">별관3</div>',
            latlng : new kakao.maps.LatLng(35.542076,129.3376224)
        } ];

        // 장소 마커 생성 및 인포윈도우 등록
        positions.forEach(function(position, index) {
            var marker = new kakao.maps.Marker({
                map : map,
                position : position.latlng
            });
            allMarker.push(marker);
            console.log(allMarker);
            var infowindow = new kakao.maps.InfoWindow({
                content : position.content
            });
            allInfowindow.push(infowindow);
            infowindow.open(map, marker);
            /*var infowindowOpened = true;
            kakao.maps.event.addListener(marker, 'click', function() {
                if (infowindowOpened) {
                    infowindow.close();
                    infowindowOpened = false;
                } else {
                    infowindow.open(map, marker);
                    infowindowOpened = true;
                }
            }); */

        });
    </script>
</body>
</html>
