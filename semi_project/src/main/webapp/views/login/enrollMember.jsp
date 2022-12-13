<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/subMain.css">
  <%@ include file="/views/common/header.jsp" %>
    
        <section id="mainSection">
        
    
          	
          		<form name="enrollerMemberFrm" action="<%=request.getContextPath() %>/login/enrollerMemberEnd.do">
          		<h3>회원가입</h3>
          			<table>
          				<tr>
          					<td>
          						아이디 <input type="text" id="userId">
          					</td>
          					
          					<td>
          						<button>중복확인</button>
          					</td>
          				</tr>
          				<tr>
          					<td>
          						닉네임 <input type="text" name="nickName">
          					</td>
          				</tr>
          				<tr>
          				<td>
          					비밀번호 <input type="password" name="password">
          				</td>
          				<tr>
          					<td>
          						비밀번호확인<input type="password" name="chpassword">
          					</td>
          				</tr>
          				<tr>
          					<td>나이 <input type="number" name="age"></td>
          					
          				</tr>
          				<tr>
          					<td>주소 <input type="text" name="address"></td>
          					
          				</tr>
          				<td>
          					이메일<input type="email" name="email">
          				</td>
          				</tr>
          				<tr>
          					<td>
          						전화번호<input type="tel"name="phone">
          					</td>
          					
          				</tr>
          				
          				<tr>
          					<td>
          						성별
          						남<input type="radio" name="gender" value="M">
          						여<input type="radio" name="gender" value="F">
          					</td>
          					
          				</tr>
          				<tr>
          					<td>
          						<button>가입하기</button>
          						<button>취소하기</button>
          					</td>
          					
          				</tr>
          			</table>
          			
          			 
          		</form>
          	
          
            
        </section>
    
   <%@ include file="/views/common/footer.jsp" %>   