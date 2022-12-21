package com.psh.movelineboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psh.movelineboard.model.servlce.MoveLineBoardService;
import com.psh.movelineboard.model.vo.Comment;

/**
 * Servlet implementation class UpdateCommentServlet
 */
@WebServlet("/comment/updateComment.do")
public class UpdateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content=request.getParameter("commentContent");
		int commentNo=Integer.parseInt(request.getParameter("commentNo"));
		System.out.println(content);
		Comment c=Comment.builder()
				.commentContent(content)
				.commentNo(commentNo)
				.build();
		int result=new MoveLineBoardService().updateComment(c);
		response.getWriter().print(result);
		if(result>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
