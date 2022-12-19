package com.jjh.memberInfo.model.service;

import static com.jjh.common.JDBCTemplate.close;
import static com.jjh.common.JDBCTemplate.commit;
import static com.jjh.common.JDBCTemplate.getConnection;
import static com.jjh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.jjh.member.model.vo.Member;
import com.jjh.memberInfo.model.dao.MemberDao;

public class MemberServlce {
	
	public int memerUpdate(Member m) {
		Connection conn=getConnection();
		int result=new MemberDao().memerUpdate(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}

}
