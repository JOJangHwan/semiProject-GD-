<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.jjh.member.model.vo.Member"%>
<% Member loginMember=(Member)session.getAttribute("loginMember"); %>
   <%@ include file="/views/common/header.jsp" %>
     

<div id='board-container'>
		<h2>문의사항</h2>
		<form action='<%=request.getContextPath()%>/questions/questionsWriteEnd.do' method="post">
			<table id='tbl-board'>
				<tr>
					<th>제목</th>
					<td><input type="text" placeholder="제목을 입력하세요" name="title"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=loginMember.getUserId() %></td>
					<td><input type="hidden" value="<%=loginMember.getUserId()%>" name="userId"></td>
				</tr>
				<tr><th>공개여부</th>
					<td><input type="checkbox"  name="open"></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="fileName"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="100" placeholder="내용을 입력하세요" name="content"></textarea></td>
				</tr>
				<tr>
					<th colspan="2">
					<input type="submit" value="등록하기">
						
					</th>
				</tr>
			</table>
		</form>
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