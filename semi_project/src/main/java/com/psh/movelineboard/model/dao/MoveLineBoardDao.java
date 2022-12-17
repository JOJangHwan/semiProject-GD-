package com.psh.movelineboard.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.jjh.common.JDBCTemplate.*;

import com.psh.marker.model.vo.Marker;
import com.psh.moveline.model.dao.MoveLineDao;
import com.psh.moveline.model.vo.MoveLine;
import com.psh.movelineboard.model.vo.MoveLineBoard;

public class MoveLineBoardDao {
private Properties sql=new Properties();
	
	public MoveLineBoardDao() {
		try {
			String path=MoveLineBoardDao.class
					.getResource("/sql/pshdev_movelineboard/movelineboard_sql.properties")
					.getPath();
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMoveLineBoard(Connection conn,MoveLineBoard mlb) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertMLB"));
			pstmt.setInt(1, mlb.getMovelineNo());
			pstmt.setString(2, mlb.getUserId());
			pstmt.setString(3, mlb.getBoardTitle());
			pstmt.setString(4, mlb.getBoardContent());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public MoveLineBoard searchMoveLineBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MoveLineBoard mlb=new MoveLineBoard();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchMLB"));
			pstmt.setInt(1, boardNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mlb=getMoveLineBoard(rs);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return mlb;
	}
	
	public int updatetMoveLineBoard(Connection conn,MoveLineBoard mlb) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateMLB"));
			//pstmt.setInt(1, mlb.getMovelineNo());
			pstmt.setString(1, mlb.getUserId());
			pstmt.setString(2, mlb.getBoardTitle());
			pstmt.setString(3, mlb.getBoardContent());
			pstmt.setInt(4, mlb.getBoardNo());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deletetMoveLineBoard(Connection conn,int boardNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteMLB"));
			//pstmt.setInt(1, mlb.getMovelineNo());
			pstmt.setInt(1, boardNo);
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
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
