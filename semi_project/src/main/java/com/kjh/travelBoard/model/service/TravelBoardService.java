package com.kjh.travelBoard.model.service;

import static com.kjh.common.JDBCTemplate.close;
import static com.kjh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kjh.admin.model.vo.BoardTag;
import com.kjh.admin.model.vo.Tag;
import com.kjh.admin.model.vo.TravelPick;
import com.kjh.travelBoard.model.dao.TravelBoardDao;
import com.kjh.travelBoard.model.vo.TravelBoard;

public class TravelBoardService {
	private TravelBoardDao dao=new TravelBoardDao();
	
	public List<TravelBoard> searchTravelBoardList(int cPage, int numPerpage, String userId){
		Connection conn=getConnection();
		List<TravelBoard> list=dao.searchTravelBoardList(conn, cPage, numPerpage);
		
		for(TravelBoard tb:list) {
			List<Tag> tags=dao.searchTagBoardList(conn, tb.getBoardNo());
			tb.setTags(tags);
			System.out.println(tags);
		}
		
		for(TravelBoard tb:list) {
			int result=dao.searchTravelBoardPick(conn, userId, tb.getBoardNo());
			System.out.println("result : "+result);
			char pick=' ';
			if(result!=0)pick='Y';
			else pick='N';
			tb.setTravelPick(pick);
			System.out.println("pick : "+pick);
		}
		
		close(conn);
		return list;
	}
	
	public TravelBoard selectTravelBoard(int boardNo) {
		Connection conn=getConnection();
		TravelBoard board=dao.selectTravelBoard(conn, boardNo);
		
		List<Tag> tags=dao.searchTagBoardList(conn, board.getBoardNo());
		board.setTags(tags);
		System.out.println(tags);
		
		int result=dao.searchTravelBoardPick(conn, board.getUserId(), board.getBoardNo());
		System.out.println("result : "+result);
		char pick=' ';
		if(result!=0)pick='Y';
		else pick='N';
		board.setTravelPick(pick);
		System.out.println("pick : "+pick);
		
		close(conn);
		return board;
	}
	
	public int insertTravelBoard(TravelBoard board) {
		Connection conn=getConnection();
		int result=dao.insertTravelBoard(conn,board);
		close(conn);
		return result;
	}
	
	public int insertTravelBoardTag(TravelBoard board) {
		Connection conn=getConnection();
		int result=dao.insertTravelBoardTag(conn,board);
		close(conn);
		return result;
	}
	
	
	public int searchTravelBoardCount() {
		Connection conn=getConnection();
		int result=dao.searchTravelBoardCount(conn);
		close(conn);
		return result;
	}
	
	public List<Tag> searchTagList(){
		Connection conn=getConnection();
		List<Tag> list=dao.searchTagList(conn);
		close(conn);
		return list;
	}
	
	public int boardPickChange(String userId, int boardNo, char pick) {
		Connection conn=getConnection();
		int result=dao.boardPickChange(conn, userId, boardNo, pick);
		close(conn);
		return result;
	}
}
