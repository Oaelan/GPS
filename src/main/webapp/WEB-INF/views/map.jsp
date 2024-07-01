<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>커스텀 타일셋1</title>
<style type="text/css">
</style>
</head>
<body>
    <div id="map" style="width: 100%; height: 800px;"></div>
    
    <div class="controls">
    <input type="button" value="↑" onclick="moveMap('up')">
    <input type="button" value="↓" onclick="moveMap('down')">
    <input type="button" value="←" onclick="moveMap('left')">
    <input type="button" value="→" onclick="moveMap('right')">
</div>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f468622924673dc01ef6bebbdeacc4a2"></script>
    <script>
        //var domain = 'https://i1.daumcdn.net';
        var path = '../resources/img/';

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
            center: new kakao.maps.Coords(600, -800),
            level: 1
        });

        var center = map.getCenter();
        var marker = new kakao.maps.Marker({
            position:  new kakao.maps.Coords(400, -1000)
        });
        marker.setMap(map);

        var infowindow = new kakao.maps.InfoWindow({
            content: '병원내 현재 나의 위치'
        });
        infowindow.open(map, marker);
        
        
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
        }
    </script>
</body>
</html>
