package com.kjh.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kjh.admin.model.vo.Tag;
import com.kjh.travelBoard.model.service.TravelBoardService;
import com.kjh.travelBoard.model.vo.TravelBoard;

/**
 * Servlet implementation class AdminTravelBoardUpdateServlet
 */
@WebServlet("/admin/travelboardupdate.do")
public class AdminTravelBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTravelBoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		TravelBoard board=new TravelBoardService().selectTravelBoard(boardNo);
		request.setAttribute("board", board);
		List<Tag> tags=new TravelBoardService().searchTagList();
		request.setAttribute("tags", tags);
		
		request.getRequestDispatcher("/views/kjh_travelBoard/travelBoardUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
