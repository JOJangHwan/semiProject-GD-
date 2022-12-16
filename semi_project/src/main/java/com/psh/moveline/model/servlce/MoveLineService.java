package com.psh.moveline.model.servlce;

import java.sql.Connection;
import java.util.List;

import static com.jjh.common.JDBCTemplate.*;

import com.psh.moveline.model.dao.MoveLineDao;
import com.psh.moveline.model.vo.MoveLine;

public class MoveLineService {
	private MoveLineDao dao=new MoveLineDao();
	
	public MoveLine searchMoveLine(int movelineNo) {
		Connection conn=getConnection();
		MoveLine ml=dao.searchMoveLine(conn,movelineNo);
		close(conn);
		return ml;
	}
}
