<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/moveline.css">
	 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b39ac3f3968d9d1ab2abc39538c8b218&libraries=services"></script>
<%@ include file="/views/common/header.jsp" %>
<!--캘린더  -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
		    	<!-- 
		    	//moveline table
			    	1. movelineNo(x)
			    	2. (hidden)userId (hidden) : name=userId o
			    	3. (hidden)tripdateStart : id,name = tripdateStart (whyrano) o
			    	4. (hidden)tripdateFinish : id,name = tripdateFinish (whyrano) o
			    	5. moveLineName : name=movelineName
			    	6. moveLineEnroll(x)
			    	7. openAndClosed (수화꺼)
		    	//marker table
			    	1. makerNo(x)
			    	 moveLineNo(x)
			    	2. (hidden)longitude(hidden) : name=longitude o
			    	3. (hidden)latitude(hidden) : name=latitude o
			    	4. memo : name = memo
			    	5. movelineDay(1,2,3일차가 들어감 ->for문으로 받기) id=movelineDay
			    	6. placeName(키워드로 넣기) : name=place[movelineDay] : value=array로 받고 name은 1개값
			    	7. price : name = cost
			    	8. markerTime(시간) : name=time
			    	9. address(수화꺼)
					//(hidden)total : name=tripDay value값 넘겨줘야함 (hidden) o
		    	
		    	 -->
				 <!-- action="<%=request.getContextPath() %>/moveLine/movelineinsert.do" -->
				<form action="<%=request.getContextPath() %>/moveLine/movelineinsert.do" method="post">
					<input type="hidden" id="movelineDay" name="movelineDay" value=""> <!--0~tripDay포문-->
					<input type="hidden" id="tripDay" name="tripDay" value=""> 
					<% if(loginMember!=null){ %>
						<input type="hidden" name="userId" value="<%=loginMember.getUserId()%>"> 
					<% } %>
					<input type="hidden" name="longitude" value=""> 
					<input type="hidden" name="latitude" value=""> 
					
					<input type="text" id="movelineName" name="movelineName" placeholder="여행제목을 입력해주세요">
					<br><br><br>
					<!-- 캘린더 -->
					<div id="psh_calBox">
							<input class="input-box" type="text" name="daterange"/>
							<input type="reset" value="취소">
							<input type="hidden" name="tripdateStart" value="">
							<input type="hidden" name="tripdateFinish" value="">
					</div>
				
					<!--지도 공통 코드-->
					<div id="map" style="width:100%;height:350px;"></div>
					<br><br><br>
	
					<!-- <div>
						<h2><b>1일차</b></h2>
						
						<p>*경로는 최대 5개 설정 가능합니다.</p>
						<button onclick="fn_reflection();">경로확인</button>
						<sub>*버튼을 눌러 경로를 확인하세요.</sub>
						<br><br> -->
						<!-- <table>
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
								<td>🌞<input type="text" name="memo1"></td>
								<td>💲<input type="text" name="cost1"></td>
							</tr>
						</table>
						<br><br>
						<button onclick="fn_saveInfo();">저장하기</button>
					</div> -->
					<div id="tableContainer"></div>

				</form>
				
				<script>

				 	let table;
					let hTag;
					let h2;
					let input;
					
					//달력 함수
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
						const endDate=new Date(durDate2[2], durDate2[0], durDate2[1]);
						const minus = endDate.getTime() - strDate.getTime();
						const total = minus / (1000*60*60*24)+1;//일차
						//console.log(total);
						let tripdateStart = (durDate[2]+"-"+durDate[0]+"-"+durDate[1]);
						let tripdateFinish = (durDate2[2]+"-"+durDate2[0]+"-"+durDate2[1]);
						
						// let movelineday=[];
						// for(let i=0; i<total; i++){
						// 	movelineday.push(i+1);
						// }

						$('input[name=tripDay]').val(total);
					 	$('input[name=tripdateStart]').val(tripdateStart);
					 	$('input[name=tripdateFinish]').val(tripdateFinish);
												
						document.querySelector("div#tableContainer").innerHTML="";
						let k=0;
						for(k=0; k<total; k++){
							h2=$("<h2>").text((k+1)+"일차").appendTo($("div#tableContainer"));
							$(h2).attr("id","day"+(k+1));
							let p=$("<p>").text("*경로는 최대 5개 설정 가능합니다.").appendTo($("div#tableContainer"));
							//let inputbtn=$("<input type='button' id='reflection' onclick='fn_reflection();'>").val("경로확인").appendTo($("div#tableContainer"));
							//let inputbtn=$("<input type='button' id='reflection' value='+(k+1)+'onclick='changeDisplayMarker(this.value)'>").text(k+1+"일차 경로확인").appendTo($("div#tableContainer"));
							
							let inputbtn=$("<button>")
							.attr({
								"type":"button",
								"id":"reflection",
								"value":(k+1),
								"onclick":"changeDisplayMarker(this.value)"
							}).text("경로확인").appendTo($("div#tableContainer"));
							//inputbtn.attr("value",(k+1));
							let sub=$("<sub>").text(" *버튼을 눌러 경로를 확인하세요.").appendTo($("div#tableContainer"));
							let br=$("<br>").appendTo($("div#tableContainer"));
							$("<br>").appendTo($("div#tableContainer"));
							$("<br>").appendTo($("div#tableContainer"));

							//태그생성
							table=$("<table>");//<table></table>
							let tr=$("<tr>");
							tr.append($("<th>").text(""));
							tr.append($("<th>").text("시간"));
							tr.append($("<th>").text("장소"));
							tr.append($("<th>").text("상세내용"));
							tr.append($("<th>").text("비용"));
							table.append(tr);
							
							for(let i=0; i<5; i++){  
							// (tr>td*5)*5
								let tr=$("<tr>");

								for(let j=0;j<5;j++){
									let input;
									if(j==0){
										input=$("<span>").text(i+1);
									}
									else if(j==1){
										input=$("<input type='time'>");
										$(input).attr("name","time"+(k+1));
									} else if(j==2){
										input=$("<input type='text' placeholder='주소 또는 키워드를 입력해주세요'>");
										switch(i){
											case 0 : $(input).attr("id","place1"); break;
											case 1 : $(input).attr("id","place2"); break;
											case 2 : $(input).attr("id","place3"); break;
											case 3 : $(input).attr("id","place4"); break;
											case 4 : $(input).attr("id","place5"); break;
										}
										$(input).attr("name","place"+(k+1));
									} else if(j==3){
										input=$("<input type='text'>");
										$(input).attr("name","memo"+(k+1));
									} else if(j==4){
										input=$("<input type='text'>");
										$(input).attr("name","cost"+(k+1));
									}
										tr.append($("<td>").append(input));

								}

							table.append(tr);
						}
						table.appendTo($("div#tableContainer"));
						let btnsave=$("<input type='submit' value='등록하기'>").appendTo($("div#tableContainer"));
						}
						
						//mapMardkerOverlayReSet();

					});

					<!-- 일반지도 API -->
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = { 
						center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
						level: 3 // 지도의 확대 레벨
					};
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					// <!-- 키워드로 장소 검색하기 API -->
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
					let linePath=[];
					let markerPosition=[];
					let day=[];

					function fn_reflection(i) {

						count=0; //플레이스를 누적할 카운트 변수
						placeData=[]; //장소 저장
						markers=[]; //마커 저장
						customOverlays=[]; //마커 위 장소명을 띄울 오버레이							
						bounds = new kakao.maps.LatLngBounds();//비동기
						day=[];
						
						//어느테이블의 input값인지 fn reflction 함수에서 지정하기
						//i가 일차별이랑 같으면 
						const inputTable=$("button[value="+(i+1)+"]").nextAll("table");
						let arr = [];
						//각 일차별 등록된 장소 input가져오기
						const inputPlaces=inputTable.find("input[id*=place]");
						console.log(markers);
						console.log(customOverlays);
						//maker초기화하기
						//mapMardkerOverlayReSet();
						
						for (let i=0; i<markers.length; i++) {
							markers[i].setMap(null);		
							customOverlays[i].setMap(null);
						}
						markers=[];
						customOverlays=[];

						inputPlaces.each((i,v)=>{
							const place=v.value;
							if(place.length>0){
								placeSearch(place);
							}
						});
						
					}

					function placeSearch(p) {
						//키워드로 장소를 검색합니다
						ps.keywordSearch(p, placesSearchCB);
						count = count + 1;
					}

					function placesSearchCB(data, status, pagination) {
						if (status === kakao.maps.services.Status.OK) {
							// 키워드 검색 완료 시 호출되는 콜백함수 입니다
							// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
							// LatLngBounds 객체에 좌표를 추가합니다

							displayMarker(data[0]);
							bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));

							let latlng =  new kakao.maps.LatLng(data[0].y, data[0].x);
							let latitude = latlng.getLat();
							let longitude = latlng.getLng();
							
							$('input[name=latitude]').val(latitude);
							$('input[name=longitude]').val(longitude);

							// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
							 if (count < placeData.length) {
							 	placeSearch(placeData[count])
							 } else if (count == placeData.length) {
								setBounds();
							 }
						}
					}

					function changeDisplayMarker(value){
						day=[];
						
						//console.log($('input[name=tripDay]').val());

						for(let i=0; i<$('input[name=tripDay]').val();i++){
			
							if(value==(i+1)) {
							// 	클릭일차 마커들만 지도에 표시하도록 설정합니다
								fn_reflection(i);
								break;
							} 
						}

					};



					
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

						//비동기 끝나고 실행되어야 하므로 위도경도가지고 오는 메소드는 여기에 추가
						
						markerPosition.push(marker.getPosition());

						//지도에 표시할 선을 생성합니다						
						var polyline = new kakao.maps.Polyline({
						    path: markerPosition, // 선을 구성하는 좌표배열 입니다
						    strokeWeight: 5, // 선의 두께 입니다
						    strokeColor: '#F1C40F', // 선의 색깔입니다
						    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
						    strokeStyle: 'solid' // 선의 스타일입니다
						});

						// 지도에 선을 표시합니다 
						polyline.setMap(map);
						console.log("폴리라인 총 거리" + Math.round(polyline.getLength()));		

					}        
	/* 				function mapMardkerOverlayReSet(){
						if(markers.length>0){
							console.log(markers);
							for (let i=0; i<markers.length; i++) {
								markers[i].setMap(null);		
								customOverlays[i].setMap(null);
							}
							markers=[];
							customOverlays=[];
							//map.setMap(markers);
							
						}
					} */
