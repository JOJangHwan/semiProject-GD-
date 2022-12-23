package com.psh.moveline.model.servlce;

import java.sql.Connection;
import java.sql.Date;
import java.util.List;

import static com.jjh.common.JDBCTemplate.*;

import com.psh.moveline.model.dao.MoveLineDao;
import com.psh.moveline.model.vo.MoveLine;

public class MoveLineService {
	private MoveLineDao dao=new MoveLineDao();
	
	public MoveLine searchMoveLine(int movelinNo) {
		Connection conn=getConnection();
		MoveLine ml=dao.searchMoveLine(conn,movelinNo);
		close(conn);
		return ml;
	}
	
}
