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
	
	public List<Tag> searchTagList(Connection conn){ //태그 전체 리스트 가져오기
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
	
	public List<Tag> searchTagBoardList(Connection conn, int boardNo){ //각 보드 태그 가져오기
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Tag> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchTagBoardList"));
			pstmt.setInt(1, boardNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getTagBoard(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int searchTravelBoardPick(Connection conn, String userId, int boardNo){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchTravelPick"));
			pstmt.setInt(1, boardNo);
			pstmt.setString(2, userId);
			rs=pstmt.executeQuery();
			if(rs.next())result=rs.getInt("board_no");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public List<TravelBoard> searchTravelBoardList(Connection conn, int cPage, int numPerpage){ //전체 보드 리스트 가져오기
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
	
	public int searchTravelBoardCount(Connection conn) { //페이징처리를 위한 카운트
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
	
	private Tag getTag(ResultSet rs) throws SQLException{ //태그 객체 빌더. board_no 포함 X
		return Tag.builder().tagNo(rs.getInt("tag_no"))
				.tagTitle(rs.getString("tag_title"))
				.build();
	}
	
	private Tag getTagBoard(ResultSet rs) throws SQLException{ // 보드에 연결된 태그 빌더. board_no 포함.
		return Tag.builder().tagNo(rs.getInt("tag_no"))
				.tagTitle(rs.getString("tag_title"))
				.boardNo(rs.getInt("board_no"))
				.build();
	}
	
	private TravelBoard getTravelBoard(ResultSet rs) throws SQLException{ //보드 객체 빌더
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
	
	private TravelPick getTravelPick(ResultSet rs) throws SQLException{
		return TravelPick.builder().
				boardNo(rs.getInt("board_no")).
				userNo(rs.getInt("board_no")).
				build();
	}
}
