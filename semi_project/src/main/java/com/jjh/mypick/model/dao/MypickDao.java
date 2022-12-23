package com.jjh.mypick.model.dao;

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

import com.jjh.Notice.model.dao.MemberNoticeDao;
import com.jjh.Notice.model.vo.Notice;
import com.kjh.travelBoard.model.vo.TravelBoard;

public class MypickDao {
	private Properties sql=new Properties();
	public MypickDao() {
		// TODO Auto-generated constructor stub
		try {
			String path= MemberNoticeDao.class
					.getResource("/sql/picklist/pickListsql.properties")
					.getPath();
			sql.load(new FileReader(path));
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	
	}
	
	public List<TravelBoard> searchPick(Connection conn, int cPage,int numPerpage, String userId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<TravelBoard> list = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchtravelpickList"));
			pstmt.setString(1, userId);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add( getTravelBoard(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}return list;
	}
	
	
	public int searchMyPickCount(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchMyPickCount"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) count=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
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
	}


