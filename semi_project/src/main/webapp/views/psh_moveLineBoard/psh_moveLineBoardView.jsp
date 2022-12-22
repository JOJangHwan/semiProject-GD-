<%@page import="io.opentelemetry.exporter.logging.SystemOutLogRecordExporter"%>
<%@page import="com.psh.movelineboard.model.vo.Comment"%>
<%@page import="com.psh.movelineboard.model.vo.MoveLineBoard"%>
<%@page import="com.psh.marker.model.vo.Marker"%>
<%@page import="com.psh.moveline.model.vo.MoveLine"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   MoveLineBoard mlb=(MoveLineBoard)request.getAttribute("moveLineBoard");
   List<Marker> mList=(List<Marker>)request.getAttribute("mList");
   List<Comment> cList=(List<Comment>)request.getAttribute("cList");
   System.out.println(cList);
   int d=2;//일차값 이ㅏㅁ의로    
   %>
   <!-- 에디터 -->
	<!-- include libraries(jQuery, bootstrap)-->
    <!-- 지도 -->

	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfdc04e10d578470d49a9fd29e8c0536"></script>
    <style>
    	#pickMLB, .pickMLB{width: 15px; height: 15px;}
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
<%@ include file="/views/common/header.jsp"%>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
					<!-- 제목 -->
				    <div >
					   <h1><%=mlb.getBoardTitle() %></h1>
				    </div>
					<div>
						<p>작성자 <%=mlb.getUserId()%></p>  
						<input type="hidden" name="mlbWriter" value="<%=mlb.getUserId()%>" readonly>
						<input type="hidden" name="mlNo" value="<%=mlb.getMovelineNo()%>" readonly>
					</div>
					<!-- 찜하기 -->
					<div class="pickMLB">
						<img id="pickMLB" src="<%=request.getContextPath()%>/images/pickoff.png">
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
							<%for(int i=0;i<d;i++){%>
						<div id="info">
							<div id="infoTitle">
								<div value=i><h3><%=i+1%>일차</h3></div>
								<div><h3>No.</h3></div>
								<div><h3>장소명</h3></div>
								<div><h3>주소</h3></div>
								<div><h3>메모</h3></div>
							</div>
							<div id=infoContentBox value=i>
							<%for(Marker m: mList){%>
							
									<%if(Integer.parseInt(m.getMovelineDay())==i+1){%>
										<div id="infoContent">
											<div><h4><%=m.getMarkerNo()%></h4></div>
											<div><h4><%=m.getPlaceName()%></h4></div>
											<div><h4><%=m.getAddress()%></h4></div>
											<div><h4><%=m.getMemo()%></h4></div>
										</div>
									<%}%>
							<%}%>
							</div>
						</div>
					<%}%>
					
					</div>
					
					<!-- 게시글 내용 -->   
				   <div id="boardContainer"></div>
				  
				   <!-- 댓글 -->   
				   <div id="commentBox">
                   	<div id="commentEditor">
	                   	<div>
	                   		<textarea name=content cols="60" rows="2"></textarea>
	                   		<input type="hidden" name="boardNo" value=<%=mlb.getBoardNo()%>>
	                   		<input type="hidden" name="commentLevel" value="1">
	                   		<input type="hidden" name="commentRef" value="0">
	                   		<input type="hidden" name="commentWriter" value="<%=loginMember.getUserId()%>"><%-- <%=loginMember!=null?loginMember.getUserId():""%> --%>
	                   		<button id="commentInsert">등록</button>
	                   	</div>
                   	</div>
                   	<div id=commentPrint>
                   		<%if(!cList.isEmpty()){
                   			for(Comment c:cList){%>
                   				<%if(c.getMoveLineBoardlevel()==1){%>
		                   			<div class="level1">
			                   			<div class="commentIn">
			                   				<sub class="writer"><%=c.getUserId() %></sub>
			                   				<sub class="commentdate"><%=c.getCommentEnroll()%></sub>
			                   				<h5><%=c.getCommentContent()%></h5>
			                   				<input name="commentNo" value="<%=c.getCommentNo()%>" type="hidden">
			                   			</div>
			                   			<div class=commentBtns>
						                   	<%if(loginMember!=null){%>
						                   			<button class="reComment" onclick="reComment(event);" value="<%=c.getCommentNo()%>">답글</button>
						                   	<%}%>
						                   	<%if(loginMember!=null&&(loginMember.getUserId().equals("admin")||loginMember.getUserId().equals(c.getUserId()))) {%>
								   						<button name="commentNo" onclick="commentDelete(event);"value="<%=c.getCommentNo()%>">삭제</button>
								   						<button name="commentNo" onclick="commentUpdate(event);"value="<%=c.getCommentNo()%>">수정</button>
								   			<%}%>
			                   			</div>
			                  		 </div>
		                   		<%}else{%>
		          					<div class="level2">
					   					<div>
					   						<sub class="writer"><%=c.getUserId() %></sub>
			                   				<sub class="commentdate"><%=c.getCommentEnroll()%></sub>
			                   				<h5><%=c.getCommentContent()%></h5>
			                   				<input name="commentNo" value="<%=c.getCommentNo()%>" type="hidden">
					   					</div>
					   					<div>
			
						                   	<%if(loginMember!=null&&(loginMember.getUserId().equals("admin")||loginMember.getUserId().equals(c.getUserId()))) {%>
								   						<button name="commentNo" onclick="commentDelete(event);"value="<%=c.getCommentNo()%>">삭제</button>
								   						<button name="commentNo" onclick="commentUpdate(event);"value="<%=c.getCommentNo()%>">수정</button>
								   			<%}%>
					   					</div>
						   					
					   				</div>
					   			
					   			<%}
					   		}%>
					   	<%}%>

                   </div>
				   
				   <!-- 수정 삭제 버튼 -->
				  <%if(loginMember!=null&&(loginMember.getUserId().equals("admin")||loginMember.getUserId().equals(mlb.getUserId()))){%>
						<div id="mlbBtns">
				    		<button  onclick="location.assign('<%=request.getContextPath()%>/moveLineBoard/updateMoveLineBoard.do?boardNo=<%=mlb.getBoardNo()%>&&moveLineNo=<%=mlb.getMovelineNo()%>')">수 정</button>
							<button  onclick="location.assign('<%=request.getContextPath()%>/moveLineBoard/deleteMoveLineBoard.do?boardNo=<%=mlb.getBoardNo()%>')">삭 제</button>
				   		</div>	  
					<%} %>
				   
             </div>
	    <div id="rightMarginMain"></div>
    </section>
    
	<script>
		$("#pickMLB").click(e=>{
            if($("#pickMLB").src="<%=request.getContextPath()%>/images/pickoff.png"){
				insertPicMLB();
			}else if($("#pickMLB").src="<%=request.getContextPath()%>/images/pickon.png") 
				$("#pickMLB").src="<%=request.getContextPath()%>/images/pickoff.png"
				deletePickMLB();
		})
		//찜 등록
		function insertPicMLB(){
			console.log("<%=mlb.getBoardNo()%>")
			$.ajax({
				url:"<%=request.getContextPath()%>/pick/insertPick.do",
				dataType:"text",
				data:{
					"boardNo":"<%=mlb.getBoardNo()%>",
					"commentWriter":"<%=mlb.getUserId()%>"
				},
				success:data=>{
					//console.log(data["boardNo"])
					if(data>0){
						$("#pickMLB").src="<%=request.getContextPath()%>/images/pickon.png";
					}else{
						$("#pickMLB").src="<%=request.getContextPath()%>/images/pickoff.png";
					}
					
				}
			})
		}
		//찜 삭제
		function deletePickMLB(e){
			$.ajax({
				url:"<%=request.getContextPath()%>/pick/deletePick.do",
				dataType:"text",
				data:{
					"boardNo":$(e.target).siblings("input[name=boardNo]").val(),
					"commentWriter":$(e.target).siblings("input[name=commentWriter]").val()
				},
				success:data=>{
					//console.log(data["boardNo"])
					if(data>0){
						$("#pickMLB").src="<%=request.getContextPath()%>/images/pickoff.png";
					}else{
						$("#pickMLB").src="<%=request.getContextPath()%>/images/pickon.png";
						
					}
					
				}
			})
		}

		//댓글등록
		$("#commentInsert").click(e=>{
			
			$.ajax({
				url:"<%=request.getContextPath()%>/moveLineBoard/moveLineBoardComment.do",
				dataType:"Json",
				data:{
					"content":$(e.target).siblings("textarea[name=content]").val(),
					"boardNo":$(e.target).siblings("input[name=boardNo]").val(),
					"commentLevel":$(e.target).siblings("input[name=commentLevel]").val(),
					"commentRef":$(e.target).siblings("input[name=commentRef]").val(),
					"commentWriter":$(e.target).siblings("input[name=commentWriter]").val(),
				},
				success:data=>{
					//console.log(data["boardNo"])
					if(data!=null){
						commentList(data["userId"]);
					}else{
						console.log("실패")
					}
					/* const div=$("<div>")
					const addDiv=$("<div>")
					const sub=$("<sub>").html(data["userId"])
					const sub2=$("<sub>").html(data["commentEroll"])
					const h5=$("<h5>").html(data["commentContent"])
					addDiv.append(sub).append(sub2).append(h5).append(addDiv)
							
					const comBtns=$("<div>")
					const replybtn=$("<button[class:reComment]>").val(data["commentNo"]).text("답글")
					const updatebtn=$("<button>").text("수정")
					const deletebtn=$("<button>").text("삭제")
					comBtns.append(updatebtn).append(deletebtn).append(replybtn)
					div.append(addDiv).append(comBtns)
					//console.log($(e.target).parents("#commentEditor").next()[0])
					div.insertAfter($(e.target).parents("#commentEditor"))
					$("textarea[name=content]").val("") */
				}
			})
			
			
		});
		
		
		//답글작성칸 출력
		function reComment(e){
			console.log(e)
    		const rediv=$("<div>")
    		const rediv2=$("<div>");
    		const retextarea=$("<textarea>").attr({"rows":"1","name":"content"});
    		const reinputlevel=$("<input>").attr({"name":"commentLevel","type":"hidden"}).val("2");
    		const reinputboardNo=$("<input>").attr({"name":"boardNo","type":"hidden"}).val(<%=mlb.getBoardNo()%>);
    		const reinputWriter=$("<input>").attr({"name":"commentWriter","type":"hidden"}).val("user01");//로그인 유저 아이디로 변경
    		const reinputRef=$("<input>").attr({"name":"commentRef","type":"hidden"}).val($(e.target).val());
    		const rebtn=$("<button>").attr({"id":"commentinsert2"}).text("등록");
    		rebtn.on("click",reply);
    		/* div2.find("input[name=level]").val("2");
    		div2.find("input[name=commentRef]").val($(e.target).val());
    		div2.find("button[id=commentInsert]").removeAttr("id").attr("id","commentinsert2"); */
    		rediv2.append(retextarea).append(reinputlevel).append(reinputboardNo).append(reinputWriter).append(reinputRef).append(rebtn)
    		rediv.append(rediv2);
    		rediv.insertAfter($(e.target).parents()[1]);
			//$(e.target).off("click");
			
    	};
		//답글 저장
		function reply(e){
			console.log(e.target);
			$.ajax({
				url:"<%=request.getContextPath()%>/moveLineBoard/moveLineBoardComment.do",
				dataType:"Json",
				data:{
					"content":$(e.target).siblings("textarea[name=content]").val(),
					"boardNo":$(e.target).siblings("input[name=boardNo]").val(),
					"commentLevel":$(e.target).siblings("input[name=commentLevel]").val(),
					"commentRef":$(e.target).siblings("input[name=commentRef]").val(),
					"commentWriter":$(e.target).siblings("input[name=commentWriter]").val(),
				},
				success:data=>{
					commentList();
					/* const div=$("<div>")
					const addDiv=$("<div>")
					const sub=$("<sub>").html(data["userId"])
					const sub2=$("<sub>").html(data["commentEroll"])
					const h5=$("<h5>").html(data["commentContent"])
					const input=$("<input>").val(data["commentNo"])
					addDiv.append(sub).append(sub2).append(h5).append(input).append(addDiv)
							
					const comBtns=$("<div>")
					const deletebtn=$("<button>").text("수정")
					const updatebtn=$("<button>").text("삭제")
					comBtns.append(deletebtn).append(updatebtn)
					div.append(addDiv).append(comBtns)
					console.log($(e.target))
					div.insertAfter($(e.target).parents()[1]) */
					//$("<div[name=re]>").html("")
				}
			})
			
		}
		
		
		//댓글수정 정보입력 출력
		function commentUpdate(e){
			console.log($(e.target).val())
    		const updiv2=$("<div>");
    		const uptextarea=$("<textarea>").attr({"rows":"1","name":"commentContent"});
    		const upbtn=$("<button>").val($(e.target).val()).text("등록");
    		upbtn.on("click",replyUpdate);
    		
    		updiv2.append(uptextarea).append(upbtn)
    		updiv2.insertAfter($(e.target).parents()[1]);
			
		}
		//댓글 수정
		function replyUpdate(e){
			$.ajax({
				url:"<%=request.getContextPath()%>/comment/updateComment.do",
				data:{
					"commentContent":$("textarea[name=commentContent]").val(),
					"commentNo":$("input[name=commentNo]").val()
				},
				success:data=>{
					console.log(data)
					if(data>0){
						commentList("<%=loginMember.getUserId()%>");
					}else{
						console.log("실패")
					}
				}
			})
		}
		
		//댓글 삭제 
		function commentDelete(e){
			//console.log($("textarea[name=content]"))
			$.ajax({
				url:"<%=request.getContextPath()%>/comment/deleteComment.do",
				data:{
					"commentNo":$("input[name=commentNo]").val()
				},
				success:data=>{
					console.log(data)
					if(data>0){
						commentList();
					}else{
						console.log("실패")
					}
				}
			})
		}
		//댓글 출력
		function commentList(userId){
			console.log("테스트3" + userId);
			$.ajax({
				url:"<%=request.getContextPath()%>/comment/listComment.do",
				dataType:"Json",
				data:{
					"boardNo":<%=mlb.getBoardNo()%>
				},
				success:data=>{
					$("#commentPrint").text("")
					data.forEach((v)=>{
						console.log(typeof v["userId"])
						const commentPrint=$("<div>")
						const commentIn=$("<div>")
						const sub=$("<sub>").html(v["userId"])
						const sub2=$("<sub>").html(v["commentEnroll"])
						const h5=$("<h5>").html(v["commentContent"])
						const input=$("<input>").val(v["commentNo"]).attr({"type":"hidden","name":"commentNo"})
						commentIn.append(sub).append(sub2).append(h5).append(input)
						
						const comBtns=$("<div>")
						const replybtn=$("<button>").val(v["commentNo"]).attr({"class":"reComment"}).text("답글").val(v["commentNo"])
						const deletebtn=$("<button>").val(v["commentNo"]).attr({"class":"commentDelete"}).text("삭제")
						const updatebtn=$("<button>").val(v["commentNo"]).attr({"class":"commentUpdate"}).text("수정").val(v["commentNo"])
						
						deletebtn.on("click",commentDelete);
						updatebtn.on("click",commentUpdate);
						replybtn.on("click",reComment);
						//로그인 유저 아이디와 댓글 아이디가 같다면
						//console.log("테스트" , comBtns);
						//console.log("테스트2", userId);
						
						if(v["moveLineBoardlevel"]==1&&(v["userId"]!=userId||userId!="admin")){
							comBtns.append(replybtn)
						}
						else if(v["moveLineBoardlevel"]==1&&(v["userId"]==userId||userId=="admin")){
							comBtns.append(deletebtn).append(updatebtn).append(replybtn)
						}
						else if(v["moveLineBoardlevel"]==2&&(v["userId"]!=userId||userId!="admin")){
							
						}
						else if(v["moveLineBoardlevel"]==2&&(v["userId"]==userId||userId=="admin")){
							comBtns.append(deletebtn).append(updatebtn)
						} 
						
						
						//comBtns.append(deletebtn).append(updatebtn).append(replybtn)
						commentPrint.append(commentIn).append(comBtns)
						
						$("#commentPrint").append(commentPrint);
					})
				}
			})
		};
		
 		//카테고리ㅌ
 		for(let i=0;i<<%=d%>;i++){
 			$(".category>ul").append($("<li>").attr({id:"md", onclick:"changeMarker(this.value)",value:i}).text(i+1+"일차"));
 	 	}
 		
 		$("#boardContainer").html('<%=mlb.getBoardContent()%>');
 		
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