package com.jjh.questions.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjh.questions.model.service.QuestionService;
import com.jjh.questions.model.vo.Questions;

/**
 * Servlet implementation class NoticeWriteEnd
 */
@WebServlet("/questions/questionsWriteEnd.do")
public class QuestionsWriteEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionsWriteEnd() {
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
		String WriterId=(String)request.getParameter("userId");
		String open="";
		if(request.getParameter("open")==null) {
			open="N";
		}else {
			open="Y";
		}
		String content=(String)request.getParameter("content");
//		System.out.println(open);
		
		Questions q=Questions.builder()
				.questionsWriter(WriterId)
				.questionsTitle(title)
				.questionsContent(content)
				.openAndclose(open.charAt(0))
				.build();
		
		int result=new QuestionService().insertQuestion(q);
		
		
		String msg="", loc="";
		if(result>0) {
			msg="문의사항 작성이 완료되었습니다.";
			loc="/";
		}else {
			msg="문의사항 작성을실패했습니다. 다시 시도해주세요";
			loc="/questions/questionsWrite.do";
			
			
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
