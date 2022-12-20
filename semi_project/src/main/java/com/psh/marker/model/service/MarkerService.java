package com.psh.marker.model.service;

import java.sql.Connection;
import java.util.List;

import static com.jjh.common.JDBCTemplate.*;

import com.psh.marker.model.dao.MarkerDao;
import com.psh.marker.model.vo.Marker;

public class MarkerService {
	private MarkerDao dao=new MarkerDao();
	
	public List<Marker> searchMoveLineMarker(int movelineNo) {
		Connection conn=getConnection();
		List<Marker> m=dao.searchMoveLineMarker(conn,movelineNo);
		close(conn);
		return m;
	}
	public List<Marker> searchMoveLineBoardMarker(int boardNo,int moveLineNo){
		Connection conn=getConnection();
		List<Marker> mList=dao.searchMoveLineBoardMarker(conn, boardNo, moveLineNo);
		close(conn);
		return mList;
	}
}