package com.jjh.Notice.model.dao;

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

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import com.jjh.Notice.model.vo.Notice;

public class MemberNoticeDao {
	private Properties sql=new Properties();
	public MemberNoticeDao() {
		// TODO Auto-generated constructor stub
		try {
			String path= MemberNoticeDao.class
					.getResource("/sql/notice/noticesql.properties")
					.getPath();
			sql.load(new FileReader(path));
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Notice> searchNotice(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Notice> list = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchNotice"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(MemberNoticeDao.getNotice(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}return list;
		
	}
	
	public int searchNoticeCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchNoticeCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) count=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
	}
	public Notice searchNoticeNo(Connection conn,int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Notice n=null;
		try {
			pstmt=conn.prepareCall(sql.getProperty("searchNoticeNo"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				n=getNotice(rs);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return n;
		
		}
	
	
	
	private static Notice getNotice(ResultSet rs) throws SQLException{
		return Notice.builder()
				.noticeNo(rs.getInt("notice_no"))
				.noticeWriter(rs.getString("notice_writer"))
				.noticeTitle(rs.getString("notice_title"))
				.noticeContent(rs.getNString("notice_content"))
				.noticeEnroll(rs.getDate("notice_enroll"))			
				.build();
	}

}
