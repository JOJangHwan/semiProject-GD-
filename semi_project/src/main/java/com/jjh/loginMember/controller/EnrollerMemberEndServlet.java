package com.jjh.loginMember.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjh.loginMember.model.service.LoginMemberService;
import com.jjh.member.model.vo.Member;

/**
 * Servlet implementation class EnrollerMemberEndServlet
 */
@WebServlet("/login/enrollerMemberEnd.do")
public class EnrollerMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollerMemberEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String userId=request.getParameter("userId");
		String nickName=request.getParameter("nickName");
		String password=request.getParameter("password");
		String address =request.getParameter("address");
		int age=Integer.parseInt(request.getParameter("age"));
		String email=request.getParameter("email");
		String phone =request.getParameter("phone");
		String gender=request.getParameter("gender");
		
		Member m =Member.builder()
				.userId(userId)
				.nickName(nickName)
				.password(password)
				.address(address)
				.age(age)
				.email(email)
				.phone(phone)
				.gender(gender.charAt(0))
				.build();
		
		int result= new LoginMemberService().insertMember(m);
		
		String msg="", loc="";
		if(result>0) {
			msg="회원가입을 축하드립니다!";
			loc="/";
		}else {
			msg="회원가입을 실패했습니다. 다시 시도해주세요";
			loc="/member/enrollMember.do";
			
			request.getRequestDispatcher("views/commmon/msg.jsp").forward(request, response);
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
