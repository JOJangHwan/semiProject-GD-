package com.jjh.loginMember.model.dao;

import static com.jjh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.PseudoColumnUsage;
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
					.getResource("/sql/member/member_sql.properties")
					.getPath();
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMember(Connection conn,Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertMemer"));
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getPhone());
			pstmt.setInt(4, m.getAge());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getNickName());
			pstmt.setString(8, String.valueOf(m.getGender()));
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public Member searchMember(Connection conn,
			String userId, String password) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchIdPwd"));
			pstmt.setString(1, userId);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
	public Member searchMemberId(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchMemberId"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
			
		
	}
	
	public Member searchpassword(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchpassword"));
			pstmt.setNString(1, m.getUserId());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getEmail());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
	public int passWordUpdate(Connection conn, String password, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("passWordUpdate"));
			pstmt.setNString(1, password);
			pstmt.setString(2,userId);
			rs=pstmt.executeQuery();
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}return result;
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
