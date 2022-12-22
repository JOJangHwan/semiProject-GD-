<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jjh_css/semantic.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/subMain.css">

<%Cookie[] cookies=request.getCookies();
	String saveId=null;
	if(cookies!=null){
		for(Cookie c:cookies){
			if(c.getName().equals("saveId")){
				saveId=c.getValue();
				break;
			}
		}
	} %>

<!--카카오 로그인-->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js" 
integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/" crossorigin="anonymous"></script>
  <script>
  // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해야 합니다.
  Kakao.init('b39ac3f3968d9d1ab2abc39538c8b218');

  // SDK 초기화 여부를 판단합니다.
  console.log(Kakao.isInitialized());
</script>

<%@ include file="/views/common/header.jsp" %>
    
        
        <section id="mainSection">
        <div class="ui middle aligned center aligned grid">
        <div class="column">
            <h2 class="ui teal image header">
 				아이디찾기
            </h2>
            <form class="ui large form" form id="loginFrm" action="<%=request.getContextPath()%>/search/searchIDEnd.do" method="post">
                <div class="ui stacked segment">
                    <div class="field">
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="password" id="password" placeholder="비밀번호" name="password">
                        </div>
                        <br>
                        <br>
                        <div class="ui left icon input">
                            <input type="text" id="phone" placeholder="전화번호" name="phone">
                        </div>
                        <br>
                        <br>
                    	<div class="ui left icon input">
                            <input type="text" id="email" placeholder="이메일" name="email">
                             <br>
                        </div>
                    <br>
                    	<input type="submit" class="ui fluid large teal submit button" value="이메일 발송"> 
         
                    </div>
                
                </div>

                <div class="ui error message"></div>

            </form>

            <div class="ui message">
                로그인 할 계정이 없다면 <a href="<%=request.getContextPath()%>/login/enrollMember.do">여기</a>를 눌러주세요.
            </div>
        </div>
    </div>
    </section>
    
        <%@ include file="/views/common/footer.jsp" %>
        
        
        
      <style>
  section#mainSection{width:300px; margin:0 auto; text-align:center;}
    section#mainSection h2{margin:10px 0;}
</style>









	
<script type="text/javascript">
const search=()=>{
	  location.assign("<%=request.getContextPath()%>/search/searchPassWord.do");
}

const searchId=()=>{
	location.assign("<%=request.getContextPath()%>/search/searchId.do");
}

</script>
 

</body>