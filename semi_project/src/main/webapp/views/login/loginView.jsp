<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/subMain.css">

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
  								<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    							alt="카카오 로그인 버튼" />
								</a>
								<p id="token-result"></p>
								<button class="api-btn" onclick="requestUserInfo()" style="visibility:hidden">사용자 정보 가져오기</button>
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
        
        
        
      



<!-- <script>
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
      state: 'userme',
    });
  }

  function requestUserInfo() {
    Kakao.API.request({
      url: '/v2/user/me',
    })
      .then(function(res) {
        alert(JSON.stringify(res));
      })
      .catch(function(err) {
        alert(
          'failed to request user information: ' + JSON.stringify(err)
        );
      });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      document.querySelector('#token-result').innerText = 'login success, ready to request API';
      document.querySelector('button.api-btn').style.visibility = 'visible';
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script> -->


<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<body>
	<a id="kakao-login-btn">카카오 로그인?</a>
	<button class="api-btn" onclick="unlinkApp()">앱 탈퇴하기</button>
	
	<div id="result"></div>
	
<script type="text/javascript">
  function unlinkApp() {
    Kakao.API.request({
      url: '/v1/user/unlink',
      success: function(res) {
        alert('success: ' + JSON.stringify(res))
      },
      fail: function(err) {
        alert('fail: ' + JSON.stringify(err))
      },
    })
  }
</script>
 
<script type="text/javascript">
Kakao.init('b39ac3f3968d9d1ab2abc39538c8b218');
console.log(Kakao.isInitialized());
 
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function(result) {
          $('#result').append(result);
          id = result.id
          connected_at = result.connected_at
          kakao_account = result.kakao_account
          console.log(kakao_account)
          console.log(result)
          let nickname=kakao_account.profile.nickname
          $('#result').append(kakao_account);
          resultdiv="<h2>로그인 성공 !!"
          resultdiv += '<h4>id: '+id+'<h4>'
          resultdiv += '<h4>connected_at: '+connected_at+'<h4>'
         
          email ="";
          gender = "";
          if(typeof kakao_account != 'undefined'){
        	  email = kakao_account.email;
        	  gender = kakao_account.gender;
          }
          resultdiv += '<h4>email: '+email+'<h4>'
          resultdiv += '<h4>gender: '+gender+'<h4>'
          resultdiv += '<h4>nickName: '+nickname+'<h4>'
          $('#result').append(resultdiv);
          
        },
        fail: function(error) {
          alert(
            'login success, but failed to request user information: ' +
              JSON.stringify(error)
          )
        },
      })
    },
    fail: function(err) {
      alert('failed to login: ' + JSON.stringify(err))
    },
  })
</script>
</body>