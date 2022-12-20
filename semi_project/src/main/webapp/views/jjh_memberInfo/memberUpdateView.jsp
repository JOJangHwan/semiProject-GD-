
<%@page import="com.jjh.loginMember.model.service.LoginMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jjh_css/semantic.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/subMain.css">

  <%@ include file="/views/common/header.jsp" %>
    
        <section id="mainSection">
<form name="memberupdate" action="<%=request.getContextPath() %>/member/memeberUpdateEnd.do" method="post" onsubmit="return fn_invalidate">
          			<div class="ui middle aligned center aligned grid">
        <div class="column">
        <br>
            <h2 class="ui teal image header">
                회원정보수정하기
            </h2>
            
            <div class="ui large form">
                <div class="ui stacked segment">
                    <div class="field">
                        <div class="ui left icon input">
                        	<input type="button" class="ui fluid large teal submit button" value="아이디">&nbsp;
                            <input type="text" id="u_id" autofocus autocomplete="off" name="userId" readonly="readonly"  value="<%=loginMember.getUserId()%>">
                            
                        </div>
    
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                        <input type="button" class="ui fluid large teal submit button" value="닉네임">&nbsp;
                            <input type="text" id="u_id" autofocus autocomplete="off" name="nickName" placeholder="<%=loginMember.getNickName() %>" value="<%=loginMember.getNickName()%>">
                        </div>
                    </div>
                   
                   <span id="pwresult"></span>
                   
                    
                    <div class="field">
                        <div class="ui left icon input">
                         <input type="button" class="ui fluid large teal submit button" value="나이">&nbsp;
                            <input type="number" id="u_pw2" placeholder="<%=loginMember.getAge()%>" name="age"  value="<%=loginMember.getAge()%>">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                         <input type="button" class="ui fluid large teal submit button" value="주소">&nbsp;
                            <input type="text" id="u_pw2" placeholder="<%=loginMember.getAddress()%>" name="address" value="<%=loginMember.getAddress()%>">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                         <input type="button" class="ui fluid large teal submit button" value="이메일">&nbsp;
                            <input type="email" id="u_pw2" placeholder="<%=loginMember.getEmail() %>" name="email" value="<%=loginMember.getEmail()%>">
                        </div>
                        
                        
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                         <input type="button" class="ui fluid large teal submit button" value="전화번호">&nbsp;
                            <input type="tel" id="u_pw2" placeholder="<%=loginMember.getPhone()%>" name="phone" value="<%=loginMember.getPhone()%>">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                           
                             <input type="button" class="ui fluid large teal submit button" value="성별"> &nbsp;&nbsp;&nbsp;
          						남<input type="radio" name="gender" value="남" id="u_pw2" value="남" <%=loginMember.getGender()=='남'?"checked":"" %> >
          						여<input type="radio" name="gender" value="여" id="u_pw2" value="여" id="u_pw2" value="여" <%=loginMember.getGender()=='여'?"checked":"" %>>
                        </div>
                    </div>
                    <input type="submit" class="ui fluid large teal submit button" value="수정하기">
                   
                </div>

                <div class="ui error message"></div>

            </div>

            <div class="ui message">
                뒤로 가고 싶으면 <a href="<%=request.getContextPath()%>/member/memberInfo.do">여기</a>를 눌러주세요.
            </div>
        </div>
        
    </div>
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