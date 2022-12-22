package com.psh.movelineboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csk.moveline.service.MoveLineService;
import com.psh.movelineboard.model.servlce.MoveLineBoardService;
import com.psh.movelineboard.model.vo.Comment;

/**
 * Servlet implementation class InsertPickMLBServlet
 */
@WebServlet("/pick/insertPick.do")
public class InsertPickMLBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPickMLBServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		String userId=request.getParameter("commentWriter");
		Comment c=Comment.builder()
				.boardNo(boardNo)
				.userId(userId)
				.build();
		int result=new MoveLineBoardService().insertPick(c);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
