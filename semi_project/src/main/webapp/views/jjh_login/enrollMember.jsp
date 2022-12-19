
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
          <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jjh_css/semantic.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/subMain.css">
  <%@ include file="/views/common/header.jsp" %>
    
        <section id="mainSection">
        
    
          	
          		<form name="enrollerMemberFrm" action="<%=request.getContextPath() %>/login/enrollerMemberEnd.do" method="post" onsubmit="return fn_invalidate">
          		
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
                            <input type="button" class="ui fluid large teal submit button" onclick="fn_idduplicate();" value="아이디중복체크">
                        </div>
                        <script>
                        const fn_idduplicate=()=>{
    						const userId=$("#userId_").val();
    						if(userId.trim().length<4){
    							alert('아이디는 4글자 이상입력해야 합니다!');
    							$("#userId_").val('');
    							$("#userId_").focus();
    						}else{
    							<%-- open("<%=request.getContextPath()%>/member/idDuplicate.do?userId="+userId,
    									"_blank","width=300,height=300"); --%>
    							const title="idDuplicateFrm";
    							open("",title,"width=300,height=300");
    							console.log(duplicateIdFrm);
    							duplicateIdFrm.userId.value=userId;
    							duplicateIdFrm.method="post";
    							duplicateIdFrm.action="<%=request.getContextPath()%>/member/idDuplicate.do";
    							duplicateIdFrm.target=title;
    							duplicateIdFrm.submit();
    						}
    					} 
                        </script>
                        
                        
                        
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="text" id="u_id" placeholder="닉네임" autofocus autocomplete="off" name="nickName">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="password" id="password" placeholder="비밀번호" name="password">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <input type="password" id="passwordch" placeholder="비밀번호 확인" name="chpassword">
                        </div>
                    </div>
                    <span id="pwresult"></span>
                   
                    
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
                로그인 할 계정이 있다면 <a href="<%=request.getContextPath()%>/login/loginView.do">여기</a>를 눌러주세요.
            </div>
        </div>
    </div>
          			
          			 
          		</form>
          		<form name="duplicateIdFrm">
			<input type="hidden" name="userId">
		</form>
          	
            
        </section>
         <style>
    section#mainSection{width:400px; margin:0 auto; text-align:center;}
    </style>
    
    <script>
    	let pwd=$("#password");
    	console.log(pwd)
    
    
    	$(()=>{
    		$("#password").blur(e=>{
    			const pw=$("#passwordch").val();
    			const pwck=$(e.target).val();
    			if(pw==pwck){
    				$("#pwresult").css("color","green").text("비밀번호가 일치합니다.");
    			}else{
    				$("#pwresult").css("color","red").text("비밀번호가 일치하지 않습니다.");
    			}
    		});
    	});
    	
    	
    	const fn_fn_invalidate=()=>{
    		//아이디가 4글자 이상입력
    		const userId=$("#userId_").val().trim();
    		//패스워드가 8글자 이상입력
    		const password=$("#password_").val().trim();
    		if(userId.length<4){
    			alert("아이디는 4글자 이상 입력하세요");
    			return false;
    		}
    		const passwordReg=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()])[A-Za-z\d!@#$%^&*()]{8,}$/;
    		//console.log(!passwordReg.test(password));
    		if(!passwordReg.test(password)){
    			alert("패스워드는 8글자 이상 영문자, 숫자, 특수기호 포함해야합니다.");
    			return false;
    		}
    		
    	}
    </script>
        
        
    
   <%@ include file="/views/common/footer.jsp" %>   