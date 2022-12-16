<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- 에디터 -->
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- 에디터 css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
   
    <!-- 지도 -->
    <style>
        #mapwrap{position:relative;overflow:hidden;}
        .category, .category *{margin:0;padding:0;color:#000;}   
        .category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
        .category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
        .category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
        .category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
        .category .ico_coffee {background-position:-10px 0;}  
        .category .ico_store {background-position:-10px -36px;}   
        .category .ico_carpark {background-position:-10px -72px;} 
	</style>

<%@ include file="/views/common/header.jsp" %>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">

				<form>
					<!-- 제목 -->
				   <div id="mlbTitle">
					   <input type="text" placeholder="제목을 입력하세요">
				   </div>
				   <hr>
				   <!-- 지도 시작 -->
				   <div id="mapwrap"> 
					   <!-- 지도가 표시될 div -->
					   <div id="map" style="width:100%;height:350px;"></div>
					   <!-- 지도 위에 표시될 마커 카테고리 -->
					   <div class="category">
						   <ul>
							   <li id="coffeeMenu" onclick="changeMarker('coffee')">
								   <span class="ico_comm ico_coffee"></span>
								   커피숍
							   </li>
							   <li id="storeMenu" onclick="changeMarker('store')">
								   <span class="ico_comm ico_store"></span>
								   편의점
							   </li>
							   <li id="carparkMenu" onclick="changeMarker('carpark')">
								   <span class="ico_comm ico_carpark"></span>
								   주차장
							   </li>
						   </ul>
					   </div>
				   </div>
				   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfdc04e10d578470d49a9fd29e8c0536"></script>
				   <!-- 지도 끝 -->
	   
				 
				   
				   <!-- 등록 버튼 -->
				   <div id="btnwrr">
					   <input type="submit" value="등록">
				   </div>
			   </form>

		    </div>
	    <div id="rightMarginMain"></div>
    </section>
	<script>
        
       
        
        // 지도
        
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
        mapOption = { 
            center: new kakao.maps.LatLng(37.498004414546934, 127.02770621963765), // 지도의 중심좌표 
            level: 2 // 지도의 확대 레벨 
        }; 

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 커피숍 마커가 표시될 좌표 배열입니다
        var coffeePositions = [ 
            new kakao.maps.LatLng(37.499590490909185, 127.0263723554437),
            new kakao.maps.LatLng(37.499427948430814, 127.02794423197847),
            new kakao.maps.LatLng(37.498553760499505, 127.02882598822454),
            new kakao.maps.LatLng(37.497625593121384, 127.02935713582038),
            new kakao.maps.LatLng(37.49646391248451, 127.02675574250912),
            new kakao.maps.LatLng(37.49629291770947, 127.02587362608637),
            new kakao.maps.LatLng(37.49754540521486, 127.02546694890695)                
        ];
		console.log(coffeePositions)
        // 편의점 마커가 표시될 좌표 배열입니다
        var storePositions = [
            new kakao.maps.LatLng(37.497535461505684, 127.02948149502778),
            new kakao.maps.LatLng(37.49671536281186, 127.03020491448352),
            new kakao.maps.LatLng(37.496201943633714, 127.02959405469642),
            new kakao.maps.LatLng(37.49640072567703, 127.02726459882308),
            new kakao.maps.LatLng(37.49640098874988, 127.02609983175294),
            new kakao.maps.LatLng(37.49932849491523, 127.02935780247945),
            new kakao.maps.LatLng(37.49996818951873, 127.02943721562295)
        ];

        // 주차장 마커가 표시될 좌표 배열입니다
        var carparkPositions = [
            new kakao.maps.LatLng(37.49966168796031, 127.03007039430118),
            new kakao.maps.LatLng(37.499463762912974, 127.0288828824399),
            new kakao.maps.LatLng(37.49896834100913, 127.02833986892401),
            new kakao.maps.LatLng(37.49893267508434, 127.02673400572665),
            new kakao.maps.LatLng(37.49872543597439, 127.02676785815386),
            new kakao.maps.LatLng(37.49813096097184, 127.02591949495914),
            new kakao.maps.LatLng(37.497680616783086, 127.02518427952202)                       
        ];    

        var markerImageSrc = '/images/mark.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
            coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
            storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
            carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

            
            createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
            createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
            createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

            //changeMarker(''); // 지도에 커피숍 마커가 보이도록 설정합니다    


        // 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
        function createMarkerImage(src, size, options) {
            var markerImage = new kakao.maps.MarkerImage(src, size, options);
            return markerImage;            
        }

        // 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
        function createMarker(position, image) {
            var marker = new kakao.maps.Marker({
                position: position,
                image: image
            });
            console.log(marker)
            return marker;  
        }   
        
        // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
        function createCoffeeMarkers() {
            
            for (var i = 0; i < coffeePositions.length; i++) {  
                
                var imageSize = new kakao.maps.Size(22, 26),
                    imageOptions = {  
                        spriteOrigin: new kakao.maps.Point(10, 0),    
                        spriteSize: new kakao.maps.Size(36, 98)  
                    };     
                
                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
                    marker = createMarker(coffeePositions[i], markerImage);  
                
                // 생성된 마커를 커피숍 마커 배열에 추가합니다
                coffeeMarkers.push(marker);
               
            }     
        }
        console.log(coffeePositions[0])
        // 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setCoffeeMarkers(map) {        
            for (var i = 0; i < coffeeMarkers.length; i++) {  
                coffeeMarkers[i].setMap(map);
            }        
        }

        // 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
        function createStoreMarkers() {
            for (var i = 0; i < storePositions.length; i++) {
                
                var imageSize = new kakao.maps.Size(22, 26),
                    imageOptions = {   
                        spriteOrigin: new kakao.maps.Point(10, 36),    
                        spriteSize: new kakao.maps.Size(36, 98)  
                    };       
            
                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
                    marker = createMarker(storePositions[i], markerImage);  

                // 생성된 마커를 편의점 마커 배열에 추가합니다
                storeMarkers.push(marker);    
            }        
        }

        // 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setStoreMarkers(map) {        
            for (var i = 0; i < storeMarkers.length; i++) {  
                storeMarkers[i].setMap(map);
            }        
        }

        // 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
        function createCarparkMarkers() {
            for (var i = 0; i < carparkPositions.length; i++) {
                
                var imageSize = new kakao.maps.Size(22, 26),
                    imageOptions = {   
                        spriteOrigin: new kakao.maps.Point(10, 72),    
                        spriteSize: new kakao.maps.Size(36, 98)  
                    };       
            
                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
                    marker = createMarker(carparkPositions[i], markerImage);  

                // 생성된 마커를 주차장 마커 배열에 추가합니다
                carparkMarkers.push(marker);        
            }                
        }

        // 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setCarparkMarkers(map) {        
            for (var i = 0; i < carparkMarkers.length; i++) {  
                carparkMarkers[i].setMap(map);
                console.log(carparkMarkers[i])
            }        
        }

        // 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
        function changeMarker(type){
            
            var coffeeMenu = document.getElementById('coffeeMenu');
            var storeMenu = document.getElementById('storeMenu');
            var carparkMenu = document.getElementById('carparkMenu');
            
            // 커피숍 카테고리가 클릭됐을 때
            if (type === 'coffee') {
            
                // 커피숍 카테고리를 선택된 스타일로 변경하고
                coffeeMenu.className = 'menu_selected';
                
                // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
                storeMenu.className = '';
                carparkMenu.className = '';
                
                // 커피숍 마커들만 지도에 표시하도록 설정합니다
                setCoffeeMarkers(map);
                setStoreMarkers(null);
                setCarparkMarkers(null);
                
            } else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때
            
                // 편의점 카테고리를 선택된 스타일로 변경하고
                coffeeMenu.className = '';
                storeMenu.className = 'menu_selected';
                carparkMenu.className = '';
                
                // 편의점 마커들만 지도에 표시하도록 설정합니다
                setCoffeeMarkers(null);
                setStoreMarkers(map);
                setCarparkMarkers(null);
                
            } else if (type === 'carpark') { // 주차장 카테고리가 클릭됐을 때
            
                // 주차장 카테고리를 선택된 스타일로 변경하고
                coffeeMenu.className = '';
                storeMenu.className = '';
                carparkMenu.className = 'menu_selected';
                
                // 주차장 마커들만 지도에 표시하도록 설정합니다
                setCoffeeMarkers(null);
                setStoreMarkers(null);
                setCarparkMarkers(map);  
            }    
        } 
		/* ----------------------------------------------------------------------- */
		var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
		var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
		var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
		var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
		var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

		    // 마우스로 클릭한 위치입니다 
		    var clickPosition = mouseEvent.latLng;

		    // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
		    if (!drawingFlag) {

		        // 상태를 true로, 선이 그리고있는 상태로 변경합니다
		        drawingFlag = true;
		        
		        // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
		        deleteClickLine();
		        
		        // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
		        deleteDistnce();

		        // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
		        deleteCircleDot();
		    
		        // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
		        clickLine = new kakao.maps.Polyline({
		            map: map, // 선을 표시할 지도입니다 
		            path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
		            strokeWeight: 3, // 선의 두께입니다 
		            strokeColor: '#db4040', // 선의 색깔입니다
		            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid' // 선의 스타일입니다
		        });
		        
		        // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
		        moveLine = new kakao.maps.Polyline({
		            strokeWeight: 3, // 선의 두께입니다 
		            strokeColor: '#db4040', // 선의 색깔입니다
		            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid' // 선의 스타일입니다    
		        });
		    
		        // 클릭한 지점에 대한 정보를 지도에 표시합니다
		        displayCircleDot(clickPosition, 0);

		            
		    } else { // 선이 그려지고 있는 상태이면

		        // 그려지고 있는 선의 좌표 배열을 얻어옵니다
		        var path = clickLine.getPath();

		        // 좌표 배열에 클릭한 위치를 추가합니다
		        path.push(clickPosition);
		        
		        // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
		        clickLine.setPath(path);

		        var distance = Math.round(clickLine.getLength());
		        displayCircleDot(clickPosition, distance);
		    }
		});
		    
		// 지도에 마우스무브 이벤트를 등록합니다
		// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
		kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

		    // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
		    if (drawingFlag){
		        
		        // 마우스 커서의 현재 위치를 얻어옵니다 
		        var mousePosition = mouseEvent.latLng; 

		        // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
		        var path = clickLine.getPath();
		        
		        // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
		        var movepath = [path[path.length-1], mousePosition];
		        moveLine.setPath(movepath);
		        console.log(movepath)
		        moveLine.setMap(map);
		        
		        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
		        //    
		        content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
		        
		        // 거리정보를 지도에 표시합니다
		        showDistance(content, mousePosition);
		        //좌표값 두개 console.log(clickLine.getLength())
		    }             
		});                 
		
		// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
		// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
				kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

		    // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
		    if (drawingFlag) {
		        
		        // 마우스무브로 그려진 선은 지도에서 제거합니다
		        moveLine.setMap(null);
		        moveLine = null;  
		        
		        // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
		        var path = clickLine.getPath();
		    
		        // 선을 구성하는 좌표의 개수가 2개 이상이면
		        if (path.length > 1) {

		            // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
		            if (dots[dots.length-1].distance) {
		                dots[dots.length-1].distance.setMap(null);
		                dots[dots.length-1].distance = null;    
		            }

		            var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
		                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
		                
		            // 그려진 선의 거리정보를 지도에 표시합니다
		            showDistance(content, path[path.length-1]);  
		             
		        } else {

		            // 선을 구성하는 좌표의 개수가 1개 이하이면 
		            // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
		            deleteClickLine();
		            deleteCircleDot(); 
		            deleteDistnce();

		        }
		        
		        // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
		        drawingFlag = false;          
		    }  
		});    

		// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
		function deleteClickLine() {
		    if (clickLine) {
		        clickLine.setMap(null);    
		        clickLine = null;        
		    }
		}

		// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
		// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
		function showDistance(content, position) {
		    
		    if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
		        
		        // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
		        distanceOverlay.setPosition(position);
		        distanceOverlay.setContent(content);
		        
		    } else { // 커스텀 오버레이가 생성되지 않은 상태이면
		        
		        // 커스텀 오버레이를 생성하고 지도에 표시합니다
		        distanceOverlay = new kakao.maps.CustomOverlay({
		            map: map, // 커스텀오버레이를 표시할 지도입니다
		            content: content,  // 커스텀오버레이에 표시할 내용입니다
		            position: position, // 커스텀오버레이를 표시할 위치입니다.
		            xAnchor: 0,
		            yAnchor: 0,
		            zIndex: 3  
		        });      
		    }
		}

		// 그려지고 있는 선의 총거리 정보와 
		// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
		function deleteDistnce () {
		    if (distanceOverlay) {
		        distanceOverlay.setMap(null);
		        distanceOverlay = null;
		    }
		}

		// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
		// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
		function displayCircleDot(position, distance) {

		    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
		    var circleOverlay = new kakao.maps.CustomOverlay({
		        content: '<span class="dot"></span>',
		        position: position,
		        zIndex: 1
		    });

		    // 지도에 표시합니다
		    circleOverlay.setMap(map);

		    if (distance > 0) {
		        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
		        var distanceOverlay = new kakao.maps.CustomOverlay({
		            content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
		            position: position,
		            yAnchor: 1,
		            zIndex: 2
		        });

		        // 지도에 표시합니다
		        distanceOverlay.setMap(map);
		    }

		    // 배열에 추가합니다
		    dots.push({circle:circleOverlay, distance: distanceOverlay});
		}

		// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
		function deleteCircleDot() {
		    var i;

		    for ( i = 0; i < dots.length; i++ ){
		        if (dots[i].circle) { 
		            dots[i].circle.setMap(null);
		        }

		        if (dots[i].distance) {
		            dots[i].distance.setMap(null);
		        }
		    }

		    dots = [];
		}

		// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
		// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
		// HTML Content를 만들어 리턴하는 함수입니다
		function getTimeHTML(distance) {

		    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
		    var walkkTime = distance / 67 | 0;
		    var walkHour = '', walkMin = '';

		    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
		    if (walkkTime > 60) {
		        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
		    }
		    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

		    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
		    var bycicleTime = distance / 227 | 0;
		    var bycicleHour = '', bycicleMin = '';

		    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
		    if (bycicleTime > 60) {
		        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
		    }
		    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

		    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
		    var content = '<ul class="dotOverlay distanceInfo">';
		    content += '    <li>';
		    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
		    content += '    </li>';
		    content += '    <li>';
		    content += '        <span class="label">도보</span>' + walkHour + walkMin;
		    content += '    </li>';
		    content += '    <li>';
		    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
		    content += '    </li>';
		    content += '</ul>'

		    return content;
		}
    </script>
<%@ include file="/views/common/footer.jsp" %>