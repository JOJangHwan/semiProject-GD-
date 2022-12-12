package com.kjh.travelBoard.model.service;

import static com.kjh.common.JDBCTemplate.close;
import static com.kjh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kjh.admin.model.vo.BoardTag;
import com.kjh.admin.model.vo.Tag;
import com.kjh.admin.model.vo.TravelPick;
import com.kjh.travelBoard.model.dao.TravelBoardDao;
import com.kjh.travelBoard.model.vo.TravelBoard;

public class TravelBoardService {
	private TravelBoardDao dao=new TravelBoardDao();
	
	public List<TravelBoard> searchTravelBoardList(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<TravelBoard> list=dao.searchTravelBoardList(conn, cPage, numPerpage);
		
		/*
		 * List<Tag> tags=dao.searchTagList(conn); List<Tag> realTags=null; for(int i=0;
		 * i<list.size(); i++) { list.get(i).setTags((List<Tag>) tags.get(i)); }
		 */
		close(conn);
		return list;
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
	
	public List<BoardTag> searchTravelBoardTag(){
		Connection conn=getConnection();
		List<BoardTag> list=dao.searchTravelBoardTag(conn);
		close(conn);	
		return list;
	}
	
	public List<TravelPick> searchTravelPick(){
		Connection conn=getConnection();
		List<TravelPick> list=dao.searchTravelPick(conn);
		close(conn);	
		return list;
	}
}
