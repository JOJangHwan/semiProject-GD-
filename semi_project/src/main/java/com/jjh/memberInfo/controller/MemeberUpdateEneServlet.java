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
 * Servlet implementation class MemeberUpdateEneServlet
 */
@WebServlet("/member/memeberUpdateEnd.do")
public class MemeberUpdateEneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemeberUpdateEneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String userId=(String)request.getParameter("userId");
		String nickName=(String)request.getParameter("nickName");
		//String password=(String)request.getParameter("password");
		int age=Integer.parseInt(request.getParameter("age"));
		String address=(String)request.getParameter("address");
		String email=(String)request.getParameter("email");
		String phone=(String)request.getParameter("phone");
		String gender=(String)request.getParameter("gender");
		System.out.println(userId+nickName+age+address+email+phone+gender);
		
		Member m= Member.builder()
				.userId(userId)
				.nickName(nickName)
				//.password(password)
				.address(address)
				.age(age)
				.email(email)
				.phone(phone)
				.gender(gender.charAt(0))
				.build();
		
		int result =new MemberServlce().memerUpdate(m);
		
		
				
		String msg="", loc="";
		
		if(result>0) {
			msg="회원 정보를 수정합니다.";
			loc="/member/memberInfo.do";
			request.getSession().setAttribute("loginMember", m);
		}else {
			msg="회원정보 수정을 실패했습니다.";
			loc="/member/memeberUpdate.do";
			
			
			
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
