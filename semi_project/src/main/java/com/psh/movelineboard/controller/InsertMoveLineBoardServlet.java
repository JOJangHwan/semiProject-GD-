package com.psh.movelineboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.psh.marker.model.service.MarkerService;
import com.psh.marker.model.vo.Marker;
import com.psh.movelineboard.model.servlce.MoveLineBoardService;
import com.psh.movelineboard.model.vo.MoveLineBoard;

/**
 * Servlet implementation class Open_And_ClosedServlet
 */
@WebServlet("/moveLineBoard/insertMoveLineBoard.do")
public class InsertMoveLineBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMoveLineBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청방식 multipart/form-data방식으로 왔는지 확인
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect(request.getContextPath());
		}else {
			//저장할 위치설정하기
			String path=request.getServletContext().getRealPath("/upload/psh_moveLineBoard");
			int maxSize=1024*1024*10;//10MB
			String encoding="UTF-8";
			DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
			MultipartRequest mr=new MultipartRequest(request, path,maxSize,encoding,dfr);
			
		int movelineNo=Integer.parseInt(mr.getParameter("mlNo"));
		String userId=mr.getParameter("mlbWriter");
		String boardTitle=mr.getParameter("mlbTitle");
		String boardContent=mr.getParameter("mlbContent");
		MoveLineBoard mlb=MoveLineBoard.builder()
				.movelineNo(movelineNo)
				.userId(userId)
				.boardTitle(boardTitle)
				.boardContent(boardContent)
				.build();
	
		List<Marker> mList=(List<Marker>)new MarkerService().searchMoveLineMarker(movelineNo);
		int result=new MoveLineBoardService().insertMoveLineBoard(mlb);
		
		if(result>0) {
			request.getRequestDispatcher("/views/psh_moveLineBoard/psh_moveLineBoardList.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/view/psh_moveLineBoard/psh_moveLineBoardWrite.jsp").forward(request, response);
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
