$(function() {
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(37.569370616931174, 126.98601199930015),
		level: 3
	};
	var map = new kakao.maps.Map(container, options);

	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성합니다 
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	var clusterer = new kakao.maps.MarkerClusterer({
            map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
            averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
            minLevel: 6 // 클러스터 할 최소 지도 레벨 
     });
	
	// 서울 CCTV 마커
	$.get('/json/SeoulCCTV.json', function(data) {
		//CCTV 마커가 표시될 죄표 배열
		var positions = [];

		for (var i = 0; i < data.length; i++) {
			positions.push({
				title: data[i].adr1,
				x:data[i].lat,
				y:data[i].longi
			});
		}
		
		// 마커 이미지의 주소
		var markerImageUrl = 'https://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_p.png';
		
		var markers = $(positions).map(function (i, position) {
			var markerImageSize = new kakao.maps.Size(18, 20); // 마커 이미지의 크기

			var markerImageOptions = {
				offset: new kakao.maps.Point(7, 21)// 마커 좌표에 일치시킬 이미지 안의 좌표
			};

			// 마커 이미지를 생성한다
			var markerImage = new kakao.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
				
            var maks = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(position.x, position.y),
				title: position.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image: markerImage,
            });
			
			// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
			var info = '<div style="width:250px; height:100%; padding:5px;">CCTV<br>사용목적 : ' + data[i].use + '<br>관리 : ' + data[i].mng + '<br>전화번호 : ' + data[i].mngnum + '<br>데이터갱신일 : ' + data[i].datadate + '</div>';
			
            var infowindow = new kakao.maps.InfoWindow({
                content: info, // 인포윈도우에 표시할 내용
                removable: true
            });

			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			kakao.maps.event.addListener(maks, 'mouseover', makeOverListener(map, maks, infowindow));
			kakao.maps.event.addListener(maks, 'mouseout', makeOutListener(infowindow));

            return maks;

        });
		
		// 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
		
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
			

	});
	
	// 서울 공영주차장 마커
	$.get('/json/SeoulParking.json', function(data) {
		//주차장 마커가 표시될 죄표 배열
		var positions = [];

		for (var i = 0; i < data.length; i++) {
			positions.push({
				title: data[i].adr1,
				x:data[i].lat,
				y:data[i].longi
			});
		}
		
		// 마커 이미지의 주소
		var markerImageUrl = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';
		
		var markers = $(positions).map(function (i, position) {
			var markerImageSize = new kakao.maps.Size(13, 14); // 마커 이미지의 크기

			var markerImageOptions = {
				spriteOrigin: new kakao.maps.Point(5, 36), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				spriteSize: new kakao.maps.Size(18, 49), // 스프라이트 이미지의 전체 크기 
				offset: new kakao.maps.Point(6, 13)// 마커 좌표에 일치시킬 이미지 안의 좌표
			};

			// 마커 이미지를 생성한다
			var markerImage = new kakao.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
				
            var maks = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(position.x, position.y),
				title: position.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image: markerImage,
            });
			
			// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
			var info = '<div style="width:250px; height:100%; padding:5px;">주차장<br>종류:' + data[i].typename + '<br>야간개방여부:' + data[i].ngtopenname + '<br>사용가격:' + data[i].payname + '<br>데이터갱신일:' + data[i].datadate + '</div>';
			
            var infowindow = new kakao.maps.InfoWindow({
                content: info, // 인포윈도우에 표시할 내용
                removable: true
            });

			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			kakao.maps.event.addListener(maks, 'mouseover', makeOverListener(map, maks, infowindow));
			kakao.maps.event.addListener(maks, 'mouseout', makeOutListener(infowindow));

            return maks;

        });
		
		// 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
		
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
			

	});
	
	var address = $("#map").attr("class");
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	geocoder.addressSearch(address, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+address+'</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	}); 
	
	// 검색 클릭시 지도에 해당 주소 마킹
	$("#mapsearch").click(function() {
		let roomaddress = document.getElementById("roomaddress").value;
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(roomaddress, function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
					map: map,
					position: coords
				});

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
	})   

})