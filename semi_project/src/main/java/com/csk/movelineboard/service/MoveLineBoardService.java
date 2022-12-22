package com.csk.movelineboard.service;

import static com.kjh.common.JDBCTemplate.close;
import static com.kjh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.csk.movelineboard.dao.MoveLineBoardDao;
import com.psh.movelineboard.model.vo.MoveLineBoard;

public class MoveLineBoardService {
	private MoveLineBoardDao dao=new MoveLineBoardDao();
	public List<MoveLineBoard> seleceBoardListAll(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<MoveLineBoard> list=dao.seleceBoardListAll(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	public int selectBoardCount() {
		Connection conn=getConnection();
		int result=dao.selectBoardCount(conn);
		close(conn);
		return result;
	}

}
