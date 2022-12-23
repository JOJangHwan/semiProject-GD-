package com.jjh.mypick.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjh.member.model.vo.Member;
import com.jjh.mypick.model.service.MypickService;
import com.kjh.travelBoard.model.vo.TravelBoard;

/**
 * Servlet implementation class TravelpicklistServlet
 */
@WebServlet("/mypick/travelpicklist.do")
public class TravelpicklistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelpicklistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());

//		Member m=(Member)request.getSession().getAttribute("loginMember");
//		
//		String userId=m.getUserId();
		
		String userId=request.getParameter("userid");
		System.out.println("유저아이디"+userId);
		
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
	
		
		int numPerage=5;
		List<TravelBoard> n =new MypickService().searchPick(cPage,numPerage,userId);
		
		int totlaData=new MypickService().searchMyPickCount(userId);
		
		String pageBar="";
		
		int pageBarSize=5;
		int totalPage=(int)Math.ceil((double)totlaData/numPerage);
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()+"?userid="+userId
			+"&cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getRequestURL()+"?userid="+userId
				+"&cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()+"?userid="+userId
			+"&cPage="+pageNo+"'>[다음]</a>";
		}
		request.setAttribute("pageBar", pageBar);
	
		
		System.out.println(n);
		
		request.setAttribute("boards", n);
		
		request.getRequestDispatcher("/views/jjh_myPickList/travelPickListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
