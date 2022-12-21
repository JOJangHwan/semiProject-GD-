package com.jjh.memberInfo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjh.member.model.vo.Member;
import com.jjh.memberInfo.model.service.MemberServlce;

/**
 * Servlet implementation class UpdatepasswordEnd
 */
@WebServlet("/member/updatepasswordEnd.do")
public class UpdatepasswordEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatepasswordEnd() {
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
		String chpassword=request.getParameter("chpassword");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		
		Member m=Member.builder()
				.userId(userId)
				.password(chpassword)
				.email(email)
				.phone(phone)
				.build();
		int result=new MemberServlce().updatepassword(m);
		
		String msg="", loc="";
		if(result>0) {
			msg="비밀번호를 수정합니다.";
			loc="/member/memberInfo.do";
			request.getSession().setAttribute("loginMember", m);
		}else {
			msg="비밀번호수정을 실패했습니다.";
			loc="/member/passwordUpdate.do";
			
			
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
