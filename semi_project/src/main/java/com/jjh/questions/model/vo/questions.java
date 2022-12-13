package com.jjh.questions.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class questions {
	private int questionsNo;
	private String questionsWriter;
	private String questionsTitle;
	private String questionsContent;
	private Date questionsEnroll;
	private char openAndclose;

}
