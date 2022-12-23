package com.psh.movelineboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psh.movelineboard.model.servlce.MoveLineBoardService;

/**
 * Servlet implementation class DeleteMoveLineBoardServlet
 */
@WebServlet("/moveLineBoard/deleteMoveLineBoard.do")
public class DeleteMoveLineBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMoveLineBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		int result=new MoveLineBoardService().deletetMoveLineBoard(boardNo);
		
		if(result>0) {
			request.getRequestDispatcher("/views/csk_movelineboard/recMoveLineBoard.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/view/psh_moveLineBoard/psh_moveLineBoardView.jsp").forward(request, response);
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
