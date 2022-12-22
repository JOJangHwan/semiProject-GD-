<%@page import="com.psh.marker.model.vo.Marker"%>
<%@page import="com.psh.moveline.model.vo.MoveLine"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
        MoveLine ml=(MoveLine)request.getAttribute("moveline");
        List<Marker> mList=(List<Marker>)request.getAttribute("marker");
      
        int d=2;//일차값 이ㅏㅁ의로
   %>
    <!-- 에디터 -->
	<!-- include libraries(jQuery, bootstrap)-->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
   
    <!-- 지도 -->
    <style>
		#infobox{justify-items: center;justify-content: center;display: flex;flex-direction: column;}
		#infoTitle{justify-items: center;justify-content: center;display: flex;flex-direction: row;}
		#infoContent{justify-items: center;justify-content: center;display: flex;flex-direction: row;}
		#mapwrap{position:relative;overflow:hidden;}
		.category, .category *{margin:0;padding:0;color:#000;}   
		.category {position:absolute;overflow:hidden;top:10px;left:10px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
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
				<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/moveLineBoard/insertMoveLineBoard.do" >
					<!-- 제목 -->
				    <div >
					   <input name="mlbTitle" type="text" placeholder="제목을 입력하세요">
				    </div>
					<div>
						<p>작성자 <%=ml.getUserId()%></p>  
						<input type="hidden" name="mlbWriter" value="<%=ml.getUserId()%>" readonly>
						<input type="hidden" name="mlNo" value="<%=ml.getMovelineNo()%>" readonly>
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
							  	<!-- 카테고리출력 -->
						</ul>
					   </div>
				   </div>
				   
				   <div id="infoBox">
				   		<div id="info">
							<%for(int i=0;i<d;i++){%>
							<div id="infoTitle">
								<div><h3><%=i+1%>일차</h3></div>
								<div><h3>No.</h3></div>
								<div><h3>장소명</h3></div>
								<div><h3>주소</h3></div>
								<div><h3>메모</h3></div>
							</div>
							<%for(Marker m: mList){%>
									<%if(Integer.parseInt(m.getMovelineDay())==i+1){%>
										<div id="infoContent">
											<div><h4><%=m.getMarkerNo()%></h4></div>
											<div><h4><%=m.getPlaceName()%></h4></div>
											<div><h4><%=m.getAddress()%></h4></div>
											<div><h4><%=m.getMemo()%></h4></div>
										</div>
									<%}
							      }
							}%>
					   </div>
					</div>   
				    <textarea name="mlbContent" id="summernote"></textarea>
				    
				    <input type="submit" value="등록">
                </form>
             </div>
	    <div id="rightMarginMain"></div>
    </section>
    
	<script>
		//에디터 함수
		$(document).ready(function() {
			$('#summernote').summernote({
					height: 500
					
	        });
	    });
		
 		//카테고리
 		for(let i=0;i<<%=d%>;i++){
			$(".category>ul").append($("<li>").attr({id:"md", onclick:"changeMarker(this.value)",value:i}).text(i+1+"일차"));
 		}
 		
 		 var movelineDay=new Array();
     	var mlday=[];
     	//좌표값 배열 생성
         <%for(Marker m:mList){%>
 			movelineDay.push(<%=m.getLonggitude()%>+","+<%=m.getLatitude()%>+","+<%=m.getMovelineDay()%>);
 		<%}%>
 		
 		
 		//위도,경도,일차 인덱스로 쪼개서 배열에 넣음
 		for(let i=0;i<<%=mList.size()%>;i++){		
 			mlday.push(movelineDay[i].split(","));
 		};
 	
 		//일차별로 배열인덱스에 넣음
 		let data={};
 		let markers={};
 		let mySet=new Set();
 		for(let i=0;i<mlday.length;i++){
 			mySet.add(mlday[i][2]);
 			//console.log(typeof mlday[i][j])
 		};
 		//key값으로 배열생성
 		for(let key of mySet){
 			//좌표배열
 			data[key]=[];
 			//마커배열
 			markers[key]=[];
 		};
 		//console.log(markers)
 		//일차별마커객체 생성	
 		
 		for(let i=0;i<mlday.length;i++){
 			//console.log(typeof mlday[i][2],mlday[i][0],mlday[i][1]);
  			data[mlday[i][2]].push(new kakao.maps.LatLng(Number(mlday[i][0]),Number(mlday[i][1])));
  			
  			//처음 생성된 지도의 중심 최표를 첫날 첫 장소로 지정
  			if(i==1){
  				//지도 생성
  				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
  		        mapOption = { 
  		            center: new kakao.maps.LatLng(Number(mlday[i][0]),Number(mlday[i][1])), // 지도의 중심좌표 (일차별 첫번째 장소로 지정)
  		            level: 5 // 지도의 확대 레벨 
  		        };
  				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
  			}
 		};
 		
 		//console.log(data);
 		
         var markerImageSrc = '<%=request.getContextPath()%>/images/mark.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
  
             creData(); // 일차별 마커를 생성하고 일차별마커 배열에 추가합니다
            
             //changeMarker(); // 지도에 마커가 보이도록 설정합니다    


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
         
         // 일차별 마커를 생성하고 일차별 마커 배열에 추가하는 함수입니다
         	//markers=[];
         
         	function creData() {
         		for(let j=1;j<<%=d%>+1;j++){
         			console.log(data[j].length)
 	        		for (var i = 0; i < data[j].length; i++) {  
 	        			
 	                    var imageSize = new kakao.maps.Size(35, 50),
 	                        imageOptions = {  
 	                            spriteOrigin: new kakao.maps.Point(10, 0),    
 	                            spriteSize: new kakao.maps.Size(55, 50)  
 	                        };     
 	                    
 	                    // 마커이미지와 마커를 생성합니다
 	                    var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
 	                        marker = createMarker(data[j][i], markerImage);  
 	                   	 		                    // 생성된 마커를 마커 배열에 추가합니다
 	                    	markers[j].push(marker);
 	                }
 	        		
 	            }	
 	        	
 	        }
         	//console.log(markers[1].length); 
         	
         	function setCenter(i) {            
         	   map.panTo(data[i][0])
         	}
 		
         	
         	
         	
         // 마커들 지도 표시 여부를 설정하는 함수입니다
         function setMarkers(map, su) {
         	//marker.setMap(null)
            for (var i = 1; i < <%=d%>+1; i++) {  
                 for(let j=0; j<markers[i].length;j++){
                 	//console.log(su)
                 	if(su == i-1){
                 		markers[i][j].setMap(map);
                 		setCenter(i);
                 	}else{
                 		markers[i][j].setMap(null);
                 	}
                 }
             }       
         }
         
         /* 거리출력기능  */
         //선을 생성합니다
         var polyline = new kakao.maps.Polyline({
 				map: map, // 선을 표시할 지도 객체
 				endArrow: true, // 선의 끝을 화살표로 표시되도록 설정한다
 				strokeWeight: 3, // 선의 두께
 				strokeColor: '#06093D', // 선 색
 				strokeOpacity: 0.9, // 선 투명도
 				strokeStyle: 'solid' // 선 스타일
 		});	

         
         //일차별 선 & 거리(미완) 출력
 		function line(value){
         	console.log(value)
 			 for (var i = 1; i < <%=d%>+1; i++) { 
 				 for(let j=0; j<data[i].length;j++){
 					 if( value == i-1){
 						 polyline.setPath(data[i]);
 						 //var distance=Math.round(polyline.getLength())
 						 //console.log(distance)
 						 polyline.setMap(map);
 					 }
 				  }		
 			 }
         } 
         
 	
         // 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
         function changeMarker(value){
         	for (var i = 0; i < <%=d%>; i++) {  
 	        	console.log(value)
 	                if ( value == i ) {
 	                    // 클릭일차 마커들만 지도에 표시하도록 설정합니다
 	                    setMarkers(map, i);
 	                    line(i);
 	            	} 
 	        }  	  
         };
        
        

    </script>
<%@ include file="/views/common/footer.jsp" %>