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
import com.psh.movelineboard.model.vo.MoveLineBoard;

import static com.jjh.common.JDBCTemplate.*;

public class MarkerDao {
private Properties sql=new Properties();
	
	public MarkerDao() {
		try {
			String path=MarkerDao.class
					.getResource("/sql/pshdev_marker/marker_sql.properties")
					.getPath();
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Marker> searchMoveLineMarker(Connection conn,int movelineNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Marker> m=new ArrayList();
		MoveLine ml=new MoveLine();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchMarker"));
			pstmt.setInt(1, movelineNo);
			pstmt.setInt(2, movelineNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				m.add(getMoveLineMarker(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return m;
	}
	
	public List<Marker> searchMoveLineBoardMarker(Connection conn,int boardNo,int moveLineNo){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Marker> m=new ArrayList();
		MoveLineBoard mlb=new MoveLineBoard();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchMLBMarker"));
			pstmt.setInt(1, moveLineNo);
			pstmt.setInt(2, moveLineNo);
			pstmt.setInt(3, boardNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				
				m.add(getMoveLineBoardMarker(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return m;
	}
	
	
	private Marker getMoveLineMarker(ResultSet rs) throws SQLException {
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
				.ml(getMoveLine(rs))
				.build();
	}
	
	private Marker getMoveLineBoardMarker(ResultSet rs) throws SQLException {
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
				.mlb(getMoveLineBoard(rs))
				.build();
	}
	
	private MoveLine getMoveLine(ResultSet rs)throws SQLException{
		return MoveLine.builder()
				.movelineNo(rs.getInt("moveline_No"))
				.userId(rs.getString("user_Id"))
				.tripdateFinish(rs.getDate("tripdate_Finish"))
				.tripdateStart(rs.getDate("tripdate_Start"))
				.movelineName(rs.getString("moveline_Name"))
				.openandclosed(rs.getString("open_And_Closed").charAt(0))
				.movelineEnroll(rs.getDate("moveline_Enroll"))
				.build();	
	}
	
	private MoveLineBoard getMoveLineBoard(ResultSet rs) throws SQLException{
		return MoveLineBoard.builder()
				.movelineNo(rs.getInt("moveline_No"))
				.userId(rs.getString("user_Id"))
				.boardNo(rs.getInt("board_No"))
				.boardTitle(rs.getString("board_Title"))
				.boardContent(rs.getString("board_Content"))
				.boardEnroll(rs.getDate("board_Enroll"))
				.build();
	}
}
