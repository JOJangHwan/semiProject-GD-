package com.jjh.adminPage.model.service;

import static com.jjh.common.JDBCTemplate.close;
import static com.jjh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jjh.Notice.model.vo.Notice;
import com.jjh.adminPage.model.dao.AdminDao;
import com.jjh.member.model.vo.Member;

public class AdminServce {
	public List<Member> searchMember(int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<Member> list= new AdminDao().searchMember(conn, cPage, numPerpage);
		close(conn);
		return list;
}
	public int searchMemberCount(){
		Connection conn=getConnection();
		int result=new AdminDao().searchMemberCount(conn);
		close(conn);
		return result;
	}
}