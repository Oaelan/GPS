<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../resources/CSS/loginSuccessNurse.css?ver=12454">
<link rel="stylesheet" href="../resources/CSS/web.css">
<title>간호사 로그인</title>
<style>
#patientList {
	border: 1px solid lightgrey;
	width: 100%;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	width: 100%;
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
			<div class="map">
				<div id="outShell">
					<div id="mapshell">
						<div id="map"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../resources/JS/main.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f468622924673dc01ef6bebbdeacc4a2"></script>
	<script>
	 // 화면 로드 후 실행될 함수
    document.addEventListener('DOMContentLoaded', function() {
    	 fetchPatients(); // 환자 리스트 가져오기/ 환자 위치 정보 가져오는  함수 호출 5초마다 실행
        getUserLocation(); // 간호사 현재 위치 마커    
       
        
        
    });
	
	 // 환자 이름을 선택해 가져온 정보를 담는 객체
	let pInfo ={
	 name:"",
	 room:"",
	 phone:"",
	 subPhone:"",
	 x:"",
	 y:"",
	}
   
    var path = "../resources/IMG/";
	 
	//watchId 선언
    var watchId;
  	// 선택한 셀렉트 박스 안의 층수
    var currentFloor = "1";
    	
    // 환자 위치 마커
    var markerPgps = null;
  	//간호사 위치 마커
  	var marker; 
        
 	// 현재 열린 인포윈도우를 저장할 변수
    var currentInfowindow = null;
    
    // 지도를 감싸고 있는 div
    var node = document.getElementById('map');
    // 보이는 지도에 대한 설정
    mapOption = {
            center : new kakao.maps.LatLng(35.54230, 129.3383), // 지도의 중심좌표
            level : 1
        // 지도의 확대 레벨
        };
    
    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var map = new kakao.maps.Map(node,mapOption)      
    var center = map.getCenter();
    var hCenter =  new kakao.maps.LatLng(35.54230, 129.3383);
 	// 새로운 중심 좌표 설정 현재 내위치가 움직일 때 지도도 따라 움직이게 
    var newCenter  
    // 지도 드래그 비활성화
    map.setDraggable(true); 

     
 

 // 사용자의 현재 위치를 가져오는 함수
    function getUserLocation() {
        if (navigator.geolocation) {
            // watchPosition을 사용하여 위치 1초마다 감시
            var options = {
                enableHighAccuracy: true, // 정확도 최대화
                timeout: 6000, // 타임아웃 설정 (5초)
                maximumAge: 0 // 최대 위치 데이터 나이 (0: 항상 최신 위치 사용)
            };

            // watchPosition을 통해 위치를 지속적으로 감시
            var watchId = navigator.geolocation.watchPosition(	
                // 위치 가져오기 성공 시 콜백 함수
                function(position) {
                    var lat = position.coords.latitude; // 위도
                    var lon = position.coords.longitude; // 경도
                    var markerPosition;

                   // console.log('현재 위치:', lat, lon);
                  

                    var data = {
                        x: lat,
                        y: lon
                    };

                    // 서버로 위치 데이터 전송
                    fetch('/nurse/getNurseP', {
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
                       // console.log('Success:', data);

                        // 서버에서 위치 데이터 받아오기
                        fetch('/nurse/position')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(data => {
                            //console.log('Data received:', data);
                            // 내 위치를 찍을 마커 이미지 
                           	var imageSrcForP= path + "redM.png"; // 마커이미지의 주소입니다    
                            var imageSizeForP = new kakao.maps.Size(45, 50); // 마커이미지의 크기입니다
                            var imageOptionForP = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
                            var markerImageForP = new kakao.maps.MarkerImage(imageSrcForP, imageSizeForP, imageOptionForP); 
                            
                            
                            
                            // 카카오 맵 마커 위치 설정
                            markerPosition = new kakao.maps.LatLng(data.x, data.y);
                            	
                            // 마커가 움직일 때 중심 좌표가 마커가 되는것 
                            /* newCenter = new kakao.maps.LatLng(data.x, data.y);
                            map.setCenter(newCenter); */

                            if (!marker) {
                                marker = new kakao.maps.Marker({
                                    position: markerPosition,
                                    image: markerImageForP
                                });
                                marker.setMap(map);
                            } else {
                                marker.setPosition(markerPosition);
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                        });
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
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
                },
                options // 옵션 객체 전달
            );
        } else {
            console.error("Geolocation이 지원되지 않습니다.");
        }
    }


        
 
   
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
				
                // 초기 호출
                fetchPatientDetails(selectedPNo);
                
            	
                // 기존 interval이 있으면 제거
                if (window.currentInterval) {
                    clearInterval(window.currentInterval);
                }

                // 2초마다 호출
                window.currentInterval = setInterval(function() {
                    if (isUseGps) {
                        fetchPatientDetails(selectedPNo);
                    } else {
                        clearInterval(window.currentInterval);
                        
                    }
                }, 2000);
                
            
            });
        });
    })
    .catch(error => console.error('Error fetching patients:', error));
}


