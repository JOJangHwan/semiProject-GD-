package com.psh.movelineboard.model.servlce;

import com.psh.marker.model.vo.Marker;
import com.psh.movelineboard.model.dao.MoveLineBoardDao;
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
	
}
