<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_css/kjh_style.css">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<%@ page import="java.util.List,com.psh.movelineboard.model.vo.MoveLineBoard,com.jjh.member.model.vo.Member"%>
<script   src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>

<%@ include file="/views/common/header.jsp" %>
    <%
    	String userId="";
		if(loginMember!=null){userId=loginMember.getUserId();}
		List<MoveLineBoard> boards=(List<MoveLineBoard>)request.getAttribute("boards");
		
	%> 

	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
		    	<div id="listContainer">
		    		<img src="<%=request.getContextPath() %>/images/크리스마스.png">
		    		<div id="boardTitleArea" name="boardTitleArea">
		    			<label style="font-size:40px; font-family: 'Do Hyeon', sans-serif;">추천 동선 게시판
		    			</label>
		    			<!-- 주석부분에 button 게시글작성 만들기 -->
		    			<% if(userId!=null){ %>
					    	<div id="userWriteBtnArea">
					    		<button name="userWriteBtn" onclick="location.href=''">
					    			게시글 작성
					    		</button>
					    	</div>
					    <%} %>
		    		</div>
	    			<div class="lineGray"></div>
	    			<div id=imgContainer>
	    			<div id="boardPostAreaContainer">
			    		<div id="boardPostArea">
	    						<%if(boards.isEmpty()) {%>
								<%}else{
									for(MoveLineBoard b:boards){%>
									<div class="kjh_boardPostBasic">
										<div class="kjh_boardPostImg">
					    					 <img src="<%=request.getContextPath()%>/images/rubberduck.jpg" alt=""
					    						onclick="location.assign='<%=request.getContextPath()%>/moveLineBoard/moveLineBoardView.do?=boardNo=<%=b.getBoardNo()%>&&moveLineNo=<%=b.getMovelineNo() %>';"
					    						style="cursor:pointer;">
					    				</div>
					    				<div class="kjh_boardPostTitle">
					    					<a href="<%=request.getContextPath()%>/moveLineBoard/boardlist.do?boardNo=<%=b.getBoardNo()%>">
					    						<%=b.getBoardTitle()%>
					    					</a>
				    					</div>
				    				</div>
									<%}
								}%>
			    		</div>
		    		</div>
		    		
			    	<div id="boardPagingContainer">
			    		<div id="boardPagingBar">
			    			<%=request.getAttribute("pageBar")%>
			    		</div>
			    	</div>		    		
		    	</div>
		    </div>
		  </div>
	    			
		    
	    <div id="rightMarginMain"></div>
    </section>
<%@ include file="/views/common/footer.jsp" %>