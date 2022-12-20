<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jjh_css/semantic.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/subMain.css">
<%@ include file="/views/common/header.jsp" %>
	<section id="mainSection">
	<div class="ui middle aligned center aligned grid">
        <div class="column">
            <h2 class="ui teal image header">
 				비밀번호 찾기
            </h2>
            <form class="ui large form" form id="searchPassword" action="<%=request.getContextPath()%>/search/searchPasswordEnd.do" method="post">
                <div class="ui stacked segment">
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="text" id="u_id" placeholder="아이디" name="userId" >
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="text" id="phone" placeholder="전화번호" name="phone">
                        </div>
        
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="email" id="email" placeholder="이메일" name="email">
                        </div>
        
                    </div>
                    <input type="submit" value="비밀번호찾기" class="ui fluid large teal submit button" id = "login_btn">
                     
                   
                </div>

                <div class="ui error message"></div>

            </form>

            <div class="ui message">
                로그인 할 계정이 없다면 <a href="<%=request.getContextPath()%>/member/enrollMember.do">여기</a>를 눌러주세요.
            </div>
        </div>
    </div>

	</section>


   <%@ include file="/views/common/footer.jsp" %>
        
        
        
      <style>
  section#mainSection{width:300px; margin:0 auto; text-align:center;}
    section#mainSection h2{margin:10px 0;}
</style>
