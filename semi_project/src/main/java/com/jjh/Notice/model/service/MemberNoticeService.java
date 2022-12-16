package com.jjh.Notice.model.service;

import static com.jjh.common.JDBCTemplate.close;
import static com.jjh.common.JDBCTemplate.commit;
import static com.jjh.common.JDBCTemplate.getConnection;
import static com.jjh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.jjh.Notice.model.dao.MemberNoticeDao;
import com.jjh.Notice.model.vo.Notice;
import com.jjh.questions.model.dao.QuestionDao;
import com.jjh.questions.model.vo.Questions;

public class MemberNoticeService {
	
	private MemberNoticeDao mnDao=new MemberNoticeDao();
	
	public List<Notice> searchNotice(int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<Notice> list= mnDao.searchNotice(conn, cPage, numPerpage);
		close(conn);
		return list;
		
		
		
	}
	
	public int searchNoticeCount() {
		Connection conn=getConnection();
		int result=mnDao.searchNoticeCount(conn);
		close(conn);
		return result;
	}
	
	public Notice searchNoticeNo(int No) {
		Connection conn=getConnection();
		Notice n=mnDao.searchNoticeNo(conn, No);
		close(conn);
		return n;
		
	}
	
	public int insertNotice(Notice n) {
		Connection conn=getConnection();
		int result=new MemberNoticeDao().insertNotice(conn, n);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
		
	}
	
	public int selectNoticeDelete(String[] open) {
		Connection conn=getConnection();
		int result=new MemberNoticeDao().selectNoticeDelete(conn, open);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
