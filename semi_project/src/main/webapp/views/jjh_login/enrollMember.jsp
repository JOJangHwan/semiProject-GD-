<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jjh_css/semantic.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/subMain.css">
  <%@ include file="/views/common/header.jsp" %>
    
        <section id="mainSection">
        
    
          	
          		<form name="enrollerMemberFrm" action="<%=request.getContextPath() %>/login/enrollerMemberEnd.do" method="post">
          		
          			<div class="ui middle aligned center aligned grid">
        <div class="column">
        <br>
            <h2 class="ui teal image header">
                회원가입 페이지
            </h2>
            <div class="ui large form">
                <div class="ui stacked segment">
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="text" id="u_id" placeholder="아이디" autofocus autocomplete="off" name="userId">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="text" id="u_id" placeholder="닉네임" autofocus autocomplete="off" name="nickName">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="password" id="u_pw" placeholder="비밀번호" name="password">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="password" id="u_pw2" placeholder="비밀번호 확인" name="chpassword">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="number" id="u_pw2" placeholder="나이" name="age">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="text" id="u_pw2" placeholder="주소" name="address">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="email" id="u_pw2" placeholder="이메일" name="email">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="tel" id="u_pw2" placeholder="전화번호" name="phone">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                           
                            성별
          						남<input type="radio" name="gender" value="남" id="u_pw2">
          						여<input type="radio" name="gender" value="여" id="u_pw2">
                        </div>
                    </div>
                    <input class="ui fluid large teal submit button" id="register_btn" type="submit" value="회원가입">
                </div>

                <div class="ui error message"></div>

            </div>

            <div class="ui message">
                로그인 할 계정이 있다면 <a href="/coco/">여기</a>를 눌러주세요.
            </div>
        </div>
    </div>
          			
          			 
          		</form>
          	
          
            
        </section>
         <style>
    section#mainSection{width:400px; margin:0 auto; text-align:center;}
    </style>
        
        
    
   <%@ include file="/views/common/footer.jsp" %>   