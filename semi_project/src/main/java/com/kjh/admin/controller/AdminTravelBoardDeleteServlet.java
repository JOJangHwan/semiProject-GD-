package com.kjh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kjh.travelBoard.model.service.TravelBoardService;
import com.kjh.travelBoard.model.vo.TravelBoard;

/**
 * Servlet implementation class AdminTravelBoardDeleteServlet
 */
@WebServlet("/admin/travelboarddelete.do")
public class AdminTravelBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTravelBoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		int result=new TravelBoardService().deleteTravelBoard(boardNo);
		if(result==1) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
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
