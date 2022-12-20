package com.psh.moveline.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psh.moveline.model.servlce.MoveLineService;
import com.psh.marker.model.service.MarkerService;
import com.psh.marker.model.vo.*;
import com.psh.marker.model.vo.Marker;
import com.psh.moveline.model.vo.MoveLine;

/**
 * Servlet implementation class InsertMoveLineBoardServlet
 */
@WebServlet("/moveLine/open/and/closed.do")
public class Open_And_ClosedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Open_And_ClosedServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int movelineNo=Integer.parseInt(request.getParameter("mlDay"));//아직 값을 받아 올 수 없으므로 임시 지정
		System.out.println(movelineNo);
		MoveLine ml=(MoveLine)new MoveLineService().searchMoveLine(movelineNo);
		System.out.println(ml);
		List<Marker> mList=(List<Marker>)new MarkerService().searchMoveLineMarker(movelineNo);
		request.setAttribute("moveline", ml);
		request.setAttribute("marker", mList);
		System.out.println(mList);
		request.getRequestDispatcher("/views/psh_moveLineBoard/psh_moveLineBoardWrite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