//여기서부터 지우기
					//let distance = Math.round(polyline.getLength()); // 선의 총 거리를 계산합니다
					//let	content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
						
					// 그려진 선의 거리정보를 지도에 표시합니다
					//showDistance(content, path[path.length-1]);  
					//let distance;
					

 					//let distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
					// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
					// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
					// function showDistance(content, position) {
						
					// 	if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
							
					// 		// 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
					// 		distanceOverlay.setPosition(position);
					// 		distanceOverlay.setContent(content);
							
					// 	} else { // 커스텀 오버레이가 생성되지 않은 상태이면
							
					// 		// 커스텀 오버레이를 생성하고 지도에 표시합니다
					// 		distanceOverlay = new kakao.maps.CustomOverlay({
					// 			map: map, // 커스텀오버레이를 표시할 지도입니다
					// 			content: content,  // 커스텀오버레이에 표시할 내용입니다
					// 			position: position, // 커스텀오버레이를 표시할 위치입니다.
					// 			xAnchor: 0,
					// 			yAnchor: 0,
					// 			zIndex: 3  
					// 		});      
					// 	}
					// }
					// // 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
					// // 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
					// // HTML Content를 만들어 리턴하는 함수입니다
					// function getTimeHTML(distance) {

					// // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
					// var walkkTime = distance / 67 | 0;
					// var walkHour = '', walkMin = '';

					// // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
					// if (walkkTime > 60) {
					// 	walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
					// }
					// walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

					// // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
					// var bycicleTime = distance / 227 | 0;
					// var bycicleHour = '', bycicleMin = '';

					// // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
					// if (bycicleTime > 60) {
					// 	bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
					// }
					// bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

					// // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
					// var content = '<ul class="dotOverlay distanceInfo">';
					// content += '    <li>';
					// content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
					// content += '    </li>';
					// content += '    <li>';
					// content += '        <span class="label">도보</span>' + walkHour + walkMin;
					// content += '    </li>';
					// content += '    <li>';
					// content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
					// content += '    </li>';
					// content += '</ul>'

					// return content;
					// }
//여기까지 지우기


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