<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_css/kjh_style.css">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<%@ page import="java.util.List,com.kjh.admin.model.vo.Tag,com.kjh.travelBoard.model.vo.TravelBoard
,com.kjh.admin.model.vo.BoardTag, com.jjh.member.model.vo.Member" %>

<%
	String userId="dev123";
	session.setAttribute("userId", userId);
	userId=(String)session.getAttribute("userId");
	/* 확인용 session 생성 */
	
	List<Tag> tags=(List<Tag>)request.getAttribute("tags");

	List<TravelBoard> boards=(List<TravelBoard>)request.getAttribute("boards");
	List<BoardTag> boardTags=(List<BoardTag>)request.getAttribute("boardTags");
%>
<%@ include file="/views/common/header.jsp" %>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
		    	<div id="listContainer">
		    		<div id="boardTitleArea" name="boardTitleArea">
		    			<label style="font-size:40px; font-family: 'Do Hyeon', sans-serif;">
		    				추천 여행지
		    			</label>
		    		</div>
	    			<div class="lineGray"></div>
	    			
		    		<div id="boardTagArea">
			    		<%if(tags.isEmpty()) {%>
						<%}else{
							for(Tag t:tags){%>
							<button>#<%=t.getTagTitle()%></button>
						<%}
						}%>
		    		</div>
		    		
		    		<div id="boardPostArea">
    						<%if(boards.isEmpty()) {%>
							<%}else{
								for(TravelBoard b:boards){%>
								<div class="kjh_boardPostBasic">
									<div class="kjh_boardPostImg">
				    					<img src="<%=request.getContextPath()%>/images/kjh_images/travelBoard/<%=b.getThumbFilename()%>"
				    						onclick="location.href='<%=request.getContextPath()%>//travelboard/boardView.do?boardNo=<%=b.getBoardNo()%>';"
				    						style="cursor:pointer;">
				    				<div class="kjh_boardPostTagContainer">
				    					<div class="kjh_boardPostTag">
				    						<% if(b.getTags()==null){ %>
				    						<%}else{
				    							for(int i=0;i<b.getTags().size();i++){%>
				    								<button onclick="location.href='<%=request.getContextPath()%>/travelboard/travelboardtagsearch.do?tagTitle=<%=b.getTags().get(i).getTagTitle()%>';">
				    									#<%=b.getTags().get(i).getTagTitle()%>
				    								</button>
				    							<%}%>
				    						<%} %>
				    					</div>
				    				</div>
				    				<div class="kjh_boardPostPickContainer"
				    					onclick="location.href='<%=request.getContextPath()%>/travelboard/travelboardpickcontroll.do?boardNo=<%=b.getBoardNo()%>';"
				    						style="cursor:pointer;">
				    					<%if(b.getTravelPick()=='N'){ %>
				    						<div class="kjh_boardPostPick kjh_colorWhite"></div>
				    					<%}else if(b.getTravelPick()=='Y'){ %>
				    						<div class="kjh_boardPostPick kjh_colorYellow"></div>
				    					<%} %>
				    				</div>
				    				</div>
				    				<div class="kjh_boardPostTitle">
				    					<a href="<%=request.getContextPath()%>/travelboard/boardView.do?boardNo=<%=b.getBoardNo()%>">
				    						<%=b.getBoardTitle()%>
				    					</a>
			    					</div>
			    				</div>
								<%}
							}%>
		    		</div>
			    	<div id="boardPagingContainer">
			    		<div id="boardPagingBar">
			    			<%=request.getAttribute("pageBar") %>
			    		</div>
			    	</div>		    		
		    	</div>
		    </div>
	    <div id="rightMarginMain"></div>
    </section>
    
<%@ include file="/views/common/footer.jsp" %>