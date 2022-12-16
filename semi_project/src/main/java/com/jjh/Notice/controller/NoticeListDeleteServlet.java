package com.jjh.Notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjh.Notice.model.service.MemberNoticeService;

/**
 * Servlet implementation class NoticeListDeleteServlet
 */
@WebServlet("/notice/noticeListDelete.do")
public class NoticeListDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] open=(String[])request.getParameterValues("open");
//		for(int i=0;i<open.length;i++) 
//		{
//			System.out.println(open[i].toString());
//		}
//		open.toString();
		int result=new MemberNoticeService().selectNoticeDelete(open);
		
		String msg="", loc="";
		if(result>0) {
			msg="삭제가 되었습니다.";
			loc="/notice/noticeListView.do";
		}else {
			msg="삭제가 실패되셨습니다.";
			loc="/notice/noticeListView.do";
			
			
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
