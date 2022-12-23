package com.jjh.loginMember.controller;

import java.io.IOException;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;
import com.jjh.loginMember.model.service.LoginMemberService;
import com.jjh.member.model.vo.Member;

/**
 * Servlet implementation class KakaologinServlet
 */
@WebServlet("/login/kakaologin.do")
public class KakaologinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaologinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Member m=new Member();
	String result=request.getParameter("result");
	String account=request.getParameter("account");
	String authObj=request.getParameter("authObj");
	String nickName=request.getParameter("nickName");
	
	System.out.println("처음");
	System.out.println("ac"+account);
	System.out.println("re"+result);
	System.out.println("au"+authObj);
	JSONObject o =new JSONObject();
	
	
	String accessToken="";
	String userid="";
	String gender1="";
	char gender2=' ';
	
	String email="";
	String age="";
	
	

	
	try {
		JSONParser jsonParser =new JSONParser();
		JSONObject jsonobjectResult =(JSONObject)jsonParser.parse(result);
		System.out.println(jsonobjectResult);
		JSONObject jsonobjectAccount =(JSONObject)jsonParser.parse(account);
		JSONObject jsonobjectAuthObj =(JSONObject)jsonParser.parse(authObj);
		System.out.println("profile");
		jsonobjectResult.get("profile");
		System.out.println((JSONObject)jsonobjectResult.get("profile"));
		
//		String accessToken=(String)jsonParser.parse("access_token");
		accessToken=(String)jsonobjectAuthObj.get("access_token"); 
		userid=String.valueOf(jsonobjectResult.get("id"));
		gender1=(String)jsonobjectAccount.get("gender");
		
		if(gender1.equals("male")) {
			gender2='남';
		}else {
			gender2='여';
		}
		email=(String)jsonobjectAccount.get("email");
		age=(String)jsonobjectAccount.get("age_range");
		
		System.out.println(gender2+" "+email+" "+age);
		JSONObject profile=(JSONObject)jsonobjectAuthObj.get("profile"); 
		//String pro= (String)jsonobjectResult.get("properties");
		System.out.println("실행 안되니?");
		System.out.println();
		
		System.out.println("토큰");
		System.out.println(accessToken);
		System.out.println("유저아이디");
		System.out.println(userid);
		System.out.println("프로파일");
		System.out.println(profile);
		System.out.println("제발!!!!!!!!!!");
		Map data=new Gson().fromJson(account, Map.class);
		System.out.println(data.get("profile"));
		System.out.println(data.get("profile"));
		
		
	
		
		
	
		
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	
	Member m=Member.builder()
			.userId(userid)
			.email(email)
			.gender(gender2)
			.nickName(nickName)
			.build();
	
	String msg="", loc="";
	
	Member mID=new LoginMemberService().searchMemberId(userid);
	
	HttpSession session=request.getSession();
	
	String csv="";
	if(mID!=null) {
		session.setAttribute("loginMember", m);
		response.sendRedirect(request.getContextPath());
		
		csv="1";
		System.out.println(csv);
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(csv);

	}else {
		
		int result1= new LoginMemberService().kakaoInsertMember(m);
		if(result1>0) {
			session.setAttribute("loginMember", m);
			msg="회원가입을 축하드립니다!";
			loc="/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			csv="2";
			System.out.println(csv);
			response.setContentType("text/csv;charset=utf-8");
			response.getWriter().print(csv);
			return;
		}else {
			msg="회원가입을 실패했습니다. 다시 시도해주세요";
			loc="/login.do";	
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			
			csv="3";
			System.out.println(csv);
			response.setContentType("text/csv;charset=utf-8");
			response.getWriter().print(csv);
			return;
		}
	}
	
	
//	request.setAttribute("msg", msg);
//	request.setAttribute("loc", loc);
//	
//	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
