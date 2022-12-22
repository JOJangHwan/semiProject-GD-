<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.Iterator,java.util.Arrays, java.util.ArrayList, java.util.List, java.util.Collections, com.kjh.admin.model.vo.Tag,com.kjh.travelBoard.model.vo.TravelBoard,com.kjh.admin.model.vo.BoardTag, com.jjh.member.model.vo.Member"%>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet">
<html>
<head>
<meta charset="UTF-8">
<title>임시저장글</title>
</head>
<style>
	html, body{
		margin:0;
		padding:0;
	}
	
	a{
		text-decoration:none;
		color:black;
	}
	
	
	.kjh_boardPostTitle{
		color:black;
		font-size:16px;
		font-family:'IBM Plex Sans KR', sans-serif;
		line-height:20px;
		overflow: hidden;
  		text-overflow: ellipsis;
  		white-space: nowrap;
  		word-break:break-all;
	}
	
	.kjh_boardPostEnroll{
		color:black;
		font-size:16px;
		font-family:'IBM Plex Sans KR', sans-serif;
		text-align:center;
		line-height:20px;
		overflow: hidden;
  		text-overflow: ellipsis;
  		white-space: nowrap;
  		word-break:break-all;
	}
	
	.kjh_boardPostDel{
		color:black;
		font-size:16px;
		font-family:'IBM Plex Sans KR', sans-serif;
		line-height:20px;
	}
	
	.kjh_boardPostDel>a:hover{
		color:red;
	}
	
	button:hover{
		cursor:pointer;
	}
	
	#mainContainer{
		/* border:1px solid black; */
		width:600px;
		height:380px;
		padding-top:20px;
		display:flex;
		justify-content:center;
	}
	
	#mainListContainer{
		width:400px;
		height:350px;
		margin:0;
	}
	
	#boardPostAreaContainer{
		width:400px;
		height:350px;
		margin:0;
	}
	
	#boardPagingContainer{
		width:400px;
		height:50px;
		margin:0;
		text-align:center;
		position: fixed;
		bottom: 20px;
	}
	
	#titleContainer>button{
		position: absolute;
		top:30px;
		right: 100px;
	}
	
	#titleContainer label{
		font-size:30px;
		font-family:'IBM Plex Sans KR', sans-serif;
	}
	
	#borderGray{
		color:lightgray;
		border:1px solid lightgray;
	}
	
	#topTitles{
		height:50px;
		display:flex;
		font-size:16px;
		font-family:'IBM Plex Sans KR', sans-serif;
		font-weight:bolder;
	}
	
	#tempTitle{
		width:280px;
		margin-top:20px;
		height:30px;
		text-align:center;
	}
	
	#tempEnroll{
		width:100px;
		margin-top:20px;
		height:30px;
		text-align:center;
	}
	
	.kjh_boardPostTitleCon{
		width:275px;
	}
	
	.kjh_boardPostEnrollCon{
		width:100px;
	}
	.kjh_boardPostBasic{
		display:flex;
	}
	
</style>
<body>
	<%
		List<TravelBoard> boards=(List<TravelBoard>)request.getAttribute("boards");
	%>
	<div id="mainContainer">
		<div id="mainListContainer">
			<div id="boardPostAreaContainer">
				<div id="titleContainer">
					<label>임시저장글</label>
					<button onclick="tempSave();">임시저장</button>
				</div>
				<div id="borderGray">
				</div>
		    		<div id="boardPostArea">
		    			<div id="topTitles">
		    				<div id="tempTitle">제목</div>
		    				<div id="tempEnroll">저장일시</div>
		    			</div>
		    			<div class="kjh_boardPostBasic">
		    				
    						<%if(boards.isEmpty()) {%>
							<%}else{%>
								<div class="kjh_boardPostTitleCon">
									<% for(TravelBoard b:boards){%>
					    				<div class="kjh_boardPostTitle">
					    					<a href="#"
					    					onClick="self.close(); javascript:parent.opener.location.href='<%=request.getContextPath()%>/admin/travelboardupdate.do?boardNo=<%=b.getBoardNo()%>'">
					    						<%=b.getBoardTitle()%>
					    					</a>
				    					</div>
									<%}%>
								</div>
								<div class="kjh_boardPostEnrollCon">
									<% for(TravelBoard b:boards){%>
					    				<div class="kjh_boardPostEnroll">
					    					<a href="#"
					    					onClick="self.close(); javascript:parent.opener.location.href='<%=request.getContextPath()%>/admin/travelboardupdate.do?boardNo=<%=b.getBoardNo()%>'">
					    						<%=b.getBoardEnroll()%>
					    					</a>
				    					</div>
									<%}%>
								</div>
								<div class="kjh_boardPostDelCon">
									<% for(TravelBoard b:boards){%>
					    				<div class="kjh_boardPostDel">
					    					<a href="#"
					    					onclick="self.close(); javascript:parent.opener.location.href='<%=request.getContextPath()%>/admin/travelboarddelete.do?boardNo=<%=b.getBoardNo()%>'">✕</a>
				    					</div>
									<%}%>
								</div>
							<%}%>
						</div>
	    		</div>
		    		
		    	<div id="boardPagingContainer">
		    		<div id="boardPagingBar">
		    			<%=request.getAttribute("pageBar")%>
		    		</div>
		    	</div>
		</div>
	</div>
	<script>
		const tempSave=()=>{
			self.close();
			<%-- parent.opener.location.href="<%=request.getContextPath()%>/admin/travelboardtempend.do" --%>
		}
		
	</script>
</body>
</html>