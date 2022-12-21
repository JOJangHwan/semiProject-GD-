package com.jjh.loginMember.model.service;

import static com.jjh.common.JDBCTemplate.getConnection;
import static com.jjh.common.JDBCTemplate.close;
import static com.jjh.common.JDBCTemplate.commit;
import static com.jjh.common.JDBCTemplate.rollback;

import com.jjh.loginMember.model.dao.LoginMemberdao;

import java.sql.Connection;

import com.jjh.member.model.vo.Member;

public class LoginMemberService {

	private LoginMemberdao loginDao=new LoginMemberdao();
	
	public int insertMember(Member m) {
		Connection conn=getConnection();
		int result=loginDao.insertMember(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
		
	}
	
	public Member searchMember(String userId, String password) {
		Connection conn=getConnection();
		Member m=loginDao.searchMember(conn,userId,password);
		close(conn);
		return m;
	}
	
	public Member searchMemberId(String userId) {
		Connection conn=getConnection();
		Member m=loginDao.searchMemberId(conn,userId);
		close(conn);
		return m;

	}
	
	public Member searchpassword(Member m) {
		Connection conn=getConnection();
		Member M=loginDao.searchpassword(conn,m);
		close(conn);
		return m;
	}
	
	public int passWordUpdate(String password, String userId) {
		Connection conn=getConnection();
		int result=loginDao.passWordUpdate(conn, password,userId);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
}
