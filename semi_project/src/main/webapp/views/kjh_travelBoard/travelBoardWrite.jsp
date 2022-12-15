<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_css/kjh_style.css">
    
	<!--<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->
  	
  	<script src="<%=request.getContextPath()%>/js/kjh_js/summernote/summernote-lite.js"></script>
	<script src="<%=request.getContextPath()%>/js/kjh_js/summernote/lang/summernote-ko-KR.js"></script>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_css/summernote/summernote-lite.css">

<style>
	#inputArea{
		width:100%;
		height:160px;
		background-color:#F8F8F8;
	}
	
	#infoInputArea{
		height:120px;
	}
	
	#tagContainer{
		border:1px solid black;
		height:30px;
		margin-top:10px;
	}
	
	#thumbContainer{
		border:1px solid blue;
		height:30px;
		margin-top:10px;
		margin-bottom:10px;
	}
	
	#mapContainer{
		border:1px solid red;
		height:30px;
	}
	
	#submitArea{
		margin-left:10px;
		margin-right:10px;
	}
	
	#submitLeft{
		display:inline-block;
		float:left;
	}
	
	#submitRight{
		display:inline-block;
		float:right;
	}
</style>
<%@ include file="/views/common/header.jsp" %>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
		    	<div id="totalContainer">
		    		<section id="mainSectionTotal">
					<form method="post" action="<%=request.getContextPath()%>/admin/travelboardwriteend.do">
						<div id="titleInput">
							<input type="text" name="titleInput" style="width:1000; height:50px; font-size:20px" placeholder="제목 입력">
						</div>
  						<textarea id="summernote" name="editordata"></textarea>
  						
  						<div id="inputArea">
					    	<div id="infoInputArea">
					    		<div id="tagContainer">
					    		
					    		</div>
					    		<div id="thumbContainer">
					    		
					    		</div>
					    		<div id="mapContainer">
					    		
					    		</div>
					    	</div>
					    	<div id="submitArea">
					    		<div id="submitLeft">
					    			<input type="reset" value="취소">	
					    		</div>
					    		<div id="submitRight">
									<button onclick="">임시저장</button>
									<input type="submit" value="게시" >
								</div>
					    	</div>
				    	</div>
					</form>
					</section>
		    	</div>
		    </div>
	    <div id="rightMarginMain"></div>
    </section>
    <script>
		$(document).ready(function() {
			$('#summernote').summernote({
				  height: 250,              // 에디터 높이
				  minHeight: null,          // 최소 높이
				  maxHeight: null,          // 최대 높이
				  focus: true,              // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",			// 한글 설정
				  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
			});
		});
    </script>
<%@ include file="/views/common/footer.jsp" %>