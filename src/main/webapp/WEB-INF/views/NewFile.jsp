<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>커스텀 타일셋1</title>
</head>
<body>
	<div id="map" style="width: 100%; height: 500px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f468622924673dc01ef6bebbdeacc4a2"></script>
	<script>
        // 사용자의 현재 위치를 가져오는 함수
        function getUserLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.watchPosition(
                // 위치 가져오기 성공 시 콜백 함수
                function(position) {                                                 
                    var lat = position.coords.latitude; // 위도
                    var lon = position.coords.longitude; // 경도
                    console.log('현재 위치:', lat, lon);
                    var markerPosition = new kakao.maps.LatLng(lat, lon);
                 	// 기존 마커 제거
                    if (marker) {
                        marker.setMap(null);
                    }
                    
                    var marker = new kakao.maps.Marker({
                        position : markerPosition
                    });
                    marker.setMap(map);
                 
                    // 여기에서 가져온 위도(lat)와 경도(lon)을 사용하여 추가적인 작업을 수행할 수 있습니다.
                    // 예를 들어, 지도에 해당 위치를 표시하거나 API를 통해 추가 정보를 요청할 수 있습니다.
                },
                // 위치 가져오기 실패 시 콜백 함수
                function(error) {
                    switch (error.code) {
                    case error.PERMISSION_DENIED:
                        console.error("사용자가 위치 공유를 거부했습니다.");
                        break;
                    case error.POSITION_UNAVAILABLE:
                        console.error("위치 정보를 사용할 수 없습니다.");
                        break;
                    case error.TIMEOUT:
                        console.error("위치 정보를 가져오는 데 시간이 초과되었습니다.");
                        break;
                    case error.UNKNOWN_ERROR:
                        console.error("알 수 없는 오류가 발생했습니다.");
                        break;
                    }
                });
            } else {
                console.error("Geolocation이 지원되지 않습니다.");
            }
        }

        // 함수 호출
        getUserLocation();

       
       
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center : new kakao.maps.LatLng(35.54230, 129.3383), // 지도의 중심좌표
            level : 1
        // 지도의 확대 레벨
        };

        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);
        var center = map.getCenter();

       
       
    </script>
</body>
</html>