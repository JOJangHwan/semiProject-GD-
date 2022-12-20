package com.csk.moveline.service;

import static com.kjh.common.JDBCTemplate.close;
import static com.kjh.common.JDBCTemplate.commit;
import static com.kjh.common.JDBCTemplate.getConnection;
import static com.kjh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.csk.moveline.model.dao.MoveLineDao;
import com.psh.moveline.model.vo.MoveLine;

public class MoveLineService {
private MoveLineDao dao=new MoveLineDao();
	
	public List<MoveLine> selectMoveLineList(int cPage, int numPerpage, String userId){
		Connection conn=getConnection();
		List<MoveLine> list=dao.selectMoveLineList(conn,cPage,numPerpage,userId);
		close(conn);
		return list;
	}
	
	public int selectMoveLineListCount() {
		Connection conn=getConnection();
		int result=dao.selectMoveLineListCount(conn);
		close(conn);
		return result;
	}

	

	


}
