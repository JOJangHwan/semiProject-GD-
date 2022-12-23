package com.psh.movelineboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psh.marker.model.service.MarkerService;
import com.psh.marker.model.vo.Marker;
import com.psh.movelineboard.model.servlce.MoveLineBoardService;
import com.psh.movelineboard.model.vo.Comment;
import com.psh.movelineboard.model.vo.MoveLineBoard;

/**
 * Servlet implementation class MoveLineBoardViewServlet
 */
@WebServlet("/moveLineBoard/moveLineBoardView.do")
public class MoveLineBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveLineBoardViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		
		System.out.println(boardNo);
		
		
		//추천동선이랑 조인한 마커리스트 불러오기
		
		MoveLineBoard mlb=new MoveLineBoardService().searchMoveLineBoard(boardNo);
		int moveLineNo=mlb.getMovelineNo();
		List<Marker> mList=new MarkerService().searchMoveLineBoardMarker(boardNo,moveLineNo);
		List<Comment> cList=new MoveLineBoardService().searchComment(boardNo);
		
		//System.out.println(cList);
		System.out.println(mList);
		System.out.println(mlb);
		
		request.setAttribute("cList", cList);
		request.setAttribute("moveLineBoard", mlb);
		request.setAttribute("mList", mList);
		request.getRequestDispatcher("/views/psh_moveLineBoard/psh_moveLineBoardView.jsp").forward(request, response);
		
		//cList.forEach(v->System.out.println(v));

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
