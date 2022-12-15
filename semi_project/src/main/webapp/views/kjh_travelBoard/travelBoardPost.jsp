<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_css/kjh_style.css">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script	src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>
<%@ include file="/views/common/header.jsp" %>
	<style>
		img{
			width:100%;
		}
	
		#titleArea{
			width:60%;
			height:50px;
			/* border:1px solid black; */
			margin: auto;
			
			font-family:'Do Hyeon', sans-serif;
			font-size:40px;
			font-weight:border;
			padding-bottom:60px;
		}
		
		#lineLightGray{
			border:1px solid #D2D2D2;
			background-color:#D2D2D2;
			width:60%;
			margin:auto;
		}
		
		#tagArea{
			border:1px solid #D2D2D2;
			width:60%;
			height:50px;
			margin:auto;
			padding-top:20px;
		}
		
		#contentArea{
			padding-top:40px;
			width:60%;
			height:auto;
			/* border:1px solid black; */
			margin: auto;
		}
		
	</style>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <%
		    	String title=(String)request.getAttribute("titleInput");
		    	String content=(String)request.getAttribute("contentInput");
		    	System.out.println(title);
		    	System.out.println(content);
		    %>
		    <div id="mainSectionContainer">
		    	<div id=totalArea">
			    	<div id="titleArea">
			    	</div>
			    	
			    	<div id="lineLightGray"></div>
			    	<div id="tagArea">
			    		<button>#태그</button>
			    	</div>
			    	<div id="contentArea">
			    	</div>
		    	</div>
		    </div>
		    <script>
		    	$("#titleArea").html('<%=title%>');
		    	$("#contentArea").html('<%=content%>');
		    	console.dir($("#titleArea").html());
		    	console.dir($("#content").html());
		    </script>
		    
	    <div id="rightMarginMain"></div>
    </section>
<%@ include file="/views/common/footer.jsp" %>