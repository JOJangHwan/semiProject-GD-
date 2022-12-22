package com.csk.movelineboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csk.movelineboard.service.MoveLineBoardService;
import com.jjh.member.model.vo.Member;

import com.psh.movelineboard.model.vo.MoveLineBoard;

/**
 * Servlet implementation class MoveLineBoardServlet
 */
@WebServlet("/moveLineBoard/boardlist.do")
public class MoveLineBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveLineBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage;
		int numPerpage=6;
		
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
//		Member m=(Member)request.getSession().getAttribute("loginMember");
//		String userId="";
//		if(m!=null) {
//			userId=m.getUserId();
//		}
		List<MoveLineBoard> boards=new MoveLineBoardService().seleceBoardListAll(cPage,numPerpage);
		
		int totalData=new MoveLineBoardService().selectBoardCount();
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()
			+"?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getRequestURL()
				+"?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()
			+"?cPage="+pageNo+"'>[다음]</a>";
		}
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("boards", boards);
		request.getRequestDispatcher("/views/csk_movelineboard/recMoveLineBoard.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
