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
		    				추천 여행지
		    			</label>
		    			<%if(userId!=null&&userId.equals("admin")){ %>
			    			<div id="adminWriteBtnArea">
			    				<button name="adminWriteBtn" onclick="location.href='<%=request.getContextPath()%>/admin/travelboardwrite.do';">
			    					게시글 작성
			    				</button>
			    			</div>
		    			<%}%>
		    		</div>
	    			<div class="lineGray"></div>
	    			
		    		<div id="boardTagArea">
		    			<%String tagTitleYN=request.getParameter("tagTitle");
		    				List<String> tagTitleList=new ArrayList();
		    				if(tagTitleYN!=null){
		    					String[] strArr=tagTitleYN.split(" ");
		    					tagTitleList = new ArrayList<>(Arrays.asList(strArr));
			    				System.out.println(tagTitleList);
		    					
			    				List<String> removed = new ArrayList<>();
			    				
		    					for(String st:tagTitleList){
		    						int su = Collections.frequency(tagTitleList, st);
		    						System.out.println(st+":"+su);
		    						if(su%2==0){
		    							removed.add(st);
		    						}
		    					}
		    					tagTitleList.removeAll(removed);
		    					tagTitleYN=String.join("+", tagTitleList);
		    				}
		    				System.out.println(tagTitleList);
		    			 %>
		    			
			    		<%if(tags.isEmpty()) {%>
						<%}else{
							for(Tag t:tags){
								if(tagTitleYN==null||tagTitleList.isEmpty()){%>
									<button id="tagSearchBtn" name="tagSearchBtn"
										onclick="location.href='<%=request.getContextPath()%>/travelboard/travelboardtagsearch.do?tagTitle=<%=t.getTagTitle()%>';">
										#<%=t.getTagTitle()%>
									</button>
								<%}else if(tagTitleYN!=null&&tagTitleList!=null){%>
									<button id="tagSearchBtn" name="tagSearchBtn"
										onclick="location.href='<%=request.getContextPath()%>/travelboard/travelboardtagsearch.do?tagTitle=<%=tagTitleYN%>+<%=t.getTagTitle()%>';"
									<%for(String st:tagTitleList){
										if(st!=null&&st.equals(t.getTagTitle())){ %>
										 	style="background-color: lightblue;"
										<%}%>
									<%}%>
										>
										#<%=t.getTagTitle()%>
									</button>
							 	 <%}%>
						   	<%}%>
						<%}%>
		    		</div>
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
					    						<div class="kjh_boardPostPickOff"><img src="<%=request.getContextPath()%>/images/pickon.png"></div>
					    					<%}else if(b.getTravelPick()=='Y'){ %>
					    						<div class="kjh_boardPostPickOn"><img src="<%=request.getContextPath()%>/images/pickoff.png"></div>
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
    
    <script>
/*     	var delay = 300;
		var timer = null;
		
	    $(window).on('resize', function(){
			clearTimeout(timer);
			timer = setTimeout(function(){
				console.log('resize event!');
				console.log(window.innerWidth);
		        if (window.innerWidth >= 1900) {
		      		alert('현재 브라우저 크기가 1900px 이상');
		    	}else if(window.innerWidth >= 1200){
		    		alert('현재 브라우저 크기가 1200px 이상');
		    	}else if(window.innerWidth >= 900){
		    		alert('현재 브라우저 크기가 900px 이상');
		    	}
			}, delay);
		}); */
	</script>
	
<%@ include file="/views/common/footer.jsp" %>