<%@page import="com.psh.marker.model.vo.Marker"%>
<%@page import="com.psh.moveline.model.vo.MoveLine"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
        List<MoveLine> mlList=(List<MoveLine>)request.getAttribute("moveline");
        List<Marker> mList=(List<Marker>)request.getAttribute("marker");
        int d=3;
   %>
    <!-- 에디터 -->
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfdc04e10d578470d49a9fd29e8c0536"></script>
<%@ include file="/views/common/header.jsp"%>
    
	
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
                       <!-- 스크립트로 포문 돌려서 출력 최대 일차까지 -->
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

				     <div>
					   	<table>
					   		<tr>
					   			<th>시간</th>
					   			<th>장소</th>
					   			<th>주소</th>
					   			<th>상세내용</th>
					   		</tr>
					   		<%if(mList.isEmpty()){ %>
					   			<tr>
					   				<td><h3>오류</h3></td>
					   			</tr>
					   		<%}else{%>
					   			<%for(Marker m:mList){%>
	                                <tr>
	                                    <td><%=m.getMarkerTime()%></td>
	                                    <td><%=m.getPlaceName()%></td>
	                                    <td><%=m.getAddress()%></td>
	                                    <td><%=m.getMemo()%></td>
	                                </tr>
	                            <%}
					   			}%>
					   	</table>
				   </div>
				   
				    <div id="summernote"></div>
				    
				    <script>
					    $(document).ready(function() {
	                        $('#summernote').summernote({
	                           height: 500
	                        });
	                    });
				    </script>
				    
                   <button type="button" onclick="location.assign('<%=request.getContextPath()%>/moveLineBoard/insertMoveLineBoard.do')">등록</button>
                	</form>
                </div>
	    <div id="rightMarginMain"></div>
    </section>
    
	<script>
		
        // 지도

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
        mapOption = { 
            center: new kakao.maps.LatLng(37.498004414546934, 127.02770621963765), // 지도의 중심좌표 (일차별 첫번째 장소로 지정)
            level: 3 // 지도의 확대 레벨 
        }; 

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        //좌표배열도 포문 돌려서 일차별로 집어 넣기/ 동선 저장할때 좌표 저장 형식(배열/객체배열/객체) 확인해봐야 진행 가능

        // 커피숍 마커가 표시될 좌표 배열입니다
        
          
        var movelineDay=new Array();
    	var mlday=[];
    	//좌표값 배열 생성
        <%for(Marker m:mList){%>
			movelineDay.push(<%=m.getLonggitude()%>+","+<%=m.getLatitude()%>+","+<%=m.getMovelineDay()%>);
			console.log(<%=m.getLonggitude()%>);
		<%}%>
		
		
		//위도,경도,일차 인덱스로 쪼개서 배열에 넣음
		for(let i=0;i<<%=mList.size()%>;i++){		
			mlday.push(movelineDay[i].split(","));
		}
		console.log(mlday)
		
		//숫자형변환
		/* for(let i=0;i<mlday.length;i++){
			for(let j=0;j<mlday[i].length;j++){
				Number(mlday[i][j]);
				
			}
			
		}
		console.log(typeof mlday[1][1]) */
		//일차별로 배열인덱스에 넣음
		let data={};
		let mySet=new Set();
		for(let i=0;i<mlday.length;i++){
			mySet.add(mlday[i][2]);
			//console.log(typeof mlday[i][j])
		}
		//key값으로 배열생성
		for(let key of mySet){
			data[key]=[];
		}
				
		for(let i=0;i<mlday.length;i++){
			//console.log(typeof mlday[i][2],mlday[i][0],mlday[i][1]);
 			data[mlday[i][2]].push([mlday[i][0],mlday[i][1]]);
 			
		}
		
		//일차별로 마커가 표시될 좌표배열
		for(let i=1;i<<%=d%>+1;i++){
			for(let j=0;j<data[i].length;j++){
				console.log(typeof data[i][j][0]);
			}
			
		}
		
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

        var markerImageSrc = '<%=request.getContextPath()%>/images/mark.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
            coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
            storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
            carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

            
            createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
            createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
            createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

            changeMarker(); // 지도에 커피숍 마커가 보이도록 설정합니다    


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
            
            return marker;  
        }   
        
        // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
        function createCoffeeMarkers() {
            
            for (var i = 0; i < coffeePositions.length; i++) {  
                
                var imageSize = new kakao.maps.Size(35, 50),
                    imageOptions = {  
                        spriteOrigin: new kakao.maps.Point(10, 0),    
                        spriteSize: new kakao.maps.Size(55, 50)  
                    };     
                
                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
                    marker = createMarker(coffeePositions[i], markerImage);  
                
                // 생성된 마커를 커피숍 마커 배열에 추가합니다
                coffeeMarkers.push(marker);
            }     
        }

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

    </script>
<%@ include file="/views/common/footer.jsp" %>