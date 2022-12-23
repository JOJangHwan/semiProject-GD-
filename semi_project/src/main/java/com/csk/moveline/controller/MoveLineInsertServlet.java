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

		/*MoveLine ml = MoveLine.builder()
=======
		//INSERT INTO MOVELINE VALUES
		//(SEQ_MOVELINE_NO.NEXTVAL, 'user01', '2022-12-11' , '2022-12-12' , '걷기 여행' , 'Y' , SYSDATE );
		MoveLine ml = MoveLine.builder()
>>>>>>> branch 'master' of https://github.com/JOJangHwan/semiProject-GD-.git
				.userId(request.getParameter("userId"))
				.movelineName(request.getParameter("movelineName"))

				
				.build();*/
		int result=1;//(등록 성공 값)
		if(result==1) {
			request.getRequestDispatcher("/views/csk_moveline/movelineList.jsp").forward(request, response);
		}else {
			
		}
		request.getRequestDispatcher("/views/csk_moveline/moveline.jsp").forward(request, response);


	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
