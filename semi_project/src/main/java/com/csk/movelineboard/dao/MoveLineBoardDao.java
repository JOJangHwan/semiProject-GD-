package com.csk.movelineboard.dao;

import static com.jjh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.csk.moveline.model.dao.MoveLineDao;
import com.psh.moveline.model.vo.MoveLine;
import com.psh.movelineboard.model.vo.MoveLineBoard;

public class MoveLineBoardDao {

		private Properties sql = new Properties();	
		
		
		public MoveLineBoardDao() {
			String path = MoveLineDao.class.getResource("/sql/csk_moveline/moveline_sql.properties").getPath();
			try {
				sql.load(new FileReader(path));
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		public List<MoveLineBoard> seleceBoardListAll(Connection conn, int cPage, int numPerpage) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<MoveLineBoard> list = new ArrayList();
			try {
				pstmt = conn.prepareStatement(sql.getProperty("selectBoardListAll"));
				pstmt.setInt(1,(cPage-1)*numPerpage+1);
				pstmt.setInt(2,(cPage*numPerpage));
				rs = pstmt.executeQuery();
				while(rs.next()) {
					list.add(getMoveLineBoard(rs));
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return list;
		}
		public int selectBoardCount(Connection conn) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int result = 0;
			try {
				pstmt=conn.prepareCall(sql.getProperty("selectBoardListCount"));
				rs=pstmt.executeQuery();
				if(rs.next()) result = rs.getInt(1);
			} catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return result;
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
