package com.jjh.questions.model.service;

import static com.jjh.common.JDBCTemplate.close;
import static com.jjh.common.JDBCTemplate.commit;
import static com.jjh.common.JDBCTemplate.getConnection;
import static com.jjh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.jjh.Notice.model.vo.Notice;
import com.jjh.member.model.vo.Member;
import com.jjh.questions.model.dao.QuestionDao;
import com.jjh.questions.model.vo.Questions;

public class QuestionService {
	
	public List<Questions> searchQuestion(int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<Questions> list= new QuestionDao().searchQuestions(conn, cPage, numPerpage);
		close(conn);
		return list;
		
		
		
	}
	
	public int searchQuestionCount() {
		Connection conn=getConnection();
		int result=new QuestionDao().searchQuestionsCount(conn);
		close(conn);
		return result;
	}
	
	public int insertQuestion(Questions q) {
		Connection conn=getConnection();
		int result=new QuestionDao().insertQuestion(conn, q);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
		
	}

}
