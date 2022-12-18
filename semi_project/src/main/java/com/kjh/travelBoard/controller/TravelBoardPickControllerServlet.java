package com.kjh.travelBoard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjh.member.model.vo.Member;
import com.kjh.travelBoard.model.service.TravelBoardService;

/**
 * Servlet implementation class TravleBoardPickControllerServlet
 */
@WebServlet("/travelboard/travelboardpickcontroll.do")
public class TravelBoardPickControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelBoardPickControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m=(Member)request.getSession().getAttribute("loginMember");
		String userId="";
		if(m!=null) {
			userId=m.getUserId();
		}
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		char pick=((String)request.getParameter("pick")).charAt(0);
		System.out.println("userId : "+userId+" boardNo : "+boardNo+" pick : "+pick);
		
		int result=new TravelBoardService().boardPickChange(userId, boardNo, pick);
		if(result==1) {
			if(pick=='Y') {
				System.out.println("스크랩에서 삭제하였습니다.");
			}else {
				System.out.println("게시글을 스크랩하였습니다!");
			}
		}else if(result==0) {
			System.out.println("스크랩 내역이 변경되지 못했습니다.");
		}else {
			System.out.println("0, 1이 아님. 오류 발생");
		}
		
		request.getRequestDispatcher("/travelboard/travelboardmain.do").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
