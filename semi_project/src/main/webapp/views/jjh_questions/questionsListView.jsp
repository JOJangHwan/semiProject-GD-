<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.jjh.questions.model.vo.Questions,com.jjh.member.model.vo.Member" %>
<%
	List<Questions> questions=(List<Questions>)request.getAttribute("questions");
Member loginMember1=(Member)session.getAttribute("loginMember");
%>
    
    
<%@ include file="/views/common/header.jsp" %>
<section id="notice-container">
        <h2>문의사항</h2>
        <input id="btn-add" type="button" value="글쓰기" onclick="location.assign('<%=request.getContextPath()%>/questions/questionsWrite.do');">
        <table id="tbl-notice">
            <tr>
            
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>삭제</th>
            </tr>
	
        <%if(questions.isEmpty()){ %>
            	<tr>
            		<td><h3>조회된 공지사항글이 없습니다.</h3></td>
            	</tr>
            	<%}else{ 
            		for(int i=0; i<questions.size();i++){
            	%>
            	<tr>
            		<td><%=questions.get(i).getQuestionsNo() %></td>
            		<td><a href="<%=request.getContextPath()%>/question/questionView.do?questionsNo=<%=questions.get(i).getQuestionsNo() %>"><%=questions.get(i).getQuestionsTitle()%></a></td>
            		<td><%=questions.get(i).getQuestionsWriter() %></td>
            		<%-- <td>
						<%if(notices.get(i).getFilepath()!=null) {%>
							<img src="<%=request.getContextPath() %>/images/file.png" width="10" height="10">
						<%}else{ %>
						첨부파일 없음
						  <%} %>          		
        			</td> --%>
            		<td><%=questions.get(i).getQuestionsEnroll()%></td>
            		<td><a href="<%=request.getContextPath()%>/questions/questionsDelete.do?QuestionNo=<%=questions.get(i).getQuestionsNo()%>"></a></td>
            		
            	</tr>
            <%}%>
            	<%}%>

        </table>
        <div id="pagebat">
        	<%=request.getAttribute("pageBar") %>
        </div>
    </section>

<%@ include file="/views/common/footer.jsp" %>	

 <style>
    section#notice-container{width:600px; margin:0 auto; text-align:center;}
    section#notice-container h2{margin:10px 0;}
    table#tbl-notice{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse;}
    table#tbl-notice th, table#tbl-notice td {border:1px solid; padding: 5px 0; text-align:center;} 
    </style>
    
    
    <script>
    
    </script>