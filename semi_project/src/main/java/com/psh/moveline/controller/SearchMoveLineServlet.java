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
		//저장한 동선을 바로 보여주는 기능
		//인서트를 해줬다는 가정하에 진행 값 임의로 지정
		int movelineNo=Integer.parseInt(request.getParameter("mlDay"));//아직 값을 받아 올 수 없으므로 임시 지정
		System.out.println(movelineNo);
		String userId="user05";
		Date str=new Date(2022-12-5);
		Date end=new Date(2022-12-9);
		String name="크리스마스 여행";
		char yn='N';
		int result=1;//(저장 성공)
		
		//마커 위경도 메모 일차
		//슬기언니한테 위도경도 배열로받는지 뭐로 받는지 물어보기
		//받아온정보들로 쿼리문 작성해서 출력(pk로 조회하는게 아니기때문에 어떨지 모름)
		if(result>0) {
			//MoveLine ml=new MoveLineService().firstSearchMoveLine(userId,str,end,name,yn);
			//List<Marker> mList=new MarkerService().firstSearchMarker();
			request.getRequestDispatcher("/views/psh_moveLine/psh_moveLineView.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/views/psh_moveLine/psh_moveLineCalendar.jsp").forward(request, response);
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
