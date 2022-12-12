package com.kjh.travelBoard.model.vo;

import java.sql.Date;
import java.util.List;

import com.kjh.admin.model.vo.Tag;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TravelBoard {
	private int boardNo;
	private String userNo;
	private String boardTitle;
	private String boardContent;
	private Date boardEnroll;
	private char tempYn;
	private char openYn;
	private String thumbFilename;
	private List<Tag> tags;
	
}
