package com.kjh.travelBoard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjh.member.model.vo.Member;
import com.kjh.admin.model.vo.Tag;
import com.kjh.travelBoard.model.service.TravelBoardService;
import com.kjh.travelBoard.model.vo.TravelBoard;

/**
 * Servlet implementation class TravelBoardTagSearchServlet
 */
@WebServlet("/travelboard/travelboardtagsearch.do")
public class TravelBoardTagSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelBoardTagSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage;
		int numPerpage=6;
		
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		Member m=(Member)request.getSession().getAttribute("loginMember");
		String userId="";
		if(m!=null) {
			userId=m.getUserId();
		}

		String tagTitles=request.getParameter("tagTitle");
		System.out.println("검색 태그들 : "+tagTitles);
		String[] tagArr=tagTitles.split(" ");
		
		List<String> tagTitleList=new ArrayList();
		tagTitleList = new ArrayList<>(Arrays.asList(tagArr));
		
		List<String> removed = new ArrayList<>();
		
		for(String st:tagTitleList){
			int su = Collections.frequency(tagTitleList, st);
			System.out.println(st+":"+su);
			if(su%2==0){
				removed.add(st);
			}
		}
		tagTitleList.removeAll(removed);
		System.out.println("tagTitleList : "+tagTitleList);
		
		if(tagTitleList.isEmpty()) {
			request.getRequestDispatcher("/travelboard/travelboardmain.do").forward(request, response);
			return;
		}
		
		List<TravelBoard> boards=new TravelBoardService().searchTagBoards(tagTitleList, cPage,numPerpage,userId);
		
		int totalData=new TravelBoardService().searchTagBoardsCount(tagTitleList);
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()
			+"?tagTitle="+tagTitles+"&&cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getRequestURL()
				+"?tagTitle="+tagTitles+"&&cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()
			+"?tagTitle="+tagTitles+"&&cPage="+pageNo+"'>[다음]</a>";
		}
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("boards", boards);
		
		List<Tag> tags=new TravelBoardService().searchTagList();
		request.setAttribute("tags", tags);
		
		request.getRequestDispatcher("/views/kjh_travelBoard/travelBoardMainList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
