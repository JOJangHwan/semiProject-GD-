package com.psh.moveline.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psh.marker.model.service.MarkerService;
import com.psh.marker.model.vo.Marker;
import com.psh.moveline.model.servlce.MoveLineService;
import com.psh.moveline.model.vo.MoveLine;

/**
 * Servlet implementation class SearchMoveLineServlet
 */
@WebServlet("/searchMoveLine/searchMoveLine.do")
public class SearchMoveLineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMoveLineServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//내 동선 리스트에서 상세화면 이동
		//번호로 조회 출력
		int movelineNo=Integer.parseInt(request.getParameter("movelineNo"));
		MoveLine ml=new MoveLineService().searchMoveLine(movelineNo);
		List<Marker> mList=new MarkerService().searchMoveLineMarker(movelineNo);
		System.out.println(movelineNo);
		System.out.println(ml);
		System.out.println(mList);
		request.setAttribute("mList", mList);
		request.setAttribute("moveline", ml);
		request.getRequestDispatcher("/views/psh_moveLine/psh_moveLineView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
