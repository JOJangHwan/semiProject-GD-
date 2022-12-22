package com.psh.movelineboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.psh.movelineboard.model.servlce.MoveLineBoardService;
import com.psh.movelineboard.model.vo.Comment;

/**
 * Servlet implementation class InsertMoveLineBoardCommentServlet
 */
@WebServlet("/moveLineBoard/moveLineBoardComment.do")
public class InsertMoveLineBoardCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMoveLineBoardCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
			int level=Integer.parseInt(request.getParameter("commentLevel"));
		int commentRef=Integer.parseInt(request.getParameter("commentRef"));
		String userId=request.getParameter("commentWriter");
		String content=request.getParameter("content");
		Comment c=Comment.builder()
				.boardNo(boardNo)
				.userId(userId)
				.moveLineBoardlevel(level)
				.commentRef(commentRef)
				.commentContent(content)
				.build();
		
		Comment comment=new MoveLineBoardService().insertComment(c);
	
		//전송할때 contentType설정
		response.setContentType("application/json;charset=utf-8");
		
		//GSon라이브러리 이용해서 데이터 전송
		Gson g=new Gson();
		//toJson()메소드 이용
		g.toJson(comment,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
