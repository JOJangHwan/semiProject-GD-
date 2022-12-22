package com.jjh.mypick.model.service;

import static com.jjh.common.JDBCTemplate.close;
import static com.jjh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jjh.Notice.model.vo.Notice;
import com.jjh.mypick.model.dao.MypickDao;
import com.kjh.travelBoard.model.vo.TravelBoard;

public class MypickService {
	
	public List<TravelBoard> searchPick(int cPage,int numPerage, String userId){
		Connection conn=getConnection();
		List<TravelBoard> list= new MypickDao().searchPick(conn, cPage, numPerage, userId);
		close(conn);
		return list;
	}

	public int searchMyPickCount(String userId) {
		Connection conn=getConnection();
		int result=new MypickDao().searchMyPickCount(conn, userId);
		close(conn);
		return result;
	}
}
