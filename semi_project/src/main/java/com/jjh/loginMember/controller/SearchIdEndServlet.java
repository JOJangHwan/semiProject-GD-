package com.jjh.loginMember.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjh.loginMember.model.service.GoogleMailSearchId;
import com.jjh.loginMember.model.service.LoginMemberService;
import com.jjh.member.model.vo.Member;

/**
 * Servlet implementation class SearchIdEndServlet
 */
@WebServlet("/search/searchIDEnd.do")
public class SearchIdEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		
	
		Member m=Member.builder()
				.password(password)
				.phone(phone)
				.email(email)
				.build();
		
		Member checkM= new LoginMemberService().searchId(m);
		System.out.println(checkM);
		String msg="",loc="",userId="";
		System.out.println(checkM);
		if(checkM!=null) {
			msg="당신의 아이디를 메일로 발송했습니다.";
			new GoogleMailSearchId().GooMailIdSearch(checkM);
			loc="/";
		}else {
			msg="비밀번호 발송이 취소 되었다.";
			loc="/login.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		System.out.println(password);
		
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
