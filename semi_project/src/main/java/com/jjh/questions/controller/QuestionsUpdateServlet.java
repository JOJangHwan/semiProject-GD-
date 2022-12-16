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
 * Servlet implementation class QuestionsUpdateServlet
 */
@WebServlet("/questions/updateQuestions.do")
public class QuestionsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionsUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int no=Integer.parseInt(request.getParameter("questionsNo"));
		
		Questions q=new QuestionService().searchQuestionNo(no);
		request.setAttribute("Question", q);
		
		request.getRequestDispatcher("/views/jjh_questions/questionsUpdateView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
