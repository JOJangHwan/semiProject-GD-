package com.jjh.Notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjh.Notice.model.service.MemberNoticeService;
import com.jjh.Notice.model.vo.Notice;
import com.jjh.questions.model.service.QuestionService;

/**
 * Servlet implementation class NoticeWriteEndServlet
 */
@WebServlet("/notice/noticeWriteEnd.do")
public class NoticeWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String title=(String)request.getParameter("title");
		String writer=(String)request.getParameter("userId");
		String content=(String)request.getParameter("content");
		System.out.println(writer+" "+title+" "+content);
		
		Notice n =Notice.builder()
				.noticeWriter(writer)
				.noticeTitle(title)
				.noticeContent(content)
				.build();
		
		int result=new MemberNoticeService().insertNotice(n);
		
		
		String msg="", loc="";
		if(result>0) {
			msg="공지사항 작성이 완료되었습니다.";
			loc="/";
		}else {
			msg="문의사항 작성을실패했습니다. 다시 시도해주세요";
			loc="/notice/noticewrite.do";
			
			
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
