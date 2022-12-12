package com.kjh.travelBoard.model.dao;

import static com.kjh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kjh.admin.model.vo.BoardTag;
import com.kjh.admin.model.vo.Tag;
import com.kjh.admin.model.vo.TravelPick;
import com.kjh.travelBoard.model.vo.TravelBoard;

public class TravelBoardDao {
	private Properties sql=new Properties();
	
	public TravelBoardDao() {
		String path=TravelBoardDao.class
				.getResource("/sql/kjhdev_travelboard/travelboard_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Tag> searchTagList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Tag> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchTagList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getTag(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public List<TravelBoard> searchTravelBoardList(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<TravelBoard> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchTravelBoardList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, (cPage*numPerpage));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getTravelBoard(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int searchTravelBoardCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchTravelBoardCount"));
			rs=pstmt.executeQuery();
			if(rs.next())result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public List<BoardTag> searchTravelBoardTag(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoardTag> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchTravelBoardTag"));
			rs=pstmt.executeQuery();
			while(rs.next()) list.add(getBoardTag(rs));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public List<TravelPick> searchTravelPick(Connection conn){
		return null;
	}
	
	private Tag getTag(ResultSet rs) throws SQLException{
		return Tag.builder().tagNo(rs.getInt("tag_no"))
				.tagTitle(rs.getString("tag_title"))
				.build();
	}
	
	private TravelBoard getTravelBoard(ResultSet rs) throws SQLException{
		return TravelBoard.builder().
				boardNo(rs.getInt("board_no")).
				userNo(rs.getString("user_no")).
				boardContent(rs.getString("board_content")).
				boardEnroll(rs.getDate("board_enroll")).
				tempYn(rs.getString("temp_yn").charAt(0)).
				openYn(rs.getString("open_yn").charAt(0)).
				boardTitle(rs.getString("board_title")).
				thumbFilename(rs.getString("thumb_filename")).
				build();
	}
	
	private BoardTag getBoardTag(ResultSet rs) throws SQLException{
		return BoardTag.builder()
				.boardNo(rs.getInt("board_no"))
				.tagNo(rs.getInt("tag_no"))
				.build();
	}
}
