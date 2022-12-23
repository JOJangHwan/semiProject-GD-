<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/css/moveline.css"> --%>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<%@page import="com.psh.moveline.model.vo.MoveLine"%>
<%@page import="java.util.List"%>
<%@ include file="/views/common/header.jsp" %>
 	<%-- <%= loginMember.getUserId()%> --%> 
    <%
        List<MoveLine> movelines=(List<MoveLine>)request.getAttribute("movelines");
   	%>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
				<div id="titleArea" name="titleArea">
		    			<label style="font-size:40px; font-family: 'Do Hyeon', sans-serif;">
		    				여행계획
		    			</label>
		    	
			    	<div>
						<button onclick="location.assign('<%=request.getContextPath()%>/moveLine/checkmoveline.do')">➕여행계획</button>
			    	</div>
				</div>
				<div class="lineGray"></div>
				
				<table id="tbl-board" style="text-align:center; justify-content: center;">
					<tr>
						<th>선택</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
					<%if(movelines.isEmpty()) {%>
					<%}else {
						for(MoveLine ml : movelines){%>
						<tr>
							<td><input type="checkbox"></td>
							<td>
								<a href="<%=request.getContextPath()%>/searchMoveLine/searchMoveLine.do?boardNo=<%=ml.getMovelineNo()%>">
								<%=ml.getMovelineName() %>
								</a>
							</td>
							<td><%=ml.getMovelineEnroll() %></td>
						</tr>
						<%}
					} %>  
				</table>
				<div id="pageBar">
					<%=request.getAttribute("pageBar") %>
				</div>
			</div>

	    <div id="rightMarginMain"></div>
<%-- 	    <script>
	    	function movelineInsert() {
	    		location.assign("<%=request.getContextPath()%>/moveLine/checkmoveline.do");
	    	}
	    </script> --%>
    </section>
<%@ include file="/views/common/footer.jsp" %>