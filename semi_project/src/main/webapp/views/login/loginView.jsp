<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/subMain.css">
<%@ include file="/views/common/header.jsp" %>
    
        <section id="mainSection">
            <div>
            	<form id="loginFrm" action="" method="post">
                    <table>
                        <tr>
                            <td>
                                아이디 <input type="text" name="loginId">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                비밀번호 <input type="password" name="password">
                            </td>
                            <td>
                                <input type="button" value="로그인">
                                <a id="kakao-login-btn" href="javascript:loginWithKakao()">
  								<img src="<%=request.getContextPath()%>/images/kakao_login_btn.png" width="100" alt="카카오 로그인 버튼" /></a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox">아이디저장
                            </td>
                            
                        </tr>

                    </table>
                    <div>
                        <input type="button" value="아이디찾기">
                        <input type="button" value="비밀번호찾기">
                         <input type="button" value="회원가입" onclick="location.assign('<%=request.getContextPath()%>/member/enrollMember.do');">
                      
                       

                    </div>
            	
            	</form>
                
                

                


            </div>
            
        </section>
    
        <%@ include file="/views/common/footer.jsp" %>
        
        
        
        
        <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js"
  integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/" crossorigin="anonymous"></script>
<script>
  Kakao.init('b39ac3f3968d9d1ab2abc39538c8b218'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<p id="token-result"></p>

<script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
    });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      Kakao.Auth.getStatusInfo()
        .then(function(res) {
          if (res.status === 'connected') {
            document.getElementById('token-result').innerText
              = 'login success, token: ' + Kakao.Auth.getAccessToken();
          }
        })
        .catch(function(err) {
          Kakao.Auth.setAccessToken(null);
        });
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script>