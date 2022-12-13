<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/moveline.css">
<%@ include file="/views/common/header.jsp" %>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
				<!--지도 공통 코드-->
				<div id="map" style="width:100%;height:350px;"></div>

				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33fd119d7cb33802d4d2150e75c4db4a&libraries=services"></script>
				<!-- 일반지도 API -->
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				
				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				</script>
				
								<br><br><br>
				<%-- <%for(int i=0; i<날짜; i++) %> 날짜 입력받아오면 넣기--%>
				<div>
					<h2><b>1일차</b></h2>
					
						<p>*경로는 최대 7개 설정 가능합니다.</p>
						<button>경로 반영 및 임시저장</button>
						<!-- <p>버튼을 눌러 경로를 확인하세요.</p> -->
						<table>
							<tr style="text-align :center">
								<th></th>
								<th>시간</th>
								<th>장소</th>
								<th>상세내용</th>
								<th>비용</th>
								
							</tr>
							<%for(int i=0; i<7; i++) {%>
							<tr>
								<td><%=i+1 %></td>
								<td><input type="time" name="time" style="border-right:0px; border-top:0px; border-left:0px;"></td>
								<td>🚩<input type="text" name="place" placeholder="주소 또는 키워드를 입력해주세요" style="border-right:0px; border-top:0px; border-left:0px;"></td>
								<td>🌞<input type="text" name="content" style="border-right:0px; border-top:0px; border-left:0px;"></td>
								<td>💲<input type="text" name="cost" style="border-right:0px; border-top:0px; border-left:0px;"></td>
							</tr>
							<%} %>
						</table>
						
				</div>
				
				<script>
				<!-- 키워드로 장소 검색하기 API -->
				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
				var infowindow = new kakao.maps.InfoWindow({zIndex:1});
				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places(); 
				// 키워드로 장소를 검색합니다
				ps.keywordSearch('서울특별시 중구 소공로 106', placesSearchCB);  //이 부분을 바꾸기
								
				//마커를 표시할 지도 위치
				//가공 필수
				let placeData = ['place1', 'place2', 'place3',
					'place4', 'place5', 'place6', 'place7'] //for문으로 돌려서 받기
				let count = 0;	//플레이스를 누적할 카운트 변수
				

				
				//마커를 여러개 설정 가능한지?
				var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
				//이미지 보면서 조정하기
				imageSize = new kakao.maps.Size(34, 39), // 마커이미지의 크기입니다 
			    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다
				
			 	//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
			    //이 부분은 내가 조정해야돼서 지움
			    //var markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다
				//입력받은 장소가 null 이 아니면 함수 호출
			    if (placeData != null) {
    				kewwordSearch(placeData[count]);
				}
			  	//keywordSearch함수 재정의
			    function keywordSearch(keyword) { 
			        ps.keywordSearch(keyword, placesSearchCB);
			        count = count + 1; //배열 인덱스 +1 넘겨주기
			    }
 				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB (data, status, pagination) {
				    if (status === kakao.maps.services.Status.OK) {
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        var bounds = new kakao.maps.LatLngBounds();
				        for (var i=0; i<data.length; i++) {
				            displayMarker(data[i]);    
				            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				        }       
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				        map.setBounds(bounds);
				    } 
				}
				

				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {
				    
				    // 마커를 생성하고 지도에 표시합니다
				    var marker = new kakao.maps.Marker({
				        map: map,
				        position: new kakao.maps.LatLng(place.y, place.x) 
				    });


 					/// 마커에 클릭이벤트를 등록합니다
				    kakao.maps.event.addListener(marker, 'click', function() {
				        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
				        infowindow.open(map, marker);
				    }); 

				}
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);  

				// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				var content = '<div class="customoverlay">' +
				    
				// 카카오지도와 연결할지 말지 , 안 하는게 좋을것 같아
/* 				'  <a href="https://map.kakao.com/link/map/'+place??+'"' +
				    'target="_blank">' +
				    '    <span class="title">'+place.place_name+'</span>'
				    '  </a>' +
				    '</div>'; */
				'    <span class="title">'+place.place_name+'</span>';
				    var customOverlay = new kakao.maps.CustomOverlay({
				        map: map,
				        position: new kakao.maps.LatLng(place.y, place.x),
				        content: content,
				        yAnchor: 0.11
				    });
				
				</script>

				
		    </div>
	    <div id="rightMarginMain"></div>
    </section>
<%@ include file="/views/common/footer.jsp" %>