<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jjh_css/semantic.min.css">
    <%@ page import="java.util.List,com.jjh.Notice.model.vo.Notice,com.jjh.member.model.vo.Member" %>
       <%
	Notice notices=(Notice)request.getAttribute("Notice");
   
   Member loginMember1=(Member)session.getAttribute("loginMember");
%> 
<%@ include file="/views/common/header.jsp" %>
<section id="notice-container">
     <div class="ui middle aligned center aligned grid">
        <div class="column">
            <h2 class="ui teal image header">
                공지사항 보기
            </h2>
            <form class="ui large form">
                <div class="ui stacked segment">
                    <div class="field">
                    	
                        <input type="text" id="b_title" placeholder="게시글 제목" autocomplete="off" autofocus="autofocus" value="제목  <%=notices.getNoticeTitle()%>" readonly>
                        <br>
                        <input type="text" id="b_title" placeholder="작성자" autocomplete="off" autofocus="autofocus"value="작성자 <%=notices.getNoticeWriter()%>" readonly>
                        
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                  
                            <textarea style="resize: vertical;" id="b_title" placeholder="게시글 내용" rows="8"  readonly><%=notices.getNoticeContent()%></textarea>
                        </div>
                    </div>
                   
                   
                    <br>
                </div>

                <div class="ui error message"></div>

            </form>
            
            <a href="<%=request.getContextPath()%>/notice/updateNotice.do?noticeNo=<%=notices.getNoticeNo()%>"><button class="ui fluid large teal submit button">수정하기</button></a>
            <br>
            <a href="<%=request.getContextPath()%>/notice/noticeListDelete.do?open=<%=notices.getNoticeNo()%>"><button class="ui fluid large teal submit button">삭제하기</button></a>
			<br>
            <a href="<%=request.getContextPath()%>/notice/noticeListView.do"><button class="ui fluid large teal submit button">뒤로가기</button></a>
            <br>
        </div>
    </div>
    </section>
    
    
	
    
    
    
    
 
    
    
    
     <style>
    section#notice-container{width:600px; margin:0 auto; text-align:center;}
    section#notice-container h2{margin:10px 0;}
    table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    </style>	


<%@ include file="/views/common/footer.jsp" %>	