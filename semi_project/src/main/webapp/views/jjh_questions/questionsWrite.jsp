<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jjh_css/semantic.min.css">
<%@page import="com.jjh.member.model.vo.Member"%>

   <%@ include file="/views/common/header.jsp" %>
     

<div id='board-container'>
		<div class="ui middle aligned center aligned grid">
        <div class="column">
            <h2 class="ui teal image header">
                문의사항 작성하기
            </h2>
            <form class="ui large form" action='<%=request.getContextPath()%>/questions/questionsWrite.do' method="post">
                <div class="ui stacked segment"  >
                    <div class="field">
                        <input type="text" id="b_title" name="title" placeholder="게시글 제목" autocomplete="off" autofocus="autofocus">
                        
                        <input type="text" id="b_title" placeholder="유저아이디" autocomplete="off" autofocus="autofocus" value="<%=loginMember.getUserId() %>" readonly>
                        <input type="hidden" name="userId" value=<%=loginMember.getUserId()%>>
                        <input type="file" name="file" id="b_title" placeholder="파일등록" autocomplete="off" autofocus="autofocus">
                        <input type="checkbox" name="open" id="b_title" placeholder="공개여부" autocomplete="off" autofocus="autofocus">
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <textarea style="resize: vertical;" id="b_content" placeholder="게시글 내용" rows="8" name="content"></textarea>
                        </div>
                    </div>
                    <input type="submit" class="ui fluid large teal submit button" value="게시하기">
                    
                    <!-- <div class="ui fluid large teal submit button" id="write_bbs">게시글 작성하기</div> -->
                    
                
                </div>

                <div class="ui error message"></div>

            </form>

            <a href="<%=request.getContextPath()%>/matter/matterListView.do"><button class="ui fluid large teal submit button">뒤로가기</button></a>
        </div>
    </div>
	</div>
	
	<style>
	div#board-container
	{
		width:600px;
		margin:0 auto;
		text-align:center;
	}
	div#board-container h2
	{
		margin:10px 0;
	}
	table#tbl-board
	{
		width:500px;
		margin:0 auto;
		border:1px solid black;
		border-collapse:collapse;
	}
	table#tbl-board th
	{
		width:125px;
		border:1px solid;
		padding:5px 0;
		text-align:center;
	}
	table#tbl-board td
	{
		border:1px solid;
		padding:5px 0 5px 10px;
		text-align:left;
	}

</style>
<script>
	//내용입력여부 확인 후 전송
</script>
<%@ include file="/views/common/footer.jsp" %>