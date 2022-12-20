package com.jjh.memberInfo.model.dao;

import static com.jjh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.jjh.loginMember.model.dao.LoginMemberdao;
import com.jjh.member.model.vo.Member;

public class MemberDao {
	private Properties sql=new Properties();
	public MemberDao() {
		// TODO Auto-generated constructor stub
		try {
			String path=LoginMemberdao.class
					.getResource("/sql/memberinfo/memberinfo_sql.properties")
					.getPath();
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int memerUpdate(Connection conn , Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateMember"));
			//pstmt.setString(1, m.getUserId());
			//pstmt.setString(1, m.getPassword());
			pstmt.setString(1, m.getPhone());
			pstmt.setInt(2, m.getAge());
			pstmt.setString(3, m.getAddress());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getNickName());
			pstmt.setString(6, String.valueOf(m.getGender()));
			pstmt.setString(7, m.getUserId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
	public int updatepassword(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updatepassword"));
			pstmt.setString(1, m.getPassword());
			pstmt.setString(2, m.getUserId());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4,m.getPhone());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

}
