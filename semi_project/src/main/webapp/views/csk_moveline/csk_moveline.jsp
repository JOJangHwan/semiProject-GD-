<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/moveline.css">
<%@ include file="/views/common/header.jsp" %>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
		    <input type="text" id="headline" name="headline" placeholder="여행제목을 입력해주세요">
			<br><br><br>
                <!-- 캘린더 -->
                <div id="psh_calBox">
                    <form id="psh_calForm">
                        <input class="input-box" type="text" name="daterange"/>
                        <input type="reset" value="취소">
                    </form>
                </div>

                <script>
                    $(function() {
                        $('input[name="daterange"]').daterangepicker({
                            opens: 'left'
                            }, function(start, end, label) {
                                //console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
                            });
                    });
                    $(".input-box").change(e=>{
                        const duration=$(".input-box").val().split("-");
                    
                        const durDate=duration[0].trim().split("/");
                        const durDate2=duration[1].trim().split("/");
                        
                        const strDate=new Date(durDate[2], durDate[0], durDate[1]);
                        const endDate=new Date(durDate2[2], durDate2[0], durDate2[1])

                        const minous = endDate.getTime() - strDate.getTime();
                        const total = minous / (1000*60*60*24) ;//일차
                        console.log(total);
                    });  
                </script>
 			
 			<!--지도 공통 코드-->
				<div id="map" style="width:100%;height:350px;"></div>

				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b39ac3f3968d9d1ab2abc39538c8b218&libraries=services"></script>
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
				<!--  
				<%-- <%for(int i=0; i<날짜; i++) %> --%> 날짜 입력받아오면 넣기
				-->
				<div>
					<h2><b>1일차</b></h2>
					
					<p>*경로는 최대 7개 설정 가능합니다.</p>
					<button onclick="fn_reflection();">경로 반영 및 임시저장</button>
					<!-- <p>버튼을 눌러 경로를 확인하세요.</p> -->
					<table>
						<tr style="text-align :center">
							<th></th>
							<th>시간</th>
							<th>장소</th>
							<th>상세내용</th>
							<th>비용</th>	
						</tr>
						<tr>
							<td>1</td>
							<td><input type="time" name="time"></td>
							<td>🚩<input type="text" name="place1" id="place1" placeholder="주소 또는 키워드를 입력해주세요"></td>
							<td>🌞<input type="text" name="content"></td>
							<td>💲<input type="text" name="cost"></td>
						</tr>
						<tr>
							<td>2</td>
							<td><input type="time" name="time"></td>
							<td>🚩<input type="text" name="place2" id="place2" placeholder="주소 또는 키워드를 입력해주세요"></td>
							<td>🌞<input type="text" name="content"></td>
							<td>💲<input type="text" name="cost"></td>
						</tr>
						<tr>
							<td>3</td>
							<td><input type="time" name="time"></td>
							<td>🚩<input type="text" name="place3" id="place3" placeholder="주소 또는 키워드를 입력해주세요"></td>
							<td>🌞<input type="text" name="content"></td>
							<td>💲<input type="text" name="cost"></td>
						</tr>
						<tr>
							<td>4</td>
							<td><input type="time" name="time"></td>
							<td>🚩<input type="text" name="place4" id="place4" placeholder="주소 또는 키워드를 입력해주세요"></td>
							<td>🌞<input type="text" name="content"></td>
							<td>💲<input type="text" name="cost"></td>
						</tr>
						<tr>
							<td>5</td>
							<td><input type="time" name="time"></td>
							<td>🚩<input type="text" name="place5" id="place5" placeholder="주소 또는 키워드를 입력해주세요"></td>
							<td>🌞<input type="text" name="content"></td>
							<td>💲<input type="text" name="cost"></td>
						</tr>
					</table>
				</div>
				
				<script>
					//<!-- 키워드로 장소 검색하기 API -->
					// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
					var infowindow = new kakao.maps.InfoWindow({zIndex:1});
					// 장소 검색 객체를 생성합니다
					var ps = new kakao.maps.services.Places();
					
					// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        			// LatLngBounds 객체에 좌표를 추가합니다
					var bounds = new kakao.maps.LatLngBounds();
					// 키워드로 장소를 검색합니다 				
					
					//마커를 여러개 설정 가능한지?
					var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // 마커이미지의 주소입니다    
					//이미지 보면서 조정하기
					imageSize = new kakao.maps.Size(40, 40), // 마커이미지의 크기입니다 
					imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다

					// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
					let count=0; //플레이스를 누적할 카운트 변수
					let placeData=[]; //장소 저장
					let markers=[]; //마커 저장
					let customOverlays=[]; //마커 위 장소명을 띄울 오버레이

					function fn_reflection() {
						count=0; //플레이스를 누적할 카운트 변수
						placeData=[]; //장소 저장
						markers=[]; //마커 저장
						customOverlays=[]; //마커 위 장소명을 띄울 오버레이

						bounds = new kakao.maps.LatLngBounds();

						for (var i = 0; i < markers.length; i++) {
							markers[i].setMap(null);
							customOverlays[i].setMap(null);
						}
						markers = [];
						customOverlays = [];

						let place1 = document.getElementById("place1");
						let place2 = document.getElementById("place2");
						let place3 = document.getElementById("place3");
						let place4 = document.getElementById("place4");
						let place5 = document.getElementById("place5");
						let arr = [place1, place2, place3, place4, place5];
						
						//정규표현 넣어?
						// for(i = 0; i < arrTemp.length; i++)
						// if (!arrTemp[i].value.replace(/^\s+|\s+$/g, '')) {
						// 	alert('키워드를 입력해주세요!');
						// 	return false;
						// } else {
						// 	if (arrTemp[i].value != null) {
						// 		placeData.push(arrTemp[i].value);
						// 	}
						// }

	
						for (i = 0; i < arr.length; i++) {
							if (arr[i].value != "") {
								placeData.push(arr[i].value);
								console.log(i+":"+arr[i].value);
								console.log(placeData);
							}
						}

						if (placeData != null) {
							placeSearch(placeData[count]);
						}
					}

					function placeSearch(p) {
						ps.keywordSearch(p, placesSearchCB);
						count = count + 1;
					}

					function placesSearchCB(data, status, pagination) {
						if (status === kakao.maps.services.Status.OK) {

							// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
							// LatLngBounds 객체에 좌표를 추가합니다

							displayMarker(data[0]);
							bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));

							// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
							if (count < placeData.length) {
								placeSearch(placeData[count])
							} else if (count == placeData.length) {
								setBounds();
								
							}
						}

					}

					// 지도에 마커를 표시하는 함수입니다
					function displayMarker(place) {

						// 마커를 생성하고 지도에 표시합니다
						var marker = new kakao.maps.Marker({
							map: map,
							position: new kakao.maps.LatLng(place.y, place.x),
							image: markerImage
						});

						markers.push(marker);

						kakao.maps.event.addListener(marker, 'click', function () {
							var position = this.getPosition();
							var url = 'https://map.kakao.com/link/map/' + place.id;
							// open(url, '_blank');
							infowindow.open(map, marker);
						});

						var content =
							'<div class="customoverlay">' +
							'	<a href="https://map.kakao.com/link/map/' + place.id + '"' + 'target="_blank">' +
							'	<span class="title">'+count+'.'+place.place_name+'</span>' +
							'	</a>' +
							'</div>';


						// 커스텀 오버레이를 생성합니다
						var customOverlay = new kakao.maps.CustomOverlay({
							map: map,
							content: content,
							yAnchor: 1,
							position: new kakao.maps.LatLng(place.y, place.x)
						});
						customOverlays.push(customOverlay);
					}

					function setBounds() {
						// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
						// 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
						map.setBounds(bounds, 90, 90, 10, 90);
					}
				</script>
		    </div>
	    <div id="rightMarginMain"></div>
    </section>
<%@ include file="/views/common/footer.jsp" %>