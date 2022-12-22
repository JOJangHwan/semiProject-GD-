package com.psh.movelineboard.model.servlce;

import com.psh.marker.model.vo.Marker;
import com.psh.movelineboard.model.dao.MoveLineBoardDao;
import com.psh.movelineboard.model.vo.Comment;
import com.psh.movelineboard.model.vo.MoveLineBoard;
import static com.jjh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;


public class MoveLineBoardService {
	
	private MoveLineBoardDao dao=new MoveLineBoardDao();
	
	public int insertMoveLineBoard(MoveLineBoard mlb) {
		Connection conn=getConnection();
		int result=dao.insertMoveLineBoard(conn,mlb);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	
	public MoveLineBoard searchMoveLineBoard(int boardNo) {
		Connection conn=getConnection();
		MoveLineBoard mlb=dao.searchMoveLineBoard(conn,boardNo);
		close(conn);
		return mlb;
	}
	
	public int updatetMoveLineBoard(MoveLineBoard mlb) {
		Connection conn=getConnection();
		int result=dao.updatetMoveLineBoard(conn,mlb);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	
	public int deletetMoveLineBoard(int boardNo) {
		Connection conn=getConnection();
		int result=dao.deletetMoveLineBoard(conn,boardNo);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	
	public Comment insertComment(Comment c) {
		Connection conn=getConnection();
		int result=dao.insertComment(conn,c);
		if(result>0) {
			commit(conn);
			Comment ic=new MoveLineBoardService().searchInsertComment(c);
			return ic;
		}
		else rollback(conn);
		Comment ic=null;
		return ic;
	}
	
	public int updateComment(Comment c) {
		Connection conn=getConnection();
		int result=dao.updateComment(conn,c);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	
	public int deleteComment(Comment c) {
		Connection conn=getConnection();
		int result=dao.deleteComment(conn,c);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	
	public List<Comment> searchComment(int boardNo){
		Connection conn=getConnection();
		List<Comment> cList=dao.searchComment(conn,boardNo);
		close(conn);
		return cList;
	}
	
	public Comment searchInsertComment(Comment c) {
		Connection conn=getConnection();
		int commentNo=dao.searchInsertComment(conn,c);
		Comment comment=null;
		if(commentNo!=0) {
			comment=dao.endSearchInsertComment(conn, commentNo);
		}else {
			System.out.println("^^..인서트 안됨");
		}
		close(conn);
		return comment;
	}
	
	public int insertPick(Comment c) {
		Connection conn=getConnection();
		int result=dao.insertPick(conn,c);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	
	public int deletePick(Comment c) {
		Connection conn=getConnection();
		int result=dao.deleteComment(conn,c);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	
}
