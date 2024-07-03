<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>간호사 로그인</title>
<link rel="stylesheet" href="../resources/CSS/main.css">
<link rel="stylesheet" href="../resources/CSS/loginSuccessNurse.css">
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

#patientList {
	border: 1px solid black;
	width: 100%;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	width: 95%;
}

.patient {
	text-align: center;
	padding: 10px;
	border-bottom: 1px solid #ccc;
	border-right: 1px solid #ccc;
	cursor: pointer; /* 클릭 가능한 요소로 설정 */
}

.patient:nth-child(4n) {
	border-right: none;
}

.patient.clicked {
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="content">
			<div id="patientList"></div>
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
		</div>
	</div>
	<div id="clickLatlng"></div>
	<script src="../resources/JS/main.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f468622924673dc01ef6bebbdeacc4a2"></script>
	<script>
	 // 화면 로드 후 실행될 함수
    document.addEventListener('DOMContentLoaded', function() {
        fetchPatients(); // 환자 리스트 가져오기 함수 호출
        initializePnameClick(); // 층 선택 후 담당 환자 위치 가져옴
    });
	
    var path = '../resources/IMG/';
    var currentFloor = "1";
    
    // 현재 위치의 위도와 경도를 담는 변수
    var lat;
    var lon;

    // 클릭 전에는 표시되지 않는 초기 마커를 생성 찾으려는 길 찍는 마커임
    var markerPgps = null;
    var markerFind = null;
    var markerPgpsByFloor = null;
    
    // 셀렉트 박스에서 값을 선택 했을 때 선택되어 있는 환자 선택 해제 그리고 해당 층에 있는 모든 담당 환자 마커 표시 하게
   function initializePnameClick(){
    document.getElementById('floorSelect').addEventListener('change', () => {       
        // 모든 환자 이름 요소에서 clicked 클래스 제거(선택한 환자 선택해제 하는거임)
        document.querySelectorAll('.patient').forEach(p => {
            p.classList.remove('clicked');
       		 }); 
        // 해당 층의 환자 위치 정보 들어 오기
       fetch('/nurse/getPatientGpsByFloor?z=' + currentFloor, {
   			 headers: {
       		 'Accept': 'application/json'
    		}
		})

        .then(response => response.json())
        .then(patientsByFloor => {
            // 기존의 마커가 있으면 지도에서 제거
            if (markerPgpsByFloor) {
                markerPgpsByFloor.setMap(null);
                if(markerPgps){
                    markerPgps.setMap(null);
                }
            }

            // 가져온 환자들의 위치에 마커를 표시
            patientsByFloor.forEach(patient => {
                var imageSrcForPByFloor = path + "redM.png"; // 환자 마커 이미지 주소
                var imageSizeForPByFloor = new kakao.maps.Size(64, 69); // 마커 이미지 크기
                var imageOptionForPByFloor = { offset: new kakao.maps.Point(27, 69) }; // 마커 이미지 옵션
                var markerImageForPByFloor = new kakao.maps.MarkerImage(imageSrcForPByFloor, imageSizeForPByFloor, imageOptionForPByFloor); 

                markerPgpsByFloor = new kakao.maps.Marker({
                    position: new kakao.maps.LatLng(patient.x, patient.y), // 환자 위치 좌표
                    map: map,
                    image: markerImageForPByFloor
                });
            });
        })
        .catch(error => console.error('Error fetching patients by floor:', error));
        
        
	})};

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

   

    // 층 선택 시 호출되는 함수
    function selectFloor() {
        var floorSelect = document.getElementById("floorSelect");
        currentFloor = floorSelect.value;
        // 타일셋을 다시 로드하여 새로운 이미지를 반영
        kakao.maps.Tileset.add('PLAN', new kakao.maps.Tileset(tileSize, tileSize, plan, '', false, 1, 1));
        map.setMapTypeId(kakao.maps.MapTypeId.PLAN);
	  
        // 기존의 마커가 있으면 지도에서 제거합니다
        if (markerPgps) {
            markerPgps.setMap(null);
            markerPgps = null; // 기존 마커 초기화
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
    
    // 동적으로 결정된 타일 크기를 사용하여 커스텀 타일셋 정의
    kakao.maps.Tileset.add('PLAN', new kakao.maps.Tileset(tileSize, tileSize, plan, '', false, 1, 1));
    var node = document.getElementById('map');
    var map = new kakao.maps.Map(node, {
        projectionId: null,
        mapTypeId: kakao.maps.MapTypeId.PLAN,
        $scale: false,
        center: new kakao.maps.LatLng(lat, lon),
        center: new kakao.maps.Coords(580, -550),
        level: 1
    });
    var center = map.getCenter();
    var marker = new kakao.maps.Marker({
        position: new kakao.maps.Coords(400, -1000),
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
        var imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
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
    
    // 지도 드래그 비활성화
    map.setDraggable(false); 

    // 지도에 마커 표시하는거
    marker.setMap(map);

   

    // 환자 리스트를 가져오는 함수
    function fetchPatients() {
        fetch('/nurse/getPList', {
            headers: {
                'Accept': 'application/json'
            }
        })
        .then(response => response.json())
        .then(data => {
            // 받은 데이터를 처리하여 화면에 표시
            var patientList = document.getElementById("patientList");
            patientList.innerHTML = ''; // 기존 리스트 초기화

            data.forEach(patient => {
                // 환자 이름을 추가할 div
                var pName = document.createElement('div');
                
                pName.classList.add('patient');
                pName.innerText = patient.p_name;
                patientList.appendChild(pName);

                // 환자 이름 클릭시 색깔 바뀜 및 p_no을 컨트롤러로 전달
                // 클릭 이벤트 리스너 추가
                pName.addEventListener('click', function() {
                    // 모든 .patient 요소에서 clicked 클래스를 제거합니다
                    document.querySelectorAll('.patient').forEach(function(p) {
                        p.classList.remove('clicked');
                    });

                    // 클릭된 요소에만 clicked 클래스를 추가
                    this.classList.add('clicked');

                    // 선택된 환자의 p_no을 콘솔에 출력합니다
                    var selectedPNo = patient.p_no;
                    //console.log('Selected Patient p_no:', selectedPNo);

                    // 환자 p_no을 사용하여 추가 데이터를 가져오기 위한 fetch 요청
                    // get 방식으로 처리 쿼리문으로 값 보내줌
                    fetch('/nurse/getPatientGps?p_no=' + selectedPNo, {
                        headers: {
                            'Accept': 'application/json'
                        }
                    })
                    .then(response => response.json())
                    .then(P_GPS => {
                        // 가져온 환자 세부 정보를 처리하는 로직 추가
                        //console.log('P_GPS', P_GPS);
                        
                        // P_GPS.z 값에 따라 select 박스 업데이트(z는 층을 나타냄)
                        var floorSelect = document.getElementById("floorSelect");
                        floorSelect.value = P_GPS.z;
                        currentFloor = floorSelect.value;
                        
                        // 층 변경 시 지도를 업데이트
                        selectFloor();

                        // 기존의 마커가 있으면 지도에서 제거합니다
                        if (markerPgps) {
                            markerPgps.setMap(null);
                            if(markerPgpsByFloor){
                                markerPgpsByFloor.setMap(null);
                            }
                        }
						console.log(P_GPS.x, P_GPS.y)
                        // 새로운 마커를 생성합니다
                        var imageSrcForP= path + "redM.png"; // 마커이미지의 주소입니다    
                        var imageSizeForP = new kakao.maps.Size(64, 69); // 마커이미지의 크기입니다
                        var imageOptionForP = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
                        var markerImageForP = new kakao.maps.MarkerImage(imageSrcForP, imageSizeForP, imageOptionForP); 
                        
                        markerPgps = new kakao.maps.Marker({
                            position: new kakao.maps.LatLng(P_GPS.x, P_GPS.y),
                            map: map,
                            image: markerImageForP
                        });
                        
                        markerPgps.setMap(map);
                        
                    })
                    .catch(error => console.error('Error fetching patient details:', error));
                });
            });
        })
        .catch(error => console.error('Error fetching patients:', error));
    }
</script>
</body>
</html>
