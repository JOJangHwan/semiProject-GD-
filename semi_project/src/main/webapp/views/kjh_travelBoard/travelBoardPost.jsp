<%@page import="com.kjh.admin.model.vo.BoardTag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_css/kjh_style.css">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script	src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>
<%@ page import="com.kjh.travelBoard.model.vo.TravelBoard" %>
<%@ include file="/views/common/header.jsp" %>
	<style>
		img{
			width:auto;
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
			width:60%;
			height:50px;
			margin:auto;
			padding-top:20px;
		}
		
		#contentArea{
			padding-top:40px;
			padding-bottom:40px;
			width:60%;
			height:auto;
			/* border:1px solid black; */
			margin: auto;
		}
		
	</style>
	<% TravelBoard board=(TravelBoard)request.getAttribute("board"); %>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <%
		    	/* String title=(String)request.getAttribute("titleInput");
		    	String content=(String)request.getAttribute("contentInput");
		    	System.out.println(title);
		    	System.out.println(content); */
		    %>
		    <div id="mainSectionContainer">
		    	<div id=totalArea">
			    	<div id="titleArea">
			    	</div>
			    	
			    	<div id="lineLightGray"></div>
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
			    	<div id="contentArea">
			    	</div>
		    	</div>
		    </div>
		    <script>
		    	$("#titleArea").html('<%=board.getBoardTitle()%>');
		    	$("#contentArea").html('<%=board.getBoardContent()%>');
		    	console.dir($("#titleArea").html());
		    	console.dir($("#content").html());
		    </script>
		    
	    <div id="rightMarginMain"></div>
    </section>
<%@ include file="/views/common/footer.jsp" %>