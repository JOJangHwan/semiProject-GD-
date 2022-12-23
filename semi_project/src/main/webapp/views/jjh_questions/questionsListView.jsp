<%@page import="oracle.net.aso.q"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jjh_css/semantic.min.css">
    <%@ page import="java.util.List,com.jjh.questions.model.vo.Questions,com.jjh.member.model.vo.Member" %>
<%
	List<Questions> questions=(List<Questions>)request.getAttribute("questions");
Member loginMember1=(Member)session.getAttribute("loginMember");
%>
    
    
<%@ include file="/views/common/header.jsp" %>
    <section id="notice-container">
         <h2 class="ui teal image header">
                문의사항
            </h2>

        <div class="ui large form">
                <div class="ui stacked segment">
                <%if(loginMember!=null&&!loginMember.getUserId().equals("admin")) { %>
                    <a href="<%=request.getContextPath()%>/questions/questionsDelete.do"><button class="ui fluid large teal submit button">문의사항 작성하기</button></a>
                    <%}%>
                    <form action="<%=request.getContextPath()%>/questions/questionsListDelete.do" method="get">
                    <table class="ui celled table">
                        <thead>
                            <tr>
                            	<th><input type='checkbox' name="open" value='전체선택'onclick='selectAll(this)'/> <b>전체선택 </th>
                                <th>번호</th>
                				<th>제목</th>
                				<th>작성자</th>
                				<th>작성일</th>
                				<th>공개여부</th>
                            </tr>
                            <%if(questions.isEmpty()){ %>
            	<tr>
            		<td><h3>조회된 문의사항 글이 없습니다.</h3></td>
            	</tr>
            	<%}else{ 
            		for(int i=0; i<questions.size();i++){
            	%>
            	<tr>
            	<td>
            	
            		<input type="checkbox" name="open" value="<%=questions.get(i).getOpenAndclose()%>">
        
            		<input type="hidden"name="openNo" value="<%=questions.get(i).getOpenAndclose()%>">
            	</td>
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
            		<td><%=questions.get(i).getQuestionsEnroll() %></td>
            		<td><%=questions.get(i).getOpenAndclose() %></td>
            		
            	
            		
            		
            	
            		
            		
            	</tr>
              </thead>
                        <tbody id="list">
                        </tbody>
                    </table>
                   <%--  <%if(loginMember.getUserId().equals("admin")) %> --%>
                    <!-- <input type="submit" class="ui fluid large teal submit button" value="삭제하기"> -->
                    <%}%>
            	<%}%>
                      
                    </form>
                       
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
    
    
    <script>
    function selectAll(selectAll)  {
    	  const checkboxes 
    	       = document.getElementsByName('open');
    	  
    	  checkboxes.forEach((checkbox) => {
    	    checkbox.checked = selectAll.checked;
    	  })
    	}
    
    </script>