var isUseGps = false;

// 환자 위치 정보를 가져오는 함수
function fetchPatientDetails(p_no) {
    fetch('/nurse/getPatientGps?p_no=' + p_no, {
        headers: {
            'Accept': 'application/json'
        }
    })   
   	 .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })                                  
    .then(P_GPS => {
       	isUseGps =true;
       // console.log(P_GPS);
        // 가져온 환자 세부 정보를 처리하는 로직 추가
        //console.log('P_GPS', P_GPS);
		
        // 기존의 마커가 있으면 지도에서 제거합니다
        if (markerPgps) {
            markerPgps.setMap(null);
        }

        // 새로운 마커를 생성합니다
        markerPgps = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(P_GPS.x, P_GPS.y),
            map: map,
        });
		
        markerPgps.setMap(map);
        
 
        
   // 환자에 대한 정보 표시 박스
        var iwContent = '<div style="padding:5px; width:200px; height:120px;">' +
                        '<div style="font-size:14px; margin-bottom:10px;">이름: ' + P_GPS.p_name + '</div>' +
                        '<div style="font-size:14px; margin-bottom:10px;">병실: ' + P_GPS.p_room + '</div>' +
                        '<div style="font-size:14px; margin-bottom:10px;">전화번호: ' + P_GPS.p_phone + '</div>' +
                        '<div style="font-size:14px;">보호자: ' + P_GPS.p_subPhone + '</div>' +
                        '</div>';
        iwPosition = new kakao.maps.LatLng(P_GPS.x, P_GPS.y); //인포윈도우 표시 위치입니다
 
        // 기존 인포윈도우가 있으면 닫습니다
        if (currentInfowindow) {
            currentInfowindow.close();
        }
		
         // 인포윈도우를 생성합니다
        currentInfowindow = new kakao.maps.InfoWindow({
            position : iwPosition,
            content : iwContent
        });

        currentInfowindow.open(map,markerPgps);
    	
     	
        newCenter = new kakao.maps.LatLng(P_GPS.x, P_GPS.y); // 새로운 중심 좌표
        map.setCenter(newCenter);
        //console.log(isUseGps)
		
    })
    .catch(error => {
       // console.log(isUseGps)
        console.error('Error fetching and processing patient details:', error);
        isUseGps = false;
        alert('해당 사용자는 위치 서비스를 이용하지 않고 있습니다.');
        // 기존의 마커가 있으면 지도에서 제거합니다
        if (markerPgps) {
            markerPgps.setMap(null);
            // 기존에 생성된 인포윈도우가 있다면 닫기
            if (currentInfowindow) {
                currentInfowindow.close();
            }
        } map.setCenter(hCenter);
    	
        // 모든 .patient 요소에서 clicked 클래스를 제거합니다
        document.querySelectorAll('.patient').forEach(function(p) {
            p.classList.remove('clicked');
        });
       
    });
}

</script>
</body>
</html>
