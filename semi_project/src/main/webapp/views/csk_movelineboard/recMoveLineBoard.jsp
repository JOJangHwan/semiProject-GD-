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

	<style>
		img{
			max-width:100%;
		}
	
		#titleArea{
			width:60%;
			height:auto;
			/* border:1px solid black; */
			margin: auto;
			
			font-family:'Do Hyeon', sans-serif;
			font-size:40px;
			font-weight:border;
			line-height:45px;
			padding-top:15px;
			padding-bottom:15px;
		}
		
		#lineLightGray{
			border:1px solid #D2D2D2;
			background-color:#D2D2D2;
			width:60%;
			margin:auto;
		}
		
		#tagArea{
			/* border:1px solid #D2D2D2; */
			height:30px;
		}
		
		#contentArea{
			padding-top:40px;
			padding-bottom:40px;
			width:60%;
			height:auto;
			/* border:1px solid black; */
			margin: auto;
		}
		
		#tagAndPick{
			/* border:1px solid black; */
			width:60%;
			margin:auto;
			padding-top:20px;
			display:flex;
			justify-content:space-between;
		}
		
		#pickArea{
			width:20px;
			height:20px;
			/* border:1px solid green; */
		}
		
		.moveTopBtn {
		  position: fixed;
		  bottom: 4rem;
		  right: 18rem;
		  width: 4rem;
		  height: 4rem;
		  border-radius:40px;
		  background-color:#F1C40F;
		  color: black;
		 }
		 
		 #buttonsContainer{
		 	width:60%;
		 	margin:auto;
		 	display:flex;
		 	justify-content:space-between;
		 }
		 
		 #mainListBtnContainer{
		 	
		 }
		 
		 #mainListBtnContainer>button{
		 	float:right;
		 	margin-bottom:40px;
		 }
		
	</style>

	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
		    	<div id="listContainer">
		    		<div id="boardTitleArea" name="boardTitleArea">
		    			<label style="font-size:40px; font-family: 'Do Hyeon', sans-serif;">추천 동선 게시판
		    			</label>
		    			<!-- 주석부분에 button 게시글작성 만들기 -->
		    			<% if(userId!=null){ %>
					    	<div id="adminWriteBtnArea">
					    		<button name="adminWriteBtn" onclick="location.href=''">
					    			게시글 작성
					    		</button>
					    	</div>
					    <%} %>
		    		</div>
	    			<div class="lineGray"></div>
	    			<div id="boardPostAreaContainer">
			    		<div id="boardPostArea">
	    						<%if(boards.isEmpty()) {%>
								<%}else{
									for(MoveLineBoard b:boards){%>
									<div class="kjh_boardPostBasic">
										<div class="kjh_boardPostImg">
					    					 <img src="" alt=""
					    						onclick="location.assign='<%=request.getContextPath()%>/moveLineBoard/moveLineBoardView.do?=boardNo=<%=b.getBoardNo()%>&&moveLineNo=<%=b.getMovelineNo() %>';"
					    						style="cursor:pointer;">
					    				</div>
					    				<div class="kjh_boardPostTitle">
					    					<a href="<%=request.getContextPath()%>/moveLineBoard/moveLineBoardView.do?boardNo=<%=b.getBoardNo()%>">
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
	    			
		    
	    <div id="rightMarginMain"></div>
    </section>
<%@ include file="/views/common/footer.jsp" %>