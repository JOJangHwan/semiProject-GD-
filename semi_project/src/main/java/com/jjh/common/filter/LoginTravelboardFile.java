//package com.jjh.common.filter;
//
//import java.io.IOException;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import com.jjh.member.model.vo.Member;
//
///**
// * Servlet Filter implementation class LoginTravelboardFile
// */
//@WebFilter("/travelboard/*")
//public class LoginTravelboardFile extends HttpFilter implements Filter {
//       
//    /**
//     * @see HttpFilter#HttpFilter()
//     */
//    public LoginTravelboardFile() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see Filter#destroy()
//	 */
//	public void destroy() {
//		// TODO Auto-generated method stub
//	}
//
//	/**
//	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
//	 */
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//		// TODO Auto-generated method stub
//		// place your code here
//
//		// pass the request along the filter chain
//		HttpSession session=((HttpServletRequest)request).getSession(false);
//		Member loginMember=(Member)session.getAttribute("loginMember");
//		if(loginMember!=null) {
//			//로그인을 했다... 회원보기 요청한 아이디랑 일치하면....
//			//화면보여줘
//			chain.doFilter(request, response);
//		}else {
//			request.setAttribute("msg", "로그인을 하세요 :(");
//			request.setAttribute("loc", "/");
//			request.getRequestDispatcher("/views/common/msg.jsp")
//			.forward(request, response);
//		}
//		chain.doFilter(request, response);
//	}
//
//	/**
//	 * @see Filter#init(FilterConfig)
//	 */
//	public void init(FilterConfig fConfig) throws ServletException {
//		// TODO Auto-generated method stub
//	}
//
//}
