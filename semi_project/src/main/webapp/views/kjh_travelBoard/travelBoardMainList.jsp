<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_css/kjh_style.css">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<%@ page import="java.util.List,com.kjh.admin.model.vo.Tag,com.kjh.travelBoard.model.vo.TravelBoard
,com.kjh.admin.model.vo.BoardTag" %>
<%
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
							<button><%=t.getTagTitle()%></button>
						<%}
						}%>
		    		</div>
		    		
		    		<div id="boardPostArea">
    						<%if(boards.isEmpty()) {%>
							<%}else{
								for(TravelBoard b:boards){%>
								<div class="kjh_boardPostBasic">
									<div class="kjh_boardPostImg">
				    					<img src="<%=request.getContextPath()%>/images/kjh_images/travelBoard/<%=b.getThumbFilename()%>">
				    				<div class="kjh_boardPostTagConteiner">
				    					<div class="kjh_boardPostTag">
				    						<%-- <%if(boardTags.isEmpty()) {%>
											<%}else{
												for(int i=0; i<boardTags.size(); i++){
													for(int j=0; j<boards.size(); j++) {
														if(boardTags.get(i).getBoardNo()==boards.get(j).getBoardNo()){%>
														<button><%=tags.get(i).getTagTitle()%></button>
														<%}
													}%>
												<%}%>
				    						<%}%> --%>
				    						<% if(b.getTags()==null){ %>
				    						<%}else{
				    							for(int i=0;i<b.getTags().size();i++){%>
				    								<button><%=b.getTags().get(i).getTagTitle()%></button>
				    							<%} %>
				    						<%} %>
				    					</div>
				    				</div>
				    				</div>
				    				<div class="kjh_boardPostTitle">
				    					<a href="<%=request.getContextPath()%>/board/boardView.do?boardNo=<%=b.getBoardNo()%>">
				    						<%=b.getBoardTitle()%>
				    					</a>
			    					</div>
			    				</div>
								<%}
							}%>
		    		</div>
			    	<div id="boardPagingConteiner">
			    		<div id="boardPagingBar">
			    			<%=request.getAttribute("pageBar") %>
			    		</div>
			    	</div>		    		
		    	</div>
		    </div>
	    <div id="rightMarginMain"></div>
    </section>
<%@ include file="/views/common/footer.jsp" %>