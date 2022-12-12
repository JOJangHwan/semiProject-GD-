package com.jjh.loginMember.model.dao;

//import static com.jjh.common.JDBCTemplate.getConnection;
import static com.jjh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.jjh.member.model.vo.Member;

public class LoginMemberdao {
	private Properties sql=new Properties();
	
	public LoginMemberdao() {
	// TODO Auto-generated constructor stub
		try {
			String path=LoginMemberdao.class
					.getResource("/sql/driver/driver.properties")
					.getPath();
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertMemer"));
			pstmt.setString(1, m.getUserId());
			pstmt.setString(1,m.getPassword());
			pstmt.setString(3, m.getPhone());
			pstmt.setInt(4, m.getAge());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getNickName());
			pstmt.setString(8, String.valueOf(m.getGender()));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
	
	private static Member getMember(ResultSet rs)throws SQLException{
		return Member.builder()
				.userNo(rs.getInt("user_no"))
				.userId(rs.getString("user_id"))
				.password(rs.getString("user_pwd"))
				.phone(rs.getString("user_phone"))
				.age(rs.getInt("user_age"))
				.email(rs.getString("user_email"))
				.nickName(rs.getString("user_nickname"))
				.gender(rs.getString("user_gender").charAt(0))
				.enrollDate(rs.getDate("user_enroller_date"))
				.address(rs.getString("user_address"))
				.build();
	}

}
