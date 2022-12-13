package com.jjh.Notice.model.service;

import static com.jjh.common.JDBCTemplate.close;
import static com.jjh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jjh.Notice.model.dao.MemberNoticeDao;
import com.jjh.Notice.model.vo.Notice;

public class MemberNoticeService {
	
	private MemberNoticeDao mnDao=new MemberNoticeDao();
	
	public List<Notice> searchNotice(int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<Notice> list= mnDao.searchNotice(conn, cPage, numPerpage);
		close(conn);
		return list;
		
		
		
	}

}
