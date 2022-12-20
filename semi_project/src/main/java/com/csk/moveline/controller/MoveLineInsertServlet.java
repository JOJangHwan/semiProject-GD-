package com.csk.moveline.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psh.moveline.model.vo.MoveLine;

/**
 * Servlet implementation class MoveLineInsertSerblet
 */
@WebServlet("/moveLine/movelineinsert.do")
public class MoveLineInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveLineInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		private int movelineNo;
//		private String userId;
//		private Date tripdateStart;
//		private Date tripdateFinish;
//		private String movelineName;
//		private char openandclosed;
//		private Date movelineEnroll;
		MoveLine ml = MoveLine.builder()
				.userId(request.getParameter("userId"))
				.movelineName(request.getParameter("movelineName"))
				
				.build();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
