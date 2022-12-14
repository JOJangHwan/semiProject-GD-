package com.psh.movelineboard.controller;

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
@WebServlet("/moveLineBoard/insertMoveLineBoard.do")
public class InsertMoveLineBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMoveLineBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int movelineNo=1;//아직 값을 받아 올 수 없으므로 임시 지정
		
//		List<MoveLine> ml=(List<MoveLine>)new MoveLineService().searchMoveLine(movelineNo);
		List<Marker> mList=(List<Marker>)new MarkerService().searchMarker(movelineNo);
//		request.setAttribute("moveline", ml);
		request.setAttribute("marker", mList);
		
		String p;
		List position=new ArrayList<>();
		for(Marker m:mList) {
			for(int i=0;i<mList.size();i++) {
				if(m.getMovelineDay().equals("1")) {
					p=m.getLonggitude()+", "+m.getLatitude();
					position.add(p);
			}
				
			}
			
			
		}
		request.setAttribute("position", position);
		System.out.println(position);
		
		request.getRequestDispatcher("/views/psh_moveLineBoard/psh_MoveLineBoardWrite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
