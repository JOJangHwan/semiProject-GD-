package com.jjh.loginMember.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjh.loginMember.model.service.GoogleMailService;
import com.jjh.loginMember.model.service.LoginMemberService;
import com.jjh.member.model.vo.Member;

/**
 * Servlet implementation class SearchPasswordEndServlet
 */
@WebServlet("/search/searchPasswordEnd.do")
public class SearchPasswordEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPasswordEndServlet() {
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
		String phone =request.getParameter("phone");
		String email=request.getParameter("email");
		
		System.out.println("userId"+userId);
		
		Member m=Member.builder()
				.userId(userId)
				.phone(phone)
				.email(email)
				.build();
		Member checkM= new LoginMemberService().searchpassword(m);
		
		String msg="",loc="",password="";
		System.out.println(checkM);
		if(checkM!=null) {
			msg="비밀번호을 등록 이메일로 발송했습니다.";
			password=new GoogleMailService().GooMail(checkM);
			loc="/";
		}else {
			msg="비밀번호 찾기가 실패했습니다. 다시시도해주세요";
			loc="/search/searchPasswor.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		System.out.println(password);
		
		int result=new LoginMemberService().passWordUpdate(password,userId);
		if(result>0) {
			System.out.println("업데이트 성공");
		}else {
			System.out.println("업데이트 실패");
		}
		
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
