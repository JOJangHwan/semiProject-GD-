<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@  page import="java.util.List,com.jjh.Notice.model.vo.Notice,com.jjh.member.model.vo.Member" %>
  
   <%
	List<Notice> notices=(List<Notice>)request.getAttribute("notices");
   
   Member loginMember1=(Member)session.getAttribute("loginMember");
%> 
<%@ include file="/views/common/header.jsp" %>
<section id="notice-container">
        <h2>공지사항</h2>
         <%if(loginMember1!=null && loginMember1.getUserId().equals("admin")) { %>
        <input type="button" value="글쓰기" onclick="location.assign('<%=request.getContextPath()%>/notice/noticewrite.do');">
        <%}%>
        <table id="tbl-notice">
            <tr>
            
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
            <%if(notices.isEmpty()){ %>
            	<tr>
            		<td><h3>조회된 공지사항글이 없습니다.</h3></td>
            	</tr>
            	<%}else{ 
            		for(int i=0; i<notices.size();i++){
            	%>
            	<tr>
            		<td><%=notices.get(i).getNoticeNo() %></td>
            		<td><a href="<%=request.getContextPath()%>/notice/noticeView.do?NoticeNo=<%=notices.get(i).getNoticeNo() %>"><%=notices.get(i).getNoticeTitle()%></a></td>
            		<td><%=notices.get(i).getNoticeWriter() %></td>
            		<%-- <td>
						<%if(notices.get(i).getFilepath()!=null) {%>
							<img src="<%=request.getContextPath() %>/images/file.png" width="10" height="10">
						<%}else{ %>
						첨부파일 없음
						  <%} %>          		
        			</td> --%>
            		<td><%=notices.get(i).getNoticeEnroll() %></td>
            	
            		
            		
            	
            		
            		
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