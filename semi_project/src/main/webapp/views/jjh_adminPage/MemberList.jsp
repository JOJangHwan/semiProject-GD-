<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@  page import="java.util.List,com.jjh.Notice.model.vo.Notice,com.jjh.member.model.vo.Member" %>
   <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jjh_css/semantic.min.css">
   <%
	/* List<Notice> notices=(List<Notice>)request.getAttribute("notices"); */
	List<Member> members=(List<Member>)request.getAttribute("Members");
   
   
   
   Member loginMember1=(Member)session.getAttribute("loginMember");
%> 
<%@ include file="/views/common/header.jsp" %>
<section id="notice-container">
         <h2 class="ui teal image header">
                회원리스트
            </h2>

        <div class="ui large form">
                <div class="ui stacked segment">

                    <form action="<%=request.getContextPath()%>/notice/noticeListDelete.do" method="get">
                    <table class="ui celled table">
                        <thead>
                            <tr>
                            	<th>선택</th>
                                <th>번호</th>
                				<th>아이디</th>
                				<th>이메일</th>
                				<th>등록날짜</th>
                            </tr>
                            <%if(members.isEmpty()){ %>
            	<tr>
            		<td><h3>조회된 공지사항글이 없습니다.</h3></td>
            	</tr>
            	<%}else{ 
            		for(int i=0; i<members.size();i++){
            	%>
            	<tr>
            	<td>
            	
            		<input type="checkbox" name="open" value="<%=members.get(i).getUserNo()%>">
        
            		<input type="hidden"name="openNo" value="<%=members.get(i).getUserNo()%>">
            	</td>
            		<td><%=members.get(i).getUserNo() %></td>
            		<td><a href="<%=request.getContextPath()%>/notice/noticeView.do?noticeNo=<%=members.get(i).getUserNo() %>"><%=members.get(i).getUserId()%></a></td>
            		<td><%=members.get(i).getEmail() %></td>
            		<%-- <td>
						<%if(notices.get(i).getFilepath()!=null) {%>
							<img src="<%=request.getContextPath() %>/images/file.png" width="10" height="10">
						<%}else{ %>
						첨부파일 없음
						  <%} %>          		
        			</td> --%>
            		<td><%=members.get(i).getEnrollDate()%></td>
            	
            		
            		
            	
            		
            		
            	</tr>
            <%}%>
            	<%}%>
                        </thead>
                        <tbody id="list">
                        </tbody>
                    </table>
<!--                     <input type="submit" class="ui fluid large teal submit button" value="삭제하기">
 -->                    </form>
                       
                        <div id="pagebat">
        	<%=request.getAttribute("pageBar") %>
        </div>
                </div>

                <div class="ui error message"></div>

            </div>
        
    </section>


<%@ include file="/views/common/footer.jsp" %>	

 <style>
    section#notice-container{width:600px; margin:0 auto; text-align:center;}
    section#notice-container h2{margin:10px 0;}
    table#tbl-notice{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse;}
    table#tbl-notice th, table#tbl-notice td {border:1px solid; padding: 5px 0; text-align:center;} 
    </style>