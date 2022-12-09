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