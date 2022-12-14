package com.jjh.questions.model.dao;

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

import com.jjh.questions.model.vo.Questions;

public class QuestionDao {
	private Properties sql=new Properties();
	public QuestionDao() {
		// TODO Auto-generated constructor stub
		try {
			String path= QuestionDao.class
					.getResource("/sql/questions/questions.properties")
					.getPath();
			sql.load(new FileReader(path));
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Questions> searchQuestions(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Questions> list = new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchQuestions"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(QuestionDao.getquestions(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}return list;
		
	}
	
	public int searchQuestionsCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchQuestionsCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) count=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
	}
	
	public static Questions getquestions(ResultSet rs) throws SQLException{
		return Questions.builder()
				.questionsNo(rs.getInt("questions_no"))
				.questionsWriter(rs.getString("questions_writer"))
				.questionsTitle(rs.getString("questions_title"))
				.questionsContent(rs.getString("questions_content"))
				.questionsEnroll(rs.getDate("questions_enroll"))
				.openAndclose(rs.getString("open_and_closed").charAt(0))
				.build();
	}

}
