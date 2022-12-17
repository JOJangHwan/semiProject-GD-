package com.psh.movelineboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psh.marker.model.service.MarkerService;
import com.psh.marker.model.vo.Marker;
import com.psh.movelineboard.model.servlce.MoveLineBoardService;
import com.psh.movelineboard.model.vo.MoveLineBoard;

/**
 * Servlet implementation class UpdateMoveLineBoardServlet
 */
@WebServlet("/moveLineBoard/updateMoveLineBoard.do")
public class UpdateMoveLineBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMoveLineBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		int moveLineNo=Integer.parseInt(request.getParameter("moveLineNo"));
		MoveLineBoard mlb=new MoveLineBoardService().searchMoveLineBoard(boardNo);
		List<Marker> mList=new MarkerService().searchMoveLineBoardMarker(boardNo,moveLineNo);
		
		request.setAttribute("marker", mList);
		request.setAttribute("movelineBoard", mlb);
		System.out.println(mlb);
		request.getRequestDispatcher("/views/psh_moveLineBoard/psh_moveLineBoardUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
