<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6078f18f8b414a692ce66b5db8cca51&libraries=services,clusterer,drawing"></script>
<script src="https://kit.fontawesome.com/014e61e9c4.js" crossorigin="anonymous"></script>
<title>우리동네동물병원</title>

</head>
<body>
	<jsp:include page="./header.jsp"/>
    <div class ="com_name">
		<h1><a href="<c:url value="/hospital"/>" style="color: #090909; border-bottom: 4px solid #fcd11e;">우리동네동물병원</a></h1>
		<h1><a href="<c:url value="/hospital/reviews"/>">후기에요</a></h1>
    </div>
    <div class="hosmap">
        <div id="mapimg" style="width: 80%;height:600px;"></div>
        <div id="list"></div>
	</div>
    <script>
        let map;
        let lat, lng;
        //현재 접속한 브라우저의 위도, 경도 받아오기
        if(navigator.geolocation){
            navigator.geolocation.getCurrentPosition(function(position){
                //현재 접속한 브라우저의 위도
                lat = position.coords.latitude;
                //현재 접속한 브라우저의 경도
                lng = position.coords.longitude;
                createMap(lat, lng);
            })
        }
        else{
            alert("현재 접속하신 브라우저에서는 사용하실 수 없는 기능입니다.\n크롬으로 접속해주세요");
        }
        //위도, 경도를 이용해 현재 위치 지도로 만들기
        function createMap(lat, lng){
            let mapContainer = document.getElementById('mapimg'),
            mapOption = {
                center : new kakao.maps.LatLng(lat, lng),
                level : 4            
            };
            map = new kakao.maps.Map(mapContainer, mapOption); 
            //드래그가 끝날 때 중심좌표 받아오기, #list의 div 초기화
            kakao.maps.event.addListener(map, 'dragend', function(){
                let center = map.getCenter();
                lat = center.getLat();
                lng = center.getLng();
                hospitalSearch(lat, lng);
                let dellistbox = document.getElementById('list')
                while(dellistbox.firstChild){
                    dellistbox.removeChild(dellistbox.firstChild);
                }
            });
            hospitalSearch(lat, lng);
        };
        let ps = new kakao.maps.services.Places();
        let callback = function(result, status){            
            if(status == kakao.maps.services.Status.OK){
                let listbox = document.getElementById('list')
                for(let i=0; i<result.length; i++){
                    
                    let hosdata = result[i];
                    let hosNode = document.createElement('div');
                    hosNode.classList.add('hosdetail');
                    hosNode.innerHTML = 
                    `<p><b>`+hosdata.place_name+`</b></p>
                    <p><i class="fas fa-map-marker-alt" style="margin-right: 5px;"></i>`+hosdata.road_address_name+`</p>
                    <p><i class="fas fa-phone-alt" style="margin-right: 5px;"></i><span class="phone">`+hosdata.phone+`</span></p>`;
                    listbox.appendChild(hosNode);
                    createMarker(result[i], hosNode);
                    
                }
            }
        };
        //동물병원 div 클릭시 해당 동물병원 마커가 지도 중심으로 오게하면서 마커 정보 띄우기
        function moveMarkerToCenter(place) {         
            
        }
        
        //동물병원 검색하기
        function hospitalSearch(lat, lng){
            ps.keywordSearch('동물병원', callback, {
                location : new kakao.maps.LatLng(lat, lng),
                radius : 1000
            });
        }
        //검색된 동물병원들 지도에 마커로 표시하기
        function createMarker(place, hosNode){
            let marker = new kakao.maps.Marker({
                position : new kakao.maps.LatLng(place.y, place.x)
            });
            marker.setMap(map);   
            // 마커를 클릭하여 나오는 div
            let infowindow = new kakao.maps.InfoWindow({
                content: //'' 말고 ``쓰면 여러줄 가능
                    `<div style="margin-bottom:20px;padding:0px 5px 10px 5px;">
                        <p style="padding:5px 0px;"><b>`+place.place_name+`</b></p>
                        <p style="padding:5px 0px;"><i class="fas fa-map-marker-alt" style="margin-right: 5px;"></i>`+place.road_address_name+`</p>
                        <p style="padding:5px 0px;"><i class="fas fa-phone-alt" style="margin-right: 5px;"></i><span class="phone" style="color:green">`+place.phone+`</span></p>
                    </div>`
            });
            let isOpen = false;
            // 마커 클릭 시 정보창 열고 닫기
            kakao.maps.event.addListener(marker, 'click', function() {
                if(isOpen){
                    infowindow.close();
                    isOpen = false;
                }
                else{
                    infowindow.open(map, marker);
                    isOpen = true;
                }
            });
            
            // 드래그가 시작될 때 정보창 닫기
            kakao.maps.event.addListener(map, 'dragstart', function() {
                infowindow.close();
            });
            hosNode.addEventListener('click', function() {
                let position = new kakao.maps.LatLng(place.y, place.x);
                map.setCenter(position); // 해당 위치를 지도 중심으로 설정하기
                infowindow.open(map, marker)
            });
        }
    </script>
	<jsp:include page="./footer.jsp"/>
</body>
</html>