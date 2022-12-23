package com.jjh.adminPage.model.dao;

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


import com.jjh.member.model.vo.Member;



public class AdminDao{
	private Properties sql=new Properties();
	public AdminDao() {
		
		// TODO Auto-generated constructor stub
		try {
			String path= AdminDao.class
					.getResource("/sql/member/member_sql.properties")
					.getPath();
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Member> searchMember(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchmember"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(AdminDao.getMember(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}return list;
		
	}
	
	public int searchMemberCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchMemberCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) count=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
	}

	
	public static Member getMember(ResultSet rs) throws SQLException{
		return Member.builder()
				.userNo(rs.getShort("user_no"))
				.userId(rs.getString("user_id"))
				.password(rs.getString("user_pwd"))
				.phone(rs.getString("user_phone"))
				.age(rs.getInt("user_age"))
				.address(rs.getString("user_address"))
				.email(rs.getString("user_email"))
				.nickName(rs.getString("user_nickname"))
				.gender(rs.getString("user_gender").charAt(0))
				.enrollDate(rs.getDate("user_enroller_date"))
				.build();
	}

}
