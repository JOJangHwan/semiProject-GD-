<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jjh_css/semantic.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/subMain.css">

	<section id="mainSection">
	

	</section>
	
	<section id="mainSection">
        <div class="ui middle aligned center aligned grid">
        <div class="column">
            <h2 class="ui teal image header">
 				내 찜 리스트
            </h2>
                <div class="ui stacked segment">
                     <a href="<%=request.getContextPath()%>/mypick/travelpicklist.do?userid=<%=loginMember.getUserId()%>"><button class="ui fluid large teal submit button">찜한 여행지 리스트</button></a>
                      <br>  
                     <a href="<%=request.getContextPath()%>/member/memberupdate.do"><button class="ui fluid large teal submit button">찜한 추천 동선 리스트</button></a>
                </div>


            <div class="ui message">
                메인화면으로 이동 하고 싶으면 <a href="<%=request.getContextPath()%>">여기</a>를 눌러주세요.
            </div>
        </div>
    </div>
    </section>
	
	  <%@ include file="/views/common/footer.jsp" %>
	  
	  
	        <style>
  section#mainSection{width:300px; margin:0 auto; text-align:center;}
    section#mainSection h2{margin:10px 0;}
</style>
	  

