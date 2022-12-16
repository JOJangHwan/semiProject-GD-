<%@page import="com.kjh.admin.model.vo.BoardTag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_css/kjh_style.css">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
	<script	src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>
<%
	String userId=(String)session.getAttribute("userId");
%>
<%@ page import="com.kjh.travelBoard.model.vo.TravelBoard" %>
<%@ include file="/views/common/header.jsp" %>
	<style>
		img{
			max-width:100%;
		}
	
		#titleArea{
			width:60%;
			height:auto;
			/* border:1px solid black; */
			margin: auto;
			
			font-family:'Do Hyeon', sans-serif;
			font-size:40px;
			font-weight:border;
			line-height:45px;
			padding-top:15px;
			padding-bottom:15px;
		}
		
		#lineLightGray{
			border:1px solid #D2D2D2;
			background-color:#D2D2D2;
			width:60%;
			margin:auto;
		}
		
		#tagArea{
			/* border:1px solid #D2D2D2; */
			height:30px;
		}
		
		#contentArea{
			padding-top:40px;
			padding-bottom:40px;
			width:60%;
			height:auto;
			/* border:1px solid black; */
			margin: auto;
		}
		
		#tagAndPick{
			border:1px solid black;
			width:60%;
			margin:auto;
			padding-top:20px;
			display:flex;
			justify-content:space-between;
		}
		
		#pickArea{
			width:20px;
			height:20px;
			border:1px solid green;
		}
		
		.moveTopBtn {
		  position: fixed;
		  bottom: 4rem;
		  right: 18rem;
		  width: 4rem;
		  height: 4rem;
		  border-radius:40px;
		  background-color:#F1C40F;
		  color: black;
		 }
		 
		 #buttonsContainer{
		 	width:60%;
		 	margin:auto;
		 	display:flex;
		 	justify-content:space-between;
		 }
		 
		 #mainListBtnContainer{
		 	
		 }
		 
		 #mainListBtnContainer>button{
		 	float:right;
		 	margin-bottom:40px;
		 }
		
	</style>
	<% TravelBoard board=(TravelBoard)request.getAttribute("board"); %>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    
		    <div id="mainSectionContainer">
		    	<div id=totalArea">
			    	<div id="titleArea">
			    	</div>
			    	
			    	<div id="lineLightGray"></div>
			    	<div id="tagAndPick">
				    	<div id="tagArea">
				    		<%if(board.getTags().isEmpty()) {%>
							<%}else{
								for(int i=0; i<board.getTags().size();i++){%>
									<button id="tagSearchBtn" name="tagSearchBtn"
										onclick="location.href='<%=request.getContextPath()%>/travelboard/travelboardtagsearch.do?tagTitle=<%=board.getTags().get(i).getTagTitle()%>';">
										#<%=board.getTags().get(i).getTagTitle()%>
									</button>
							   	<%}%>
							<%}%>
				    	</div>
				    	<div id="pickArea"
				    		onclick="location.href='<%=request.getContextPath()%>/travelboard/travelboardpickcontroll.do?boardNo=<%=board.getBoardNo()%>&pick=<%=board.getTravelPick()%>';"
	    						style="cursor:pointer;">
	    					<%if(board.getTravelPick()=='N'){ %>
	    						<div class="kjh_boardPostPick kjh_colorWhite"></div>
	    					<%}else if(board.getTravelPick()=='Y'){ %>
	    						<div class="kjh_boardPostPick kjh_colorYellow"></div>
	    					<%} %>
				    	</div>
			    	</div>
			    	<div id="contentArea">
			    	</div>
			    	
			    	<div class="moveTopBtn"><img src="<%=request.getContextPath()%>/images/forwardTopIcon.png" style="width:20px; height:20px; margin-top:20px; margin-left:22px;"></div>
			    	<div id="buttonsContainer">
			    		<%if(userId!=null&&userId.equals("admin")){ %>
			    			<div id="updateContainer">
				    		<button onclick="location.href='<%=request.getContextPath()%>/admin/travelboarddelete.do?boardNo=<%=board.getBoardNo()%>';"
				    			style="background-color:red; color:white;">삭제</button>
				    		<button onclick="location.href='<%=request.getContextPath()%>/admin/travelboardupdate.do?boardNo=<%=board.getBoardNo()%>';"
				    			style="background-color:gray; color:white;">수정</button>
				    		</div>
		    			<%}else{%>
				    		<div id="updateContainer">
				    		<button onclick=""
				    			style="background-color:red; color:white; display:none;">삭제</button>
				    		<button onclick=""
				    			style="background-color:gray; color:white; display:none;">수정</button>
				    	</div>
				    	<%} %>
				    	<div id="mainListBtnContainer">
				    		<button onclick="location.href='<%=request.getContextPath()%>/travelboard/travelboardmain.do';">목록으로</button>
				    	</div>
			    	</div>
		    	</div>
		    </div>
		    <script>
		    	$("#titleArea").html('<%=board.getBoardTitle()%>');
		    	$("#contentArea").html('<%=board.getBoardContent()%>');
		    	console.dir($("#titleArea").html());
		    	console.dir($("#content").html());
		    	
		    	const $topBtn = document.querySelector(".moveTopBtn");

		    	// 버튼 클릭 시 맨 위로 이동
		    	$topBtn.onclick = () => {
		    		window.scrollTo(0,0);
		    	}
		    </script>
		    
	    <div id="rightMarginMain"></div>
    </section>
<%@ include file="/views/common/footer.jsp" %>