package com.psh.movelineboard.model.vo;

import java.sql.Date;

import com.psh.moveline.model.vo.MoveLine;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MoveLineBoard {
	private int movelineNo;
	private int userNo;
	private String thumbFileName;
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date boardEnroll;
	
}
