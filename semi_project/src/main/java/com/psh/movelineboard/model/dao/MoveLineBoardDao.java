package com.psh.movelineboard.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.jjh.common.JDBCTemplate.*;

import com.psh.marker.model.vo.Marker;
import com.psh.moveline.model.dao.MoveLineDao;
import com.psh.moveline.model.vo.MoveLine;
import com.psh.movelineboard.model.vo.Comment;
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
	
	public int insertComment(Connection conn,Comment c) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertComment"));
			pstmt.setInt(1, c.getBoardNo());
			pstmt.setString(2, c.getUserId());
			pstmt.setInt(3, c.getMoveLineBoardlevel());
			pstmt.setString(4, c.getCommentContent());
			pstmt.setString(5, c.getCommentRef()==0?null
					:String.valueOf(c.getCommentRef()));
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateComment(Connection conn,Comment c) {
		System.out.println(c.getCommentContent());
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateComment"));
			pstmt.setString(1, c.getCommentContent());
			pstmt.setInt(2, c.getCommentNo());
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteComment(Connection conn,Comment c) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteComment"));
			pstmt.setInt(1, c.getCommentNo());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}
	
	public List<Comment> searchComment(Connection conn, int boardNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Comment> cList=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchComment"));
			
			pstmt.setInt(1, boardNo); 
			 
			rs=pstmt.executeQuery();
			while(rs.next()) {
				cList.add(getComment(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return cList;
	}
	
	public int searchInsertComment(Connection conn,Comment c) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Comment comment=new Comment();
		int commentNo=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchInsertComment"));
			pstmt.setInt(1, c.getBoardNo());
			pstmt.setString(2, c.getUserId());
			pstmt.setInt(3, c.getMoveLineBoardlevel());  
			pstmt.setString(4, c.getCommentContent()); 
			rs=pstmt.executeQuery();
		
			if(rs.next()) {
				commentNo=rs.getInt("max(comment_No)");
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return commentNo;
	}
	
	public Comment endSearchInsertComment(Connection conn,int commentNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Comment comment=new Comment();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("endSearchInsertComment"));
			pstmt.setInt(1, commentNo);
			rs=pstmt.executeQuery();
		
			if(rs.next()) {
				comment=getComment(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return comment;
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
	
	private Comment getComment(ResultSet rs) throws SQLException{
		return Comment.builder()
				.boardNo(rs.getInt("board_No"))
				.commentNo(rs.getInt("comment_No"))
				.userId(rs.getString("user_Id"))
				.moveLineBoardlevel(rs.getInt("moveline_board_level"))
				.commentContent(rs.getString("comment_content"))
				.commentRef(rs.getInt("comment_ref"))
				.commentEnroll(rs.getDate("comment_Enroll"))
				.build();
	}
}
