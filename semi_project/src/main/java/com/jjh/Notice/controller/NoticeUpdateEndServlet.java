package com.jjh.Notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjh.Notice.model.dao.MemberNoticeDao;
import com.jjh.Notice.model.service.MemberNoticeService;
import com.jjh.Notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateEndServlet
 */
@WebServlet("/notice/updateNoticeEnd.do")
public class NoticeUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		int no=Integer.parseInt(request.getParameter("noticeNo"));
		String title=(String)request.getParameter("title");
		String writer=(String)request.getParameter("writer");
		String content=(String)request.getParameter("content");
		
		Notice n =Notice.builder()
				.noticeNo(no)
				.noticeTitle(title)
				.noticeWriter(writer)
				.noticeContent(content)
				.build();
		
		int result=new MemberNoticeService().updateNotice(n);
		
		String msg="", loc="";
		if(result>0) {
			msg="수정이 되었습니다.";
			loc="/notice/noticeListView.do";
		}else {
			msg="삭제가 실패되셨습니다.";
			loc="/notice/updateNotice.do";
			
			
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
