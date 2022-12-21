package com.csk.moveline.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import com.psh.moveline.model.vo.MoveLine;
import com.psh.marker.model.vo.Marker;
import static com.jjh.common.JDBCTemplate.close;

public class MoveLineDao {
private Properties sql = new Properties();
	
	public MoveLineDao() {
		String path = MoveLineDao.class.getResource("/sql/csk_moveline/moveline_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<MoveLine> selectMoveLineList(Connection conn, int cPage, int numPerpage, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MoveLine> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectMoveLineList"));
			pstmt.setInt(1,(cPage-1)*numPerpage+1);
			pstmt.setInt(2,(cPage*numPerpage));
			pstmt.setString(3,(userId));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(getMoveLine(rs));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int selectMoveLineListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt=conn.prepareCall(sql.getProperty("selectMoveLineListCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	private MoveLine getMoveLine(ResultSet rs) throws SQLException {
		return MoveLine.builder()
				.movelineNo(rs.getInt("moveline_no"))
				.movelineName(rs.getString("moveline_name"))
				.userId(rs.getString("user_id"))
				.tripdateStart(rs.getDate("tripdate_start"))
				.tripdateFinish(rs.getDate("tripdate_finish"))
				.openandclosed(rs.getString("open_and_closed").charAt(0))
				.movelineEnroll(rs.getDate("moveline_enroll"))
				.build();
	}
	private Marker getMarker(ResultSet rs) throws SQLException {
		return Marker.builder()
				.markerNo(rs.getInt("marker_No"))
				.movelineNo(rs.getInt("moveline_No"))
				.longgitude(Double.parseDouble(rs.getString("longgitude")))
				.latitude(Double.parseDouble(rs.getString("latitude")))
				.address(rs.getString("address"))
				.memo(rs.getString("memo"))
				.movelineDay(rs.getString("moveline_Day"))
				.placeName(rs.getString("place_Name"))
				.price(rs.getInt("price"))
				.markerTime(rs.getString("marker_Time"))
				.build();
	}
}
