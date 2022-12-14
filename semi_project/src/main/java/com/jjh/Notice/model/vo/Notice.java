package com.jjh.Notice.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


@Data
@Builder
public class Notice {
	
	private int noticeNo;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeEnroll;

}
