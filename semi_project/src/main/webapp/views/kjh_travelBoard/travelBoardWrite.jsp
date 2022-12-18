<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_css/kjh_style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_css/kjh_board.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_css/summernote/summernote-lite.css">
	
	<%@ page import="java.util.ArrayList, java.util.List, com.kjh.admin.model.vo.Tag"%>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
  	<script src="<%=request.getContextPath()%>/js/kjh_js/summernote/summernote-lite.js"></script>
	<script src="<%=request.getContextPath()%>/js/kjh_js/summernote/lang/summernote-ko-KR.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	
<%@ include file="/views/common/header.jsp" %>
<%
	String userId="";
	if(loginMember!=null){
		userId=loginMember.getUserId();
	}
	List<Tag> tags=(List<Tag>)request.getAttribute("tags");
%>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
		    	<div id="totalContainer">
		    		<section id="mainSectionTotal">
					<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/admin/travelboardwriteend.do">
						<div id="titleInput">
							<input type="text" name="titleInput" id="titieInput" style="width:1000; height:50px; font-size:20px" placeholder="제목 입력">
						</div>
  						<textarea id="summernote" name="editordata"></textarea>
  						
  						<div id="inputArea">
					    	<div id="infoInputArea">
					    		<div id="tagContainer">
					    			<div id="tagSelectContainer">
					    				<label class="viewFileBtn">태그 설정</label>
						    			<select size="1" id="tagsSelect" name="tagsSelect">
						    				<option value="none">태그 선택</option>
						    				<%for(int i=0; i<tags.size(); i++){ %>
												<option value="<%=tags.get(i).getTagTitle()%>">
													<%=tags.get(i).getTagTitle()%>
												</option>
											<%} %>
										</select>
									</div>
									<div id="selectedTagsContainer">
										<input type="hidden" id="selectedTags" name="selectedTags">
									</div>
					    		</div>
					    		<div id="thumbContainer">
					    			<label class="viewFileBtn">섬네일 설정</label>
						    		<label class="inputFileBtn" for="upFile">
										추가
									</label>
									<input type="file" id="upFile" name="upFile" style="display:none;">
									<label id="upFileTitleLabel"></label>
					    		</div>
					    		<div id="mapContainer">
					    			<label class="viewFileBtn">지도 설정</label>
					    			<label class="inputFileBtn" for="mapFile">추가</label>
					    			<input type="button" id="mapFile" name="mapFile" style="display:none;">
					    		</div>
					    	</div>
					    	<div id="submitArea">
					    		<div id="submitLeft">
					    			<input type="button" value="취소" onclick="location.href='<%=request.getContextPath()%>/travelboard/travelboardmain.do';">
					    		</div>
					    		<div id="submitRight">
									<input type="button" value="임시저장" onclick="location.href='<%=request.getContextPath()%>/travelboard/travelboardmain.do';">
									<input type="submit" value="게시">
								</div>
					    	</div>
				    	</div>
					</form>
					</section>
		    	</div>
		    </div>
	    <div id="rightMarginMain"></div>
    </section>
    <script async="true">
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
		
		var tagArr=new Array();
		
		$("#tagsSelect").on("change", function(event) {
			if($("#tagsSelect option:selected").val()==="none"){
				//선택되지 않도록 제한함.
			}else if(tagArr.includes($("#tagsSelect option:selected").val())){
				//중복되지 않도록 제한함.
			}else{
				var $span = $('<span class="tg">'+$("#tagsSelect option:selected").text()+'</span>');
				var $span2 =$('<span class="tgDelBtn">X</span>');
				$('#selectedTagsContainer').append($span);
				$('#selectedTagsContainer').append($span2);
				tagArr.length=0;
				$('span[class=tg]').each((i,v)=>{tagArr.push(v.innerText)});
				console.dir(tagArr);
				const tagStr = tagArr.join(',');
				$('#selectedTags').val(tagStr);
				console.dir($('#selectedTags').val());
			}
		});
		
		$("#upFile").on("change", function(event) {
			if($("#upFile").val()==null){
			}else{
				let str=$("#upFile").val();
				console.dir(str);
				let fileName=str.replace('C:\\fakepath\\','');
				var $span = $('<span class="thumbS">'+fileName+'</span>');
				$('#upFileTitleLabel').html($span);
			}
		});
		
		var delay = 300;
		var timer = null;
		
	    $(window).on('resize', function(){
			clearTimeout(timer);
			timer = setTimeout(function(){
				console.log('resize event!');
				console.log(window.innerWidth);
		        if (window.innerWidth >= 1900) {
		      		$("#titieInput").css("width","1400px");
		    	}else if(window.innerWidth >= 1200){
		    		$("#titieInput").css("width","1000px");
		    	}else if(window.innerWidth >= 900){
		    		$("#titieInput").css("width","500px");
		    	}
			}, delay);
		});
    </script>
<%@ include file="/views/common/footer.jsp" %>