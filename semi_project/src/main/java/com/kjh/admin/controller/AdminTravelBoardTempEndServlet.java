package com.kjh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kjh.admin.model.vo.Tag;
import com.kjh.travelBoard.model.service.TravelBoardService;
import com.kjh.travelBoard.model.vo.TravelBoard;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class AdminTravelBoardTempEndServlet
 */
@WebServlet("/admin/travelboardtempend.do")
public class AdminTravelBoardTempEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTravelBoardTempEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect(request.getContextPath());
		}else {
			String path=request.getServletContext().getRealPath("/upload/kjh_travelBoard/postThumbImages");
			
			int maxSize=1024*1024*10;//10MB
			String encoding="UTF-8";
			DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
			
			//매개변수있는 생성자로 MultipartRequest클래스를 생성
			MultipartRequest mr=new MultipartRequest(request, 
						path,maxSize,encoding,dfr);
			
			//클라이언트가 보낸 데이터를 DB에 저장하는 기능
			//파일을 저장하면서 재정의된 파일명을 저장해야한다.
			String title=mr.getParameter("titleInput");
			String content=mr.getParameter("editordata");
			String tagStr=mr.getParameter("selectedTags");
			System.out.println("제목 : "+title);
			System.out.println("본문 : "+content);
			System.out.println("태그들 : "+tagStr);
			//파일이름 리네임된 파일이름!
			String thumbFilename=mr.getFilesystemName("upFile");
			List<Tag> tagList=new ArrayList();
			
			if(tagStr!=null&&!tagStr.equals("")&&!tagStr.equals(" ")) {
				String[] strArr=tagStr.split(",");
				List<String> tags = new ArrayList<>(Arrays.asList(strArr));
				
				for(String t:tags) {
					String t2=t.replace('✕', ' ');
					Tag tg=Tag.builder().tagTitle(t2.trim()).build();
					tagList.add(tg);
				}
				
				TravelBoard board=
						TravelBoard.builder().
						boardTitle(title).
						boardContent(content).
						thumbFilename(thumbFilename).
						build();
					
					int result=new TravelBoardService().insertTempBoard(board, tagList);
					
					if(result==1) {
						System.out.println("등록 성공");
					}else{
						System.out.println("등록 실패"); 
					}
					
					TravelBoard targetTb=new TravelBoardService().selectTravelBoard(board);
					
					request.setAttribute("board", targetTb);
					request.getRequestDispatcher("/views/kjh_travelBoard/travelBoardPost.jsp").forward(request, response);
				
			}else {
				System.out.println("tag가 null입니다. 등록 실패");
				request.getRequestDispatcher("/travelboard/travelboardmain.do").forward(request, response);
			} 
			
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
