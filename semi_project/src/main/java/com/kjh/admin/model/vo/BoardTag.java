package com.kjh.admin.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BoardTag {
	private int boardNo;
	private int tagNo;
}
