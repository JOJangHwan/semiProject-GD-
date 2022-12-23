package com.kjh.travelBoard.model.service;

import static com.kjh.common.JDBCTemplate.*;

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
	
	public List<TravelBoard> searchTagBoards(List tagTitleList, int cPage, int numPerpage, String userId){
		Connection conn=getConnection();
		List<TravelBoard> list=dao.searchTagBoards(conn, tagTitleList, cPage, numPerpage);
		
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
	
	public TravelBoard selectTravelBoard(TravelBoard board) {
		Connection conn=getConnection();
		List<TravelBoard> tb=dao.selectTravelBoard(conn, board.getBoardTitle());  //보드 정보 다시 불러오기. boardNo 필요하기 때문. 검색 기준은 타이틀.
		TravelBoard targetTb=null;
		System.out.println(tb);
		if(!tb.isEmpty()) {
			int lastIndex = tb.size()-1;
			targetTb = tb.get(lastIndex); //맨마지막으로 삽입한 보드 객체 가져옴.
		}
		
		List<Tag> tags=dao.searchTagBoardList(conn, targetTb.getBoardNo());
		targetTb.setTags(tags);
		System.out.println(tags);
		
		int result=dao.searchTravelBoardPick(conn, targetTb.getUserId(), targetTb.getBoardNo());
		System.out.println("result : "+result);
		char pick=' ';
		if(result!=0)pick='Y';
		else pick='N';
		targetTb.setTravelPick(pick);
		System.out.println("pick : "+pick);
		
		close(conn);
		return targetTb;
	}
	
	public TravelBoard selectTravelBoardWithoutTag(TravelBoard board) {
		Connection conn=getConnection();
		List<TravelBoard> tb=dao.selectTravelBoard(conn, board.getBoardTitle());  //보드 정보 다시 불러오기. boardNo 필요하기 때문. 검색 기준은 타이틀.
		TravelBoard targetTb=null;
		System.out.println(tb);
		if(!tb.isEmpty()) {
			int lastIndex = tb.size()-1;
			targetTb = tb.get(lastIndex); //맨마지막으로 삽입한 보드 객체 가져옴.
		}
		
		close(conn);
		return targetTb;
	}
	
	
	public int insertTravelBoard(TravelBoard board, List<Tag> tagList) {
		Connection conn=getConnection();
		int result=dao.insertTravelBoard(conn,board); //tag갖고 있지 않은 상태에서 보드 삽입.
		
		if(result!=1) {
			System.out.println("에러 발생 : 보드를 삽입하지 못했습니다. :(");
		}
		
		List<TravelBoard> tb=dao.selectTravelBoard(conn, board.getBoardTitle());  //보드 정보 다시 불러오기. boardNo 필요하기 때문. 검색 기준은 타이틀.
		TravelBoard targetTb=null;
		System.out.println(tb);
		if(!tb.isEmpty()) {
			int lastIndex = tb.size()-1;
			targetTb = tb.get(lastIndex); //맨마지막으로 삽입한 보드 객체 가져옴.
		}
		List<Tag> allTags=dao.searchTagList(conn); //전체 태그 정보 가져옴.
		System.out.println("마지막 삽입한 보드 넘버 : "+targetTb.getBoardNo());
		
		for(Tag tg:tagList) {
			tg.setBoardNo(targetTb.getBoardNo()); //현재 태그 리스트에 boardNo를 설정.
		}
		
		System.out.println("모든 태그 정보 : "+allTags);
		
		
		ArrayList<Tag> targetTagList = new ArrayList<Tag>(tagList);
		
		for(int i=0; i<allTags.size();i++) {
			for(int j=0; j<tagList.size(); j++) {
				
				if(allTags.get(i).getTagTitle().equals(tagList.get(j).getTagTitle().trim())) {
					targetTagList.get(j).setTagNo(allTags.get(i).getTagNo());
				}
			}
		}
		
		System.out.println("현재 보드의 tagList : "+targetTagList); 
		
		targetTb.setTags(targetTagList); //현재 삽입 중인 보드에 태그 리스트를 set
		
		for(Tag tg:targetTagList) {
			int insertResult=dao.insertTravelBoardTag(conn,tg); //boardTag 삽입.
			if(insertResult==1) {
				System.out.println("보드-태그를 삽입하였습니다. 태그 정보 = "+tg);
				commit(conn);
			}else {
				System.out.println("에러 발생 : 보드-태그를 삽입하지 못했습니다. 태그 정보 = "+tg);
				rollback(conn);
			}
		}
		
		close(conn);
		return result;
	}
	
	public int insertTempBoard(TravelBoard board, List<Tag> tagList) {
		Connection conn=getConnection();
		int result=dao.insertTempBoard(conn,board); //tag갖고 있지 않은 상태에서 보드 삽입.
		
		if(result!=1) {
			System.out.println("에러 발생 : 보드를 삽입하지 못했습니다. :(");
		}
		
		List<TravelBoard> tb=dao.selectTravelBoard(conn, board.getBoardTitle());  //보드 정보 다시 불러오기. boardNo 필요하기 때문. 검색 기준은 타이틀.
		TravelBoard targetTb=null;
		System.out.println(tb);
		if(!tb.isEmpty()) {
			int lastIndex = tb.size()-1;
			targetTb = tb.get(lastIndex); //맨마지막으로 삽입한 보드 객체 가져옴.
		}
		List<Tag> allTags=dao.searchTagList(conn); //전체 태그 정보 가져옴.
		System.out.println("마지막 삽입한 보드 넘버 : "+targetTb.getBoardNo());
		
		for(Tag tg:tagList) {
			tg.setBoardNo(targetTb.getBoardNo()); //현재 태그 리스트에 boardNo를 설정.
		}
		
		System.out.println("모든 태그 정보 : "+allTags);
		
		
		ArrayList<Tag> targetTagList = new ArrayList<Tag>(tagList);
		
		for(int i=0; i<allTags.size();i++) {
			for(int j=0; j<tagList.size(); j++) {
				
				if(allTags.get(i).getTagTitle().equals(tagList.get(j).getTagTitle().trim())) {
					targetTagList.get(j).setTagNo(allTags.get(i).getTagNo());
				}
			}
		}
		
		System.out.println("현재 보드의 tagList : "+targetTagList); 
		
		targetTb.setTags(targetTagList); //현재 삽입 중인 보드에 태그 리스트를 set
		
		for(Tag tg:targetTagList) {
			int insertResult=dao.insertTravelBoardTag(conn,tg); //boardTag 삽입.
			if(insertResult==1) {
				System.out.println("보드-태그를 삽입하였습니다. 태그 정보 = "+tg);
				commit(conn);
			}else {
				System.out.println("에러 발생 : 보드-태그를 삽입하지 못했습니다. 태그 정보 = "+tg);
				rollback(conn);
			}
		}
		
		close(conn);
		return result;
	}
	
	public int insertTempBoardWithoutTag(TravelBoard board) {
		Connection conn=getConnection();
		int result=dao.insertTempBoard(conn,board); //tag갖고 있지 않은 상태에서 보드 삽입.
		
		if(result!=1) {
			System.out.println("에러 발생 : 보드를 삽입하지 못했습니다. :(");
			rollback(conn);
		}else {
			System.out.println("보드를 삽입하였습니다. :)");
			commit(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateTravelBoard(TravelBoard board, List<Tag> tagList) {
		Connection conn=getConnection();
		
		List<Tag> allTags=dao.searchTagList(conn); //전체 태그 정보 가져옴.
		
		for(Tag tg:tagList) {
			tg.setBoardNo(board.getBoardNo()); //현재 태그 리스트에 boardNo를 설정.
		}
		
		System.out.println("모든 태그 정보 : "+allTags);
		
		ArrayList<Tag> targetTagList = new ArrayList<Tag>(tagList);
		
		for(int i=0; i<allTags.size();i++) {
			for(int j=0; j<tagList.size(); j++) {
				if(allTags.get(i).getTagTitle().equals(tagList.get(j).getTagTitle().trim())) {
					targetTagList.get(j).setTagNo(allTags.get(i).getTagNo());
				}
			}
		}
		
		System.out.println("현재 보드의 tagList : "+targetTagList);
		
		board.setTags(targetTagList); //현재 삽입 중인 보드에 태그 리스트를 set
		int deleteResult=dao.deleteBoardTagAll(conn, board);
		 
		if(deleteResult!=0) {
			for(Tag tg:targetTagList) {
				int insertResult=dao.insertTravelBoardTag(conn,tg); //boardTag 삽입.
				if(insertResult==1) {
					System.out.println("보드-태그를 삽입하였습니다. 태그 정보 = "+tg);
					commit(conn);
				}else {
					System.out.println("에러 발생 : 보드-태그를 삽입하지 못했습니다. 태그 정보 = "+tg);
					rollback(conn);
				}
			}
		}else {
			System.out.println("오류가 발생하였습니다 : 보드에 연결된 태그 삭제 실패");
		}
		
		int result=dao.updateTravelBoard(conn, board);
		
		close(conn);
		return result;
	}
	
	
	public int searchTravelBoardCount() {
		Connection conn=getConnection();
		int result=dao.searchTravelBoardCount(conn);
		close(conn);
		return result;
	}
	
	public int searchTempBoardCount() {
		Connection conn=getConnection();
		int result=dao.searchTempBoardCount(conn);
		close(conn);
		return result;
	}
	
	public int searchTagBoardsCount(List tagTitleList) {
		Connection conn=getConnection();
		int result=dao.searchTagBoardsCount(conn, tagTitleList);
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
	
	public int deleteTravelBoard(int boardNo) {
		Connection conn=getConnection();
		int result=dao.deleteBoardTagAll(conn, boardNo);
		int result2=dao.deleteTravelBoardPicks(conn,boardNo);
		int result3=dao.deleteTravelBoard(conn,boardNo);
		int result4=0;
		
		if(result!=0&&result2!=0&&result3==1) {
			commit(conn);
			result4=1;
		}else {
			rollback(conn);
			result4=0;
		}
		
		close(conn);
		return result4;
	}
	
	public List<TravelBoard> searchTempBoardList(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<TravelBoard> list=dao.searchTempBoardList(conn, cPage, numPerpage);
		
		for(TravelBoard tb:list) {
			List<Tag> tags=dao.searchTagBoardList(conn, tb.getBoardNo());
			tb.setTags(tags);
			System.out.println(tags);
		}
		
		close(conn);
		return list;
	}
}
