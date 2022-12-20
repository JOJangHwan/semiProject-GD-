package com.psh.movelineboard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
	private int commentNo;
	private int boardNo;
	private String userId;
	private int moveLineBoardlevel;
	private String commentContent;
	private int commentRef;
	private Date commentEnroll;
	
}
