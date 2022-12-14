package com.jjh.questions.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Questions {
	private int questionsNo;
	private String questionsWriter;
	private String questionsTitle;
	private String questionsContent;
	private Date questionsEnroll;
	private char openAndclose;

}
