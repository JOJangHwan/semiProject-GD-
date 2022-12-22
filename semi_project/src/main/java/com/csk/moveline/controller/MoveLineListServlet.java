package com.csk.moveline.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.csk.moveline.service.MoveLineService;
import com.jjh.member.model.vo.Member;
import com.psh.moveline.model.vo.MoveLine;


/**
 * Servlet implementation class MoveLineListServlet
 */
@WebServlet("/moveLine/movelineList.do")
public class MoveLineListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveLineListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage;
		int numPerpage=20;
		
		Member m=(Member)request.getSession().getAttribute("loginMember");
		
		String userId="";
	    if(m!=null) {
	    	userId=m.getUserId();
	    }

		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		List<MoveLine> movelines=new MoveLineService().selectMoveLineList(cPage,numPerpage,userId);
		
		int totalData=new MoveLineService().selectMoveLineListCount();
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		 
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()
			+"?cPage="+(pageNo-1)+"&?id="+userId+"'>[이전]</a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getRequestURL()
				+"?cPage="+pageNo+"&?id="+userId+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()
			+"?cPage="+pageNo+"&?id="+userId+"'>[다음]</a>";
		}
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("movelines", movelines);
		request.getRequestDispatcher("/views/csk_moveline/movelineList.jsp").forward(request, response);

		System.out.println(pageBar);
	}
	


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
