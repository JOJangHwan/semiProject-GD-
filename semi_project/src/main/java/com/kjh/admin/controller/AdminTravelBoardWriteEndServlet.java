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
 * Servlet implementation class AdminTravelBoardWriteEndServlet
 */
@WebServlet("/admin/travelboardwriteend.do")
public class AdminTravelBoardWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTravelBoardWriteEndServlet() {
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
		//2. 요청방식이 맞는다면 
		// cos.jar에서 제공하는 클래스를 이용해서 지정된
		// 위치에 전송된 파일을 저장
		//MultipartRequest클래스 이용! 
		// -> 자동으로 전달된 파일을 지정된 위치에 저장
		//MultiparRequest클래스 매개변수있는 생성자를 이용하면됨.
		//첫번째 매개변수 : HttpServletRequest객체
		//두번째 매개변수 : 저장위치설정(String) *절대경로로 가져옴
		//세번째 매개변수 : 업로드된 파일의 최대크기설정(int)
		//네번째 매개변수 : 인코딩방식(String) * UTF-8
		//다번째 매개변수 : rename규칙클래스 *적용 기본클래스 제공/커스터마이징가능
			//저장할 위치설정하기
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
			
			if(tagStr!=null) {
				String[] strArr=tagStr.split(",");
				List<String> tags = new ArrayList<>(Arrays.asList(strArr));
				
				for(String t:tags) {
					Tag tg=Tag.builder().tagTitle(t.trim()).build();
					tagList.add(tg);
				}
			}else {
				System.out.println("tag가 null입니다.");
			}
			
			TravelBoard board=
				TravelBoard.builder().
				boardTitle(title).
				boardContent(content).
				thumbFilename(thumbFilename).
				build();
				
			
			int result=new TravelBoardService().insertTravelBoard(board, tagList);
			
			if(result==1) {
				System.out.println("등록 성공");
			}else{
				System.out.println("등록 실패"); 
			}
			
			TravelBoard targetTb=new TravelBoardService().selectTravelBoard(board);
			
			request.setAttribute("board", targetTb);
			request.getRequestDispatcher("/views/kjh_travelBoard/travelBoardPost.jsp").forward(request, response);
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
