<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/kjh_style.css">
    
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="<%=request.getContextPath()%>/kjh_css/summernote.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.js"></script>
<%@ include file="/views/common/header.jsp" %>
	<section id="mainSection">
		<div id="leftMarginMain"></div>
		    <div id="mainSectionContainer">
		    	<div id="totalContainer">
		    		<section id="mainSectionTotal">
					<form method="post">
						<div id="titleInput">
							<input type="text" style="width:1000; height:50px; font-size:20px" placeholder="제목 입력">
						</div>
					    <textarea id="summernote" name="editordata"></textarea>
				    </form>
				    <div id="inputArea" style="width:100%; height:300px;">
				    	<div id="tagInputArea">
				    	
				    	</div>
				    	<div id="submitArea">
				    		<div id="cancel">
				    		</div>
				    	</div>
				    </div>
				    <script>
				       $(document).ready(function() {
				           $('#summernote').summernote();
				       });
				       
				       $('#summernote').summernote({
				       	width: 1000,
				       	//height: 300,// set editor height
				       	minHeight:500,
				       	maxHeight: null,
				       	focus: true// set focus to editable area after initializing summernote
				       	});
				   	</script>
					</section>
		    	</div>
		    </div>
	    <div id="rightMarginMain"></div>
    </section>
<%@ include file="/views/common/footer.jsp" %>