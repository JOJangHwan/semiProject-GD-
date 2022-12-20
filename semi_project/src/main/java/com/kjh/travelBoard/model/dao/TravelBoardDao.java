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

import com.kjh.admin.model.vo.Tag;
import com.kjh.admin.model.vo.TravelPick;
import com.kjh.travelBoard.model.vo.TravelBoard;

import oracle.jdbc.internal.OraclePreparedStatement;

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
	
	public List<TravelBoard> searchTagBoards(Connection conn, List tagTitleList, int cPage, int numPerpage){ //태그로 찾은 보드 반환, 보드 검색.
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String arrData="";
		for(int i=0; i<tagTitleList.size(); i++) {
			if(i==0) {
				arrData+="'"+tagTitleList.get(i)+"'";
			}else {
				arrData+=",'"+tagTitleList.get(i)+"'";
			}
		}
		System.out.println("searchTagBoards arrData : "+arrData);
		
		List<TravelBoard> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchTagBoards").replace("#DATA", arrData));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, (cPage*numPerpage));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getTravelBoardWithoutCon(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
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
	
	public int searchTagBoardsCount(Connection conn, List tagTitleList) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String arrData="";
		for(int i=0; i<tagTitleList.size(); i++) {
			if(i==0) {
				arrData+="'"+tagTitleList.get(i)+"'";
			}else {
				arrData+=",'"+tagTitleList.get(i)+"'";
			}
		}
		System.out.println("arrData : "+arrData);
		
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchTagBoardsCount").replace("#DATA", arrData));
			rs=pstmt.executeQuery();
			if(rs.next())result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
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
	
	public int boardPickChange(Connection conn, String userId, int boardNo, char pick) { //찜 여부 변경하기
		PreparedStatement pstmt=null;
		int result=0;
		try {
			if(pick=='Y') {
				pstmt=conn.prepareStatement(sql.getProperty("deleteTravelPick"));
				pstmt.setInt(1, boardNo);
				pstmt.setString(2, userId);
			}else if(pick=='N') {
				pstmt=conn.prepareStatement(sql.getProperty("insertTravelPick"));
				pstmt.setInt(1, boardNo);
				pstmt.setString(2, userId);
			}
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public TravelBoard selectTravelBoard(Connection conn, int boardNo) { //boardNo로 하나 보드만 가져오기
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		TravelBoard board=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectBoard"));
			pstmt.setInt(1, boardNo);
			rs=pstmt.executeQuery();
			if(rs.next()) board=getTravelBoard(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return board;
	}
	
	public List<TravelBoard> selectTravelBoard(Connection conn, String boardTitle) { //보드 타이틀로 보드 리스트 가져오기
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<TravelBoard> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchBoardTitleList"));
			pstmt.setString(1, boardTitle);
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
	
	public int insertTravelBoard(Connection conn, TravelBoard board) { // 새로운 TravelBoard 게시글 삽입하기.
		PreparedStatement pstmt=null;
		OraclePreparedStatement opstmt = null;    
		int result=0;
		try {
			opstmt=(OraclePreparedStatement)conn.prepareStatement(sql.getProperty("insertBoard"));
			opstmt.setString(1, board.getBoardTitle());
			opstmt.setString(2, board.getThumbFilename());
			opstmt.setStringForClob(3, board.getBoardContent());
			result=opstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(opstmt);
			close(pstmt);
		}return result;
	}
	
	public int insertTravelBoardTag(Connection conn, Tag tag) { //새로운 게시글에 포함된 tag들로 BoardTag 삽입하기.
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertBoardTag"));
			pstmt.setInt(1, tag.getBoardNo());
			pstmt.setInt(2, tag.getTagNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int updateTravelBoard(Connection conn, TravelBoard board) { //보드 정보 업데이트.
		PreparedStatement pstmt=null;
		OraclePreparedStatement opstmt = null;    
		int result=0;
		try {
			if(board.getThumbFilename()!=null) {
				opstmt=(OraclePreparedStatement)conn.prepareStatement(sql.getProperty("updateBoardFile"));
				opstmt.setString(1, board.getBoardTitle());
				opstmt.setString(2, board.getThumbFilename());
				opstmt.setStringForClob(3, board.getBoardContent());
				opstmt.setInt(4, board.getBoardNo());
			}else {
				opstmt=(OraclePreparedStatement)conn.prepareStatement(sql.getProperty("updateBoard"));
				opstmt.setString(1, board.getBoardTitle());
				opstmt.setStringForClob(2, board.getBoardContent());
				opstmt.setInt(3, board.getBoardNo());
			}
			result=opstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(opstmt);
			close(pstmt);
		}return result;
	}
	
	public int deleteBoardTagAll(Connection conn, TravelBoard board) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteBoardTagAll"));
			pstmt.setInt(1, board.getBoardNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int deleteBoardTagAll(Connection conn, int boardNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteBoardTagAll"));
			pstmt.setInt(1, boardNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int deleteTravelBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteTravelBoard"));
			pstmt.setInt(1, boardNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
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
				userId(rs.getString("user_id")).
				boardTitle(rs.getString("board_title")).
				boardEnroll(rs.getDate("board_enroll")).
				thumbFilename(rs.getString("thumb_filename")).
				tempYn(rs.getString("temp_yn").charAt(0)).
				openYn(rs.getString("open_yn").charAt(0)).
				boardContent(rs.getString("board_content")).
				build();
	}
	
	private TravelBoard getTravelBoardWithoutCon(ResultSet rs) throws SQLException{ //보드 객체 빌더
		return TravelBoard.builder().
				boardNo(rs.getInt("board_no")).
				userId(rs.getString("user_id")).
				boardTitle(rs.getString("board_title")).
				boardEnroll(rs.getDate("board_enroll")).
				thumbFilename(rs.getString("thumb_filename")).
				tempYn(rs.getString("temp_yn").charAt(0)).
				openYn(rs.getString("open_yn").charAt(0)).
				build();
	}
	
	
	private TravelPick getTravelPick(ResultSet rs) throws SQLException{
		return TravelPick.builder().
				boardNo(rs.getInt("board_no")).
				userId(rs.getString("user_id")).
				build();
	}
}
