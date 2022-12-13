package com.psh.moveline.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.psh.marker.model.vo.Marker;
import com.psh.moveline.model.vo.MoveLine;
import static com.jjh.common.JDBCTemplate.*;

public class MoveLineDao {
private Properties sql=new Properties();
	
	public MoveLineDao() {
		try {
			String path=MoveLineDao.class
					.getResource("/sql/driver/driver.properties")
					.getPath();
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public MoveLine searchMoveLine(Connection conn,int movelineNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MoveLine ml=new MoveLine();
		Marker m=new Marker();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchMoveLine"));
			pstmt.setInt(1, movelineNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ml.builder()
				.movelineNo(rs.getInt("moveline_No"))
				.movelineName(rs.getString("moveline_Name"))
				.userNo(rs.getInt("user_No"))
				.movelineEnroll(rs.getDate("moveline_Enroll"))
				.openandclosed(rs.getString("open_And_Closed").charAt(0))
				.tripdateFinish(rs.getDate("tripdate_Finish"))
				.tripdateStart(rs.getDate("tripdate_Start"))
//				.m(m.builder()
//						.markerNo(rs.getInt("marker_No"))
//						.movelineNo(rs.getInt("moveline_No"))
//						.longgitude(rs.getString("longgitude"))
//						.latitude(rs.getString("latitude"))
//						.address(rs.getString("address"))
//						.memo(rs.getString("memo"))
//						.movelineDay(rs.getDate("moveline_Day"))
//						.placeName(rs.getString("place_Name"))
//						.price(rs.getInt("price"))
//						.markerTime(rs.getString("marker_Time"))
//						.build())
				.build();
				System.out.println(ml);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return ml;
	}
	
}
