package com.psh.marker.model.service;

import java.sql.Connection;
import java.util.List;

import static com.jjh.common.JDBCTemplate.*;

import com.psh.marker.model.dao.MarkerDao;
import com.psh.marker.model.vo.Marker;

public class MarkerService {
	private MarkerDao dao=new MarkerDao();
	
	public List<Marker> searchMarker(int movelineNo) {
		Connection conn=getConnection();
		List<Marker> m=dao.searchMarker(conn,movelineNo);
		close(conn);
		return m;
	}
	
}