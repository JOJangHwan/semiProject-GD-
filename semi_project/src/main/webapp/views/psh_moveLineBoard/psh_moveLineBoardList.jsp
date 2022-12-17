<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
				<div><h2>게시판</h2></div>
				<div><button onclick="location.assign('<%=request.getContextPath()%>/moveLineBoard/moveLineBoardView.do?boardNo=52&&moveLineNo=1')">상세 화면</button></div>
		    </div>
	    <div id="rightMarginMain"></div>
    </section>
<%@ include file="/views/common/footer.jsp" %>