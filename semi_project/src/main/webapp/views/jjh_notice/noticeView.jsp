<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.jjh.Notice.model.vo.Notice,com.jjh.member.model.vo.Member" %>
       <%
	Notice notices=(Notice)request.getAttribute("Notice");
   
   Member loginMember1=(Member)session.getAttribute("loginMember");
%> 
<%@ include file="/views/common/header.jsp" %>
<section id="notice-container">
        <table id="tbl-notice">
        <tr>
            <th>제 목</th>
            <td><%=notices.getNoticeTitle()%></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><%=notices.getNoticeWriter() %></td>
        </tr>
       
     
        <tr>
            <th>내 용</th>
            <td><%=notices.getNoticeContent()%></td>
        </tr>
        
        <tr>
            <th colspan="2">
                <input type="button" value="수정하기" onclick="location.assign('<%=request.getContextPath()%>/notice/noticeUpdate.do?NoticeNo=<%=notices.getNoticeNo()%>');">
                <input type="button" value="삭제하기" onclick="fn_deleteNotice('<%=notices.getNoticeNo()%>','<%=notices.getNoticeContent()%>');">
            </th>
        </tr>
    </table>
    </section>
	
    
    
    
    
 
    
    
    
     <style>
    section#notice-container{width:600px; margin:0 auto; text-align:center;}
    section#notice-container h2{margin:10px 0;}
    table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    </style>	


<%@ include file="/views/common/footer.jsp" %>	