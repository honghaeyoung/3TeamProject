<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<div id="map" style="width:60%;height:100vh; align-content: center;"></div>

	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=247e6f358c52a2c41297e70049ad1ad2"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.569341, 126.986008), // 지도의 중심좌표
		        level: 4, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(37.569341, 126.986008), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});

		// 마커 위에 표시할 인포윈도우를 생성한다
		var infowindow = new kakao.maps.InfoWindow({
		    content : '<div style="padding:5px;">인포윈도우 :D</div>' // 인포윈도우에 표시할 내용
		});

		// 인포윈도우를 지도에 표시한다
		infowindow.open(map, marker);

		// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
		kakao.maps.event.addListener(marker, 'click', function() {
		    alert('마커를 클릭했습니다!');
		});

	</script>
</body>
</html>