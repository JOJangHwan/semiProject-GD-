<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_css/kjh_style.css">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<%@ page import="java.util.Iterator,java.util.Arrays, java.util.ArrayList, java.util.List, java.util.Collections, com.kjh.admin.model.vo.Tag,com.kjh.travelBoard.model.vo.TravelBoard,com.kjh.admin.model.vo.BoardTag, com.jjh.member.model.vo.Member"%>
<script	src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>

<%@ include file="/views/common/header.jsp" %>
<%	
	String userId="";
	if(loginMember!=null){
		userId=loginMember.getUserId();
	}
	
	List<Tag> tags=(List<Tag>)request.getAttribute("tags");

	List<TravelBoard> boards=(List<TravelBoard>)request.getAttribute("boards");
	List<BoardTag> boardTags=(List<BoardTag>)request.getAttribute("boardTags");
%>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
		    	<div id="listContainer">
		    		<div id="boardTitleArea" name="boardTitleArea">
		    			<label style="font-size:40px; font-family: 'Do Hyeon', sans-serif;">
		    				추천 여행지 찜 리스트
		    			</label>
		    		</div>
	    			<div class="lineGray"></div>
		    		<div id="boardPostAreaContainer">
			    		<div id="boardPostArea">
	    						<%if(boards.isEmpty()) {%>
								<%}else{
									for(TravelBoard b:boards){%>
									<div class="kjh_boardPostBasic">
										<div class="kjh_boardPostImg">
					    					<img src="<%=request.getContextPath()%>/upload/kjh_travelBoard/postThumbImages/<%=b.getThumbFilename()%>"
					    						onclick="location.href='<%=request.getContextPath()%>/travelboard/travelboardview.do?boardNo=<%=b.getBoardNo()%>';"
					    						style="cursor:pointer;">
					    				<div class="kjh_boardPostTagContainer">
					    					<div class="kjh_boardPostTag">
					    						<% if(b.getTags()==null){ %>
					    						<%}else{
					    							for(int i=0;i<b.getTags().size();i++){%>
					    								<button id="tagSearchBoardBtn" onclick="location.href='<%=request.getContextPath()%>/travelboard/travelboardtagsearch.do?tagTitle=<%=b.getTags().get(i).getTagTitle()%>';">
					    									#<%=b.getTags().get(i).getTagTitle()%>
					    								</button>
					    							<%} %>
					    						<%} %>
					    					</div>
					    				</div>
					    				<%if(loginMember!=null){ %>
					    				<div class="kjh_boardPostPickContainer"
					    					onclick="location.href='<%=request.getContextPath()%>/travelboard/travelboardpickcontroll.do?boardNo=<%=b.getBoardNo()%>&pick=<%=b.getTravelPick()%>';"
					    						style="cursor:pointer;">
					    					<%if(b.getTravelPick()=='N'){ %>
					    						<div class="kjh_boardPostPick kjh_colorWhite"></div>
					    					<%}else if(b.getTravelPick()=='Y'){ %>
					    						<div class="kjh_boardPostPick kjh_colorYellow"></div>
					    					<%} %>
					    				</div>
					    				<%}else{ %>
					    				<div class="kjh_boardPostPickContainer"
					    					onclick="loginAlert()";
					    						style="cursor:pointer;">
					    					<%if(b.getTravelPick()=='N'){ %>
					    						<div class="kjh_boardPostPick kjh_colorWhite"></div>
					    					<%}else if(b.getTravelPick()=='Y'){ %>
					    						<div class="kjh_boardPostPick kjh_colorYellow"></div>
					    					<%} %>
					    				</div>
					    				<%} %>
					    				
					    				<script>
					    					function loginAlert() {
					    						alert("로그인 후 사용하십시오.");
					    					}
					    				</script>
					    				
					    				</div>
					    				<div class="kjh_boardPostTitle">
					    					<a href="<%=request.getContextPath()%>/travelboard/travelboardview.do?boardNo=<%=b.getBoardNo()%>">
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