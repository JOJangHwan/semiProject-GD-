package com.psh.marker.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.psh.marker.model.vo.Marker;
import com.psh.moveline.model.vo.MoveLine;
import static com.jjh.common.JDBCTemplate.*;

public class MarkerDao {
private Properties sql=new Properties();
	
	public MarkerDao() {
		try {
			String path=MarkerDao.class
					.getResource("/sql/pshdev_moveline/moveline_sql.properties")
					.getPath();
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Marker> searchMarker(Connection conn,int movelineNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Marker> m=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchMarker"));
			pstmt.setInt(1, movelineNo);
			pstmt.setInt(2, movelineNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				m.add(getMarker(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return m;
	}
	
	
	
	private Marker getMarker(ResultSet rs) throws SQLException {
		return Marker.builder()
				.markerNo(rs.getInt("marker_No"))
				.movelineNo(rs.getInt("moveline_No"))
				.longgitude(Double.parseDouble(rs.getString("longgitude")))
				.latitude(Double.parseDouble(rs.getString("latitude")))
				.address(rs.getString("address"))
				.memo(rs.getString("memo"))
				.movelineDay(Integer.parseInt(rs.getString("moveline_Day")))
				.placeName(rs.getString("place_Name"))
				.price(rs.getInt("price"))
				.markerTime(rs.getString("marker_Time"))
				.build();
	}
}
