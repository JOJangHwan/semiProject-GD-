<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<h2>여행계획 리스트</h2>
				<button onclick="location.assign('<%=request.getContextPath()%>/searchMoveLine/searchMoveLine.do')">➕여행계획</button>
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
						
								<a href="<%=request.getContextPath()%>/searchMoveLine/searchMoveLine.do?movelineNo=<%=ml.getMovelineNo()%>">
								
								<%=ml.getMovelineName() %>
								</a>
							</td>
							<td><%=ml.getMovelineEnroll() %></td>
							<%-- <td><input type="hidden" name="userId" value="<%=loginMember.getUserId()%>"> --%>
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