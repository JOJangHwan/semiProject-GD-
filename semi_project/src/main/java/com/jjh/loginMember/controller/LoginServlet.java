package com.jjh.loginMember.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.jjh.loginMember.model.service.LoginMemberService;
import com.jjh.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="login",urlPatterns="/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String userId= request.getParameter("loginId");
		String password=request.getParameter("password");
		JSONObject o=new JSONObject();
		//o=(JSONObject)request.getParameter("kakao");
		System.out.println(o.toJSONString());
		Member m=new LoginMemberService().searchMember(userId,password);
		
		String saveId=request.getParameter("saveId");
		if(saveId!=null) {
			Cookie c =new Cookie("saveId", userId);
			c.setMaxAge(60*60*24*7);
			response.addCookie(c);
		}else {
			Cookie c= new Cookie("saveId", "");
			c.setMaxAge(0);
			response.addCookie(c);
		}
		
		/*
		 * if(m!=null) { if(!m.getUserId().equals("admin")) { HttpSession
		 * session=request.getSession(); session.setAttribute("loginMember", m);
		 * response.sendRedirect(request.getContextPath()); }else { HttpSession
		 * session=request.getSession(); session.setAttribute("loginMember", m);
		 * response.sendRedirect(request.getContextPath()+
		 * "/views/jjh_adminPage/adminPage.jsp"); }
		 * 
		 * }else { request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다.");
		 * request.setAttribute("loc", "/login/loginView.do");
		 * request.getRequestDispatcher("/views/common/msg.jsp").forward(request,
		 * response); }
		 */
		
		if(m!=null) {
			if(m.getUserId().equals("admin")) {
				//로그인 성공
				HttpSession session=request.getSession();
				session.setAttribute("loginMember", m);
				//응답할 페이지를 구성 -> jsp
				request.getRequestDispatcher("/views/jjh_adminPage/adminPage.jsp").forward(request, response);
				
			}
			else {
				//로그인 성공
				HttpSession session=request.getSession();
				session.setAttribute("loginMember", m);
				//응답할 페이지를 구성 -> jsp
				response.sendRedirect(request.getContextPath());
			}
			
		}else {
			//로그인 실패
			request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다");
			request.setAttribute("loc","/");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
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